// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNtf} from "../script/DeployBasicNtf.s.sol";
import {BasicNtf} from "../src/BasicNtf.sol";

contract BasicNtfTest is Test {
    DeployBasicNtf public deployBasicNtf;
    BasicNtf public basicNtf;

    address public USER  = makeAddr("USER");
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployBasicNtf = new DeployBasicNtf();
        basicNtf = deployBasicNtf.run();
    }

    //create test to check fi the name is correct
    function testBasicNtfName() public view {
        string memory expected = "Dogie";
        string memory actual = basicNtf.name();
        assert(
            keccak256(abi.encodePacked(expected)) ==
                keccak256(abi.encodePacked(actual))
        );
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNtf.mintNtf(PUG);

        assert(basicNtf.balanceOf(USER)==1);

        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNtf.tokenURI(0))));

    }
}
