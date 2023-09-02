//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleFallback {
    uint public lastValueSent;
    uint public myUint;
    string public lastFunctionCalled;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }
    fallback() external payable{
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}