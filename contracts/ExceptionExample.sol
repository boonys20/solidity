//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract ExceptionExample {

    mapping(address => uint256) public balanceReceived;

    function receiveMoney() public payable {
        console.log("msg.value is %s", msg.value);
        console.log("msg.sender is %s", msg.sender);
        balanceReceived[msg.sender] += msg.value;
        console.log("Sender balance is %s tokens", balanceReceived[msg.sender]);
    }

    function withDrawMoney(address payable _to, uint256 _amount) public {

        console.log("Balance in %s is %s tokens", _to, balanceReceived[_to]);
        console.log("Trying to send %s tokens to %s", _amount, _to);

        if (_amount <= balanceReceived[msg.sender]) {
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }

        console.log("Balance in %s is %s tokens", _to, balanceReceived[_to]);
    }

}
