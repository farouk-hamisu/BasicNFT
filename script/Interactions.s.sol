//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; 
import {Script} from "forge-std/Script.sol"; 
import {BasicNFT} from "../src/BasicNFT.sol"; 
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol"; 

contract MintBasicNFT is Script {
  string public constant TOKENURI = "https://ipfs.io/ipfs/bafkreiapcq3jryfjywv27lydzpcdwuqhoskjzjcdgxgd3he5axb7d252bi"; 
  function run() external {
    address mostRecentDeployed = DevOpsTools.get_most_recent_deployment("BasicNFT", block.chainid); 
    mintNFTOnContract(mostRecentDeployed); 

  }
  function mintNFTOnContract(address nftContract) public {
    vm.startBroadcast(); 
    BasicNFT(nftContract).mintNFT(TOKENURI); 
    vm.stopBroadcast(); 
  }
}
