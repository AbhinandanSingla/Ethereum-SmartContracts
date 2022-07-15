//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract StillLearning{
    address owner;
    constructor(){
        owner = msg.sender;
    }
    function isOwner() public view returns (bool){
        return (msg.sender == owner);
    }
}