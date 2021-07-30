//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract ExceptionExample {

    mapping(address => uint256) public balanceReceived;

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + uint256(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withDrawMoney(address payable _to, uint256 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not Enough Funds, aborting.");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

}
