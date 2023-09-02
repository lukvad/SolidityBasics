// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleMapping {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public addressMapping;
    mapping(uint => mapping(uint => bool)) public UintUintBool;
    function setValue(uint _myInt) public { 
        myMapping[_myInt] = true;
    }

    function setMyAddress() public {
        addressMapping[msg.sender] = true;
    }

    function setUintUintBool (uint key1, uint key2, bool _value) public {
        UintUintBool[key1][key2] = _value;
    }
}