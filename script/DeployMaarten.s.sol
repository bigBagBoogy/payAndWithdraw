// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Maarten} from "../src/Maarten.sol";

contract DeployMaarten is Script {
    function run() external returns (Maarten) {
        vm.startBroadcast();
        Maarten maarten = new Maarten();
        vm.stopBroadcast();
        return (maarten);
    }
}
