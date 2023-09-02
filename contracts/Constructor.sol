//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Constructor {
    address public myAddress;

    constructor(address _someAddress) {
        myAddress = _someAddress;
        
    }

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }
    function setMyAddressMsgSnd() public {
        myAddress = msg.sender;
    }
}