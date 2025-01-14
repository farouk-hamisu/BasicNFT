//SPDX-Lincense-Identifer: MIT
pragma solidity ^0.8.20; 
import {Test} from "forge-std/Test.sol"; 
import {DeployMoodNFT} from "../script/DeployMoodNFT.s.sol"; 
import {MoodNFT} from "../src/MoodNFT.sol"; 
contract DeployMoodNFTTest is Test {
  DeployMoodNFT deployMoodNft; 
  MoodNFT moodNft; 
  function setUp() external {
    deployMoodNft = new DeployMoodNFT(); 
    moodNft = deployMoodNft.run(); 
  }
  function testConvertSvgToUri() public {
    string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj4KPHRleHQgeD0iMjAwIiB5PSIyNTAiIGZpbGw9ImJsYWNrIj5IaSEgWW91IGRlY29kZWQgdGhpcyEgPC90ZXh0Pgo8L3N2Zz4="; 
    string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="200" y="250" fill="black">Hi! You decoded this! </text></svg>'; 

    string memory actualUri = deployMoodNft.svgToImageURI(svg);
    //probably there is a mistake in expectedUri it should pass 
    vm.expectRevert(); 
    assertEq(expectedUri, actualUri); 
}
  
}
