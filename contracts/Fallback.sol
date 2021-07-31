//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallBack {

    event log(string msg);

    fallback() external {
        emit log("fallback() is called.");
    }

    function foo() external {
        emit log("foo() is called.");
    }

}

contract Test {

    function callToFoo(address _addr) public {
        (bool success,) =  _addr.call(abi.encodeWithSignature("Foo()"));
    }

    function callToFallBack(address _addr) public {
        (bool success,) =  _addr.call(abi.encodeWithSignature("FooBoo()"));
    }
}

