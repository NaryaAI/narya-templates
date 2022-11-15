// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {WithdrawWhatDepositRecipe} from "pnm-contracts/recipes/WithdrawWhatDepositRecipe.sol";

import "contracts/withdraw_what_deposit/StaxLP.sol";
import "contracts/withdraw_what_deposit/StaxLPStaking.sol";

contract WithdrawWhatDepositExampleTest is WithdrawWhatDepositRecipe {
    address owner = makeAddr("owner");
    StaxLP lpToken;
    StaxLPStaking lpStaking;

    uint256 userLpAmount = 1 ether;

    function deploy() public override returns (address) {
        // Deploy LP token and LP staking contract
        vm.startPrank(owner);
        lpToken = new StaxLP("Stax Frax/Temple LP Token", "xFraxTempleLP");
        lpStaking = new StaxLPStaking(address(lpToken), owner);
        vm.stopPrank();

        deal(address(lpToken), user, userLpAmount);

        return address(lpStaking);
    }

    function getTargetBalance(address target)
        public
        override
        returns (uint256)
    {
        return lpToken.balanceOf(target);
    }

    // Define how to deposit given amount as a user
    function deposit(address user, uint256 value) public override {
        // Stake 1 ether LP tokens
        vm.startPrank(user);
        lpToken.approve(address(lpStaking), type(uint256).max);
        lpStaking.stakeAll();
        vm.stopPrank();
    }

    // Define how to withdraw
    function withdraw(address user, uint256 value) public override {
        vm.startPrank(user);
        lpStaking.withdrawAll(false);
        vm.stopPrank();
    }
}
