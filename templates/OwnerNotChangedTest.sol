// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {OwnerNotChangedRecipe} from "pnm-contracts/recipes/OwnerNotChangedRecipe.sol";

contract OwnerNotChangedExampleTest is OwnerNotChangedRecipe {
    // MyContract myContract;

    // Define how to deploy the contract(s) to be tested
    // Returns the one for balance checking
    function deploy() public override returns (address) {
        // TODO: Implemement this
        // e.g.
        // myContract = new MyContract("ETH");
        // return address(myContract);
        return address(0);
    }

    // Define how to get current ownership
    function getOwner() public override returns (address) {
        // TODO: Implemement this
        // e.g.
        // return myContract.owner;
        return address(0);
    }
}
