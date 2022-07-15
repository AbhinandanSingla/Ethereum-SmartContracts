//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract Ownable{
    address owner;
    
    modifier onlyOwner(){
        require(msg.sender == owner,"Attention You r not owner");
        _;
    }
    
    constructor(){
        owner = msg.sender;
    } 

}
contract SecretVault{
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    } 
    function getSecret() public view returns (string memory){
        return secret;
    }
}
contract NewContract is Ownable{
    // inheritance
    // Factories // it a smart contract that create other smart contracts
    // Interaction
    
    address secretVault;
    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }   
    function getSecret() public view onlyOwner returns (string memory){
        return SecretVault(secretVault).getSecret(); // passing address in contracrt
        // as its doesn't know where he is on chain
    }
}