// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@pwnednomore/contracts/invariants/UnprotectedOwnershipTest.sol";

// Template documentation: https://www.notion.so/pwned-no-more/Unprotected-Ownership-04238fd7dcb54c5d9a765d6609dd9662
contract UnprotectedOwnershipTestImpl is UnprotectedOwnershipTest {

    function deploy() public override {
        return;
    }

    function init() public override {
        return;
    }

    function getOwner() public view override returns (address) {
        return address(0);
    }
}
