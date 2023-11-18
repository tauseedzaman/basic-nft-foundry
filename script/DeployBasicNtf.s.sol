// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {BasicNtf} from "../src/BasicNtf.sol";

contract DeployBasicNtf is Script {
    function run() external returns (BasicNtf) {
        vm.startBroadcast();
        BasicNtf basicNtf = new BasicNtf();
        vm.stopBroadcast();

        return basicNtf;
    }
}
