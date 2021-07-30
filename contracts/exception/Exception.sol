//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Exception {

    mapping(address => uint256) public balanceReceived;

    address owner;

    constructor() {
        owner = msg.sender;
    }

    function destroySmartContract() public {
        require(msg.sender == owner, "You're not the owner.");
        selfdestruct(payable(owner));
    }

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + uint256(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withDrawMoney(address payable _to, uint256 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not Enough Funds, aborting.");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    fallback() external payable {
        receiveMoney();
    }

    receive() external payable {
        // custom function code
    }

}
