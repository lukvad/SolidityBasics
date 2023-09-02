// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Consumer {
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    function deposit() public payable {}
}

contract SmartWallet{
    address payable public owner;
    mapping (address => uint) public allowance;
    mapping (address => bool) public isAllowedToSend;
    mapping (address => bool) public guardians;
    address payable nextOwner;
    uint guardiansResetCount;
    uint public constant confirmationsFromGuardiansForReset= 3;
    mapping (address => mapping(address=>bool)) nextOwnerNotVotedBool;

    constructor() {
        owner = payable(msg.sender);
    }

    function setGuardian(address _guardian, bool _isGuardian) public {
        require (msg.sender == owner, "You are not the owner, aborting");
        guardians[_guardian] = _isGuardian;
    }

    function proposeNewOwner(address payable _newOwner) public{
        require(guardians[msg.sender], "You are not allowed to propose owner, aborting");
        require(nextOwnerNotVotedBool[_newOwner][msg.sender], "You alredy bvoted, aborting");
        if( nextOwner != _newOwner){
            nextOwner = _newOwner;
            guardiansResetCount = 0;
        }
        guardiansResetCount++;
        if(guardiansResetCount >= confirmationsFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint _amount) public{
        require(msg.sender == owner, "You are not the owner, aborting");
        allowance[_for] = _amount;
        if(_amount > 0){
            isAllowedToSend[_for] = true;
        }else {
            isAllowedToSend[_for] = false;
        }
    }


    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory){
        // require (msg.sender == owner, "You are not the owner, abort");
        if(msg.sender != owner){
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to, aborting");
            require(isAllowedToSend[msg.sender], "You are not allowed to send from this contract, aborting ");
            allowance[msg.sender] -= _amount;
        }
        (bool success, bytes memory returnData) =  _to.call{value: _amount}(_payload);
        require(success, "Aborting, call was not successful");
        return returnData;
    }

    receive() external payable {}

}