//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; 
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol"; 
contract MoodNFT is ERC721 {
  error MOODNFT_cantFlipModeIfNotOwner(); 
  string private s_sadSvgImageURI; 
  string private s_happySvgImageURI; 
  uint256 private s_tokenCounter; 
  address private owner; 
  enum Mood {
    HAPPY, 
    SAD
  }
  mapping(uint256=>Mood) private s_tokenIdToMood; 
  constructor(string memory sadSvgImageURI, string memory happySvgImageURI) ERC721("MoodNFT", "MNFT"){
    s_tokenCounter = 0; 
    s_sadSvgImageURI = sadSvgImageURI; 
    s_happySvgImageURI = happySvgImageURI; 
    owner = msg.sender; 
  }
  function mintNft() public {
    _safeMint(msg.sender, s_tokenCounter);
    s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY; 
    s_tokenCounter++;
  }
  function tokenURI(uint256 tokenId) public view override returns (string memory){
    string memory imageURI; 
    if(s_tokenIdToMood[tokenId] == Mood.HAPPY){
      imageURI = s_happySvgImageURI; }
    else {
      imageURI = s_sadSvgImageURI; 
    }
    return string(
  abi.encodePacked(
    _baseURI(),
    Base64.encode(
      bytes(
        abi.encodePacked(
          '{"name: "',
          name(),
          '", description: "An NFT that reflects your mood!", "attributes": [{"trait_type": "Mood", "value": 100}], "image": ',
          imageURI,
          '"}'
        )
      )
    )
  )
);
  }
  function _baseURI() internal pure override returns(string memory){
    return "data:application/json;base64,"; 
  }
  modifier onlyOwner(){
    if(msg.sender != owner){
      revert MOODNFT_cantFlipModeIfNotOwner(); 
    }
    _; 
  }
  function flipMood(uint256 tokenId) external onlyOwner {
    if(s_tokenIdToMood[tokenId] == Mood.HAPPY){
      s_tokenIdToMood[tokenId] = Mood.SAD; 
    }
    else {
      s_tokenIdToMood[tokenId] = Mood.HAPPY; 
    }
  }

}
