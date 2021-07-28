//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Corebank {

  // dictionary that map address to balances
  mapping(address => uint256) public balances;

  // Users to system
  address[] public accounts;

  // Interest rate
  uint256 rate = 3;

  address public owner;

  modifier onlyOwner() {
    require(owner == msg.sender, "you're not authorize to perform this function");
    _;
  }

 constructor() public {
    owner = msg.sender;
  }

  function deposit() public payable returns (uint256) {

    if (0 == balances[msg.sender]) {
      accounts.push(msg.sender);
    }

    balances[msg.sender] += msg.value;

    return balances[msg.sender];
  }

  function withdraw(uint256 withdrawAmount) public onlyOwner returns (uint256 remainingBalance)  {
    require(balances[msg.sender] >= withdrawAmount, " Your remaining is not enough to withdraw..! ");
    balances[msg.sender] -= withdrawAmount;

    // Transfer ether back to user, revert on failed
    payable(msg.sender).transfer(withdrawAmount);


    // Return balances[msg.sender]
    remainingBalance = balances[msg.sender];

  }

  function systemBalance() public view returns (uint256) {
    return address(this).balance;
  }

  function systemWithdraw(uint256 withdrawAmount) public onlyOwner returns (uint256)  {
  
    require(withdrawAmount <= systemBalance(), "amount to withdraw is not enough!");

    // Transfer ether back to user on failed
     payable(msg.sender).transfer(withdrawAmount);
     
    return systemBalance();
  }

  function systemDeposit() public payable onlyOwner returns (uint256) {
     return systemBalance();
  }

  function payDividentPerYear() public payable onlyOwner {
     uint256 totalInterest = 0;
     for (uint256 i = 0; i < accounts.length; i++) {
        address account = accounts[i];
        //uint256 interest = calculateInterest(account, rate);
        //balances[account] += interest;
        //totalInterest += interest;
     }

     require(msg.value == totalInterest, "Not enough interest to pay");
  }

}
