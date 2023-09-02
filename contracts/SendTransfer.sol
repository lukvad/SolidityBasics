// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SendTransfer {
    receive() external payable {}
    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
    }
    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10);
        require(isSent, "Sending the funds is not successful");
    }
}

contract ReceiveNoAction {
    function balance() public view returns(uint){
        return address(this).balance;
    }
    receive() external payable {}
}
contract ReceiveAction {
    uint public balanceReceived;
    receive() external payable {
        balanceReceived += msg.value;
    }
    function balance() public view returns(uint){
        return address(this).balance;
    }
}