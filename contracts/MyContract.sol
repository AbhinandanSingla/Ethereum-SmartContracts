//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract MyContract{
    
    // //State Variable
    // int public abc = 1;
    // int8 public abc8 = 1;
    // uint public MyUnit  = 1; // this variable will store in blockchain forever and for this we have to pay some gas
    // uint256 public myUnint256  = 1; // same as uint
    // uint8 public my8bit = 1;

    // string public myString = "My cat looks beautiful";
    // bytes32 public myByteArray = "My cat looks beautiful";

    // address public myAddress = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; // address is like a username on block 
    // //and its correspond to address for useraccoutn of wallets or smart contract etc
    
    // struct myStruct{
    //     uint id;
    //     string mystring;
    // }

    // myStruct public myStructVariable = myStruct(1,"Hello world");

    // //Arrays
    // uint[] public unintArray = [1,2,2,2,3];
    // string[] public stringArray = ["apple","baanana","carrot"];
    // string[] public stringValue;
    // uint256[][] public my2DArray = [[2,2,2],[2,3,3]];
    // function addValue(string memory _value)public{
    //     stringValue.push(_value);
    // }

    // function getLength() public view returns (uint){
    //     return stringValue.length;
    // }

    // function getValue() public pure returns (uint) { // pure means doesn't modify blockchain only fetch the data
    //     uint value = 1; // local variable    function getValue() public pure returns (uint) { // pure means doesn't modify blockchain only fetch the data
    //     return value;
    // }

    // //Mapping 
    // // mapping(key=>value) variableName;
    // mapping(uint=>string) names;
    // mapping(uint=>Personalinfo)public info;
    // mapping(address=>mapping(uint=>Personalinfo))public MapInMap;

    // constructor() {
    //     names[1] = "Abhinandan";
    //     names[2] = "Deeepak";
    //     names[3] = "Vishal";
    // }
    // struct Personalinfo {
    //     uint id;
    //     string name;
    //     string author;
    // }
    // function addPersonalInfo(uint _id,
    //     string memory _name,
    //     string memory _author) 
    //     public {
    //         info[_id] = Personalinfo(_id,_name,_author);
    //     }
    // function addMapInMap(uint _id,
    //     string memory _name,
    //     string memory _author) 
    //     public {
    //         MapInMap[msg.sender][_id] = Personalinfo(_id,_name,_author); //msg is a global variable sender is account
    //     }

    //Contional statements
    uint[] public numbers = [1,2,3,4,5,6,7,8,9];
    
    function countEvenNumbers() public view returns (uint){
    uint count = 0;
    for(uint i = 0;i<numbers.length;i++){
        if(isEvenNumber(numbers[i])){
            return count++;
        }
    }
    return count;
}

    function isEvenNumber(uint _number) public view returns (bool){
        if(_number % 2 == 0){
            return true;
        }else{
            return false;
        }
    }

}