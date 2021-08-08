//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallBack {

    event log(string msg);

    fallback() external {
        emit log("It's fallback() func.");
    }

    receive() payable external {
        emit log("It's receive() func.");
    }
    
    function foo() external {
        emit log("It's foo() func.");
    }

}

contract Test {

    function callToFoo(address _addr) public {
         _addr.call(abi.encodeWithSignature("Foo()"));
    }

    function callToFallBack(address _addr) public {
        _addr.call(abi.encodeWithSignature("FooBoo()"));
    }
}

