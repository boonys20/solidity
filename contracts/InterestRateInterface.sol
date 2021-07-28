//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface InterestRateModule {
    function rate() external view;
    function calcuateInterestFor(address account, uint256 balance) external returns (uint256);
}