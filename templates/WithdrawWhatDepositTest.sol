// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {WithdrawWhatDepositRecipe} from "pnm-contracts/recipes/WithdrawWhatDepositRecipe.sol";

contract WithdrawWhatDepositTest is WithdrawWhatDepositRecipe {
    // MyContract myContract;

    // Define how to deploy the contract(s) to be tested
    function deploy() public override returns (address) {
        // TODO: Implemement this
        // e.g.
        // myContract = new MyContract("ETH");
        // return address(myContract);
        return address(0);
    }

    // Define how to calculate the vaule you want to check
    function getTargetBalance(address target)
        public
        override
        returns (uint256)
    {
        // TODO: Implemement this
        // e.g.
        // return address(myContract).balance + myContract.getAllTokenBalanceInEth();
        return 0;
    }

    // Define how to deposit given amount as a user
    function deposit(address user, uint256 value) public override {
        vm.startPrank(user);

        // TODO: Implemement this
        // e.g.
        // myContract.deposit(user, value);

        vm.stopPrank();
    }

    // Define how to withdraw
    function withdraw(address user, uint256 value) public override {
        vm.startPrank(user);

        // TODO: Implemement this
        // e.g.
        // myContract.withdraw(user, value);

        vm.stopPrank();
    }

    // TODO: To customize report trigerring condition, you could override following functions:
    // function checkUserFundIsSafe(address user, uint256 initValue) public override {}
}
