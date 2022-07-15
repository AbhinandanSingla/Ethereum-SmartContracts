//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;



contract Counter{
  //  uint count; // if we put public modifier in variable solidity itself gives us a view function to view the variable value
    uint public count = 0;
    // constructor() public{
    //     count = 0;
    // }
    // function getCount() public view returns(uint){ // view function
    //     return count;
    // } Don't needed as solidity already has given us view function for this 

    function incrementCount() public returns(uint){
        return count +=1; // write function every time this is called we have to pay some gas
    }

}
