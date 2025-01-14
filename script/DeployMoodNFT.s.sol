//SPDX-License-Identifer: MIT
pragma solidity ^0.8.20; 

import {MoodNFT} from "../src/MoodNFT.sol";
import {Script} from "forge-std/Script.sol"; 
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol"; 
contract DeployMoodNFT is Script {
  function run() external returns (MoodNFT){
    string memory sadSvg = vm.readFile("./images/Tanjirou-Kamado.svg"); 
    string memory happySvg = vm.readFile("./images/tanjiro-_1_.svg"); 
    MoodNFT moodNft = new MoodNFT(svgToImageURI(sadSvg), svgToImageURI(happySvg)); 
    return moodNft; 
  }
  function svgToImageURI(string memory svg) public pure returns (string memory){
    string memory baseURL = "data:image/svg+xml;base64,"; 
    string  memory svgBase64Encoded = Base64.encode(bytes(svg)); 
    return string(abi.encodePacked(baseURL, svgBase64Encoded)); 
  }

}
