// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract TryCatch {
    error notAllowedError(string);
    function aFunction () public pure{
        // require(false, "Error Message");
        // assert(false);
        revert notAllowedError("You are not allowed");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorCode(uint code);
    event ErrorLow(bytes lowld);
    function catchError() public {
        TryCatch trycatch = new TryCatch();
        try trycatch.aFunction() {
            //sdadadas
        }
        catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
        catch Panic(uint code) {
            emit ErrorCode(code);
        }
        catch(bytes memory _lowld){
            emit ErrorLow(_lowld);
        }
    }
}