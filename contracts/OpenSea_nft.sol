pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import"https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract NFTContracts is ERC1155,Ownable{
    uint256 public constant ARTWORK = 0;
    uint256 public constant PHOTO = 1;
    uint256 public constant NFT3 = 2;

    constructor() ERC1155("https://gqbcyfe25k4x.usemoralis.com/{id}.json"){
        _mint(msg.sender,ARTWORK,1,"");
        _mint(msg.sender,PHOTO,2,"");
        _mint(msg.sender,NFT3,3,"");


    }  
    function mint(address to,uint256 id,uint256 amount) public onlyOwner{
        _mint(to,id,amount,"");
    }   
  
  function burn(address from,uint256 id,uint256 amount) public {
            require(msg.sender==from);
            _burn(from,id,amount);
        }

}