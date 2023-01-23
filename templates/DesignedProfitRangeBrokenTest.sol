// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@pwnednomore/contracts/invariants/DesignedProfitRangeBrokenTest.sol";

// Template documentation: https://www.notion.so/pwned-no-more/Unbounded-Profit-aba3c75268134cf08c9cdae68b31ef64
contract DesignedProfitRangeBrokenTestImpl is DesignedProfitRangeBrokenTest {

    function deploy() public override {
        return;
    }

    function init() public override {
        return;
    }

    function getBalance() public view override returns (uint256) {
        return 0;
    }
}
