// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {FundLossTemplate} from "pnm-contracts/templates/FundLossTemplate.sol";

contract FundLoseInvariantTest is FundLossTemplate {
    // MyContract	myContract;

    function deploy() public override returns (address) {
        // TODO: Your deployment code
        // e.g.
        // myContract = new MyContract("ETH");
        // return address(myContract);
        return address(0);
    }

    // This is where you define how to calculate the vaule you want to check
    function getTargetBalance(address target)
        public
        override
        returns (uint256)
    {
        // TODO: Define how to calculate the value you want to protect
        // e.g.
        // return address(myContract).balance + myContract.getAllTokenBalanceInEth();
        return 0;
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
        // TODO: You may want to withdraw user fund before checking the balance

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
