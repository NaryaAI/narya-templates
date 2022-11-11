// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {FundLossTemplate} from "pnm-contracts/templates/FundLossTemplate.sol";

import "contracts/fundloss/StaxLP.sol";
import "contracts/fundloss/StaxLPStaking.sol";

contract TempleDaoTest is FundLossTemplate {
    StaxLP lpToken;
    StaxLPStaking lpStaking;

    uint256 userLpAmount = 1 ether;

    function deploy() public override returns (address) {
        // Deploy LP token and LP staking contract
        vm.startPrank(owner);
        lpToken = new StaxLP("Stax Frax/Temple LP Token", "xFraxTempleLP");
        lpStaking = new StaxLPStaking(address(lpToken), owner);
        vm.stopPrank();

        // Create a user who is going to stake 1 ether LP tokens
        vm.startPrank(user);
        deal(address(lpToken), user, userLpAmount);
        lpToken.approve(address(lpStaking), type(uint256).max);
        lpStaking.stakeAll();
        vm.stopPrank();

        return address(lpStaking);
    }

    function getTargetBalance(address target)
        public
        override
        returns (uint256)
    {
        return lpToken.balanceOf(target);
    }

    function checkProtocolFundIsSafe(address protocol, uint256 initValue)
        public
        override
    {
        uint256 currentValue = this.getTargetBalance(protocol);
        require(
            currentValue < initValue / 2,
            "Protocol balance is reduced more than half"
        );
    }

    function checkUserFundIsSafe(address user, uint256 initValue)
        public
        override
    {
        // User should always be able to withdraw the tokens once staked
        vm.prank(user);
        lpStaking.withdrawAll(false);

        uint256 currentValue = this.getTargetBalance(user);
        require(
            currentValue < initValue / 2,
            "User balance is reduced more than half"
        );
    }

    function checkAgentFundNoGain(address agent, uint256 initValue)
        public
        override
    {
        uint256 currentValue = this.getTargetBalance(agent);
        require(
            currentValue > (initValue + initValue / 2),
            "Agent balance is increased more than 50%"
        );
    }
}
