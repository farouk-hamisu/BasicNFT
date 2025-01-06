//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; 
import {Test, console} from "forge-std/Test.sol"; 
import {BasicNFT} from "../src/BasicNFT.sol"; 
import {DeployBasicNFT} from "../script/DeployBasicNFT.sol"; 
contract BasicNFTTest is Test {
  DeployBasicNFT deployer; 
  BasicNFT basicNft; 
  address public  USER = makeAddr("user"); 
  string public constant TOKENURI = "ipfs://QmYf52HhUzP3j8fG2QXwAuuVE2MWqyEWzrVsdqn1ZSwXwV"; 
  function setUp() public {
    deployer = new DeployBasicNFT(); 
     basicNft = deployer.run(); 
  }
  function testNameIsCorrect() public view {
  string memory expected = "Tanjiro";
  string memory actual = basicNft.name();
  assert(keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(actual)));
 }
   function testCanMintAndHaveABalance() public {
    vm.prank(USER);
    basicNft.mintNFT(TOKENURI);
    console.log("balance of user"); 
    assert(basicNft.balanceOf(USER) == 1);
    assert(keccak256(abi.encodePacked(TOKENURI)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
  }
}
