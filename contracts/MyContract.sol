//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract MyContract {
    uint256 public myUint;
    uint8 public myUint8 = 250;
    function setUint(uint _myUint) public {
        myUint = _myUint;
    }
    function increment() public {
        myUint8++;
    }
}