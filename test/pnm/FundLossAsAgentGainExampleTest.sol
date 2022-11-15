pragma solidity ^0.8.0;

import {LPC} from "contracts/fund_loss_as_agent_gain/LPX.sol";
import {FundLossRecipe} from "pnm-contracts/recipes/FundLossRecipe.sol";

contract FundLossAsAgentGainExampleTest is FundLossRecipe {
    LPC lpc;
    address rlink = 0x2fbb59aE194c9552d3bC4Aa168E9Ab684f579Fe6;

    uint256 initFund = 1 ether;

    function deploy() public override returns (address) {
        vm.createSelectFork("https://rpc.ankr.com/bsc");

        vm.prank(owner);
        lpc = new LPC(rlink);

        deal(address(lpc), agent, initFund);

        return address(lpc);
    }

    function getTargetBalance(address target)
        public
        override
        returns (uint256)
    {
        return lpc.balanceOf(target);
    }

    // Agent should not gain more than 1% without extra deposit
    function checkAgentFundNoGain(address agent, uint256 initValue)
        public
        override
    {
        uint256 currentValue = this.getTargetBalance(agent);
        require(
            currentValue < (initValue + initValue * 101 / 100),
            "Agent balance is increased more than 1%"
        );
    }
}
