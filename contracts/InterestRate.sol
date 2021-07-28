//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract InterestRate {

  using SafeMath for uint256;

  // calculate interest per year
  function calculateInterest(address user,uint256 balance, uint256 _rate) public view returns(uint256) {
     uint256 interest = balance.mul(_rate) / 100;
     return interest;
  }
}