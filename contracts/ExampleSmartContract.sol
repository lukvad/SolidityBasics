//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleSmartContract {
    uint public myStorageVariable;
    function getMyStorageVarbiable() public view returns(uint){
        return myStorageVariable;
    }
    function getAddittion(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
} 