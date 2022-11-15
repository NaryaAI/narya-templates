// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {OwnerNotChangedRecipe} from "pnm-contracts/recipes/OwnerNotChangedRecipe.sol";

import "contracts/owner_not_changed/ROIToken.sol";

contract OwnerNotChangedExampleTest is OwnerNotChangedRecipe {
    ROIToken roi;

    function deploy() public override returns (address) {
        vm.createSelectFork("https://rpc.ankr.com/bsc");

        vm.prank(owner);
        roi = new ROIToken();

        return address(roi);
    }

    function getOwner() public override returns (address) {
        return roi.owner();
    }
}
