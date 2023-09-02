//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
contract WrapAround {
    uint256 public myUint;
    uint8 public myUint8 = 2**4;
    function setUint(uint _myUint) public {
        myUint = _myUint;
    }
    function increment() public {
        myUint8++;
    }
    function decrement() public {
        unchecked{
            myUint8--;
        }
        
    }
}