// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {FundLossRecipe} from "pnm-contracts/recipes/FundLossRecipe.sol";

import "contracts/fund_loss_as_protocol_loss/Dao.sol";

contract FundLossAsProtocolLossExampleTest is FundLossRecipe {
    DAO dao;

    uint256 user_eth_amount = 1 ether;
    uint256 agent_eth_amount = 100000 wei;

    function deploy() public override returns (address) {
        dao = new DAO();

        hoax(user, user_eth_amount);
        dao.deposit{value: user_eth_amount}(user);

        hoax(agent, agent_eth_amount);
        dao.deposit{value: agent_eth_amount}(agent);

        return address(dao);
    }

    function getTargetBalance(address target)
        public
        override
        returns (uint256)
    {
        return address(target).balance;
    }

    // The vault should always have at least 1 ether.
    // Otherwise, user cannot get the fund back.
    function checkProtocolFundIsSafe(address protocol, uint256 initValue)
        public
        override
    {
        uint256 currentValue = this.getTargetBalance(protocol);
        require(
            currentValue >= user_eth_amount,
            "Protocol balance is reduced"
        );
    }
}
