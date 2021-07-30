//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThrowException {

    function aFunction() public pure {
        require(false, "Error Message");
    }

}

contract ErrorHandling {

    event ErrorLogging(string reason);

    function catchError() public {
        ThrowException exp = new ThrowException();
        try exp.aFunction() {
            // here we could do something if it works.
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
    }

}