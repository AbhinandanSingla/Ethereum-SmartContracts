//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RoboNft is ERC721, Ownable {
    uint public mintPrice;
    uint public totalSupply;//no of nfts got minted
    uint public maxSupply;// maximum no of nfts in collection
    uint public maxPerWallet; //Maximum no of nfts a wallet can mint
    bool public isPublicMintEnabled;
    string internal baseTokenUri;
    address payable public withdrawWallet;
    mapping(address => uint256) public walletMints; //how much a single wallet has minted

    constructor() payable ERC721('RoboMints', 'RM'){
        mintPrice = 0.2ether;
        totalSupply = 0;
        maxSupply = 1000;
        maxPerWallet = 3;
        // set withdraw wallet address
    }
    function setIsPublicMintEnabled(bool isPublicMintEnable_) external onlyOwner {
        isPublicMintEnabled = !isPublicMintEnable_;
    }

    function setBaseToken(string calldata baseTokenUri_) external onlyOwner {
        baseTokenUri = baseTokenUri_;
    }

    function tokenURI(uint256 tokenId_) public view override returns (string memory){
        require(_exists(tokenId_), 'Token does not exist!');
        return string(abi.encodePacked(baseTokenUri, Strings.toString(tokenId_), ".json"));
    }

    function withdraw() external onlyOwner {
        (bool success,) = withdrawWallet.call{value : address(this).balance}('');
        require(success, 'withdraw failed');
    }

    function mint(uint256 quantity_) public payable {
        require(isPublicMintEnabled, 'minting not enabled');
        require(msg.value == quantity_ * mintPrice, 'wrong mint price');
        require(totalSupply+quantity_<=maxSupply,'sold out');
        require(walletMints[msg.sender]+quantity_<=maxPerWallet,'exceed max wallet');

        for(uint256 i=0;i<=quantity_;i++){
            uint256 newTokenId = totalSupply+1;
            totalSupply++;
            _safeMint(msg.sender,newTokenId);
        }
    }
}
