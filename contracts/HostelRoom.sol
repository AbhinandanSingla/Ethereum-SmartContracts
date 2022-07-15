//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    
    //*************What we'll learn ********************//
                    //Ether payments
                    //Modifiers
                    //Visibility
                    //Events
                    //Enums
    //************************************************//

    enum Statuses{
        Vacant,
        Occupied
    }
    Statuses public currentStatus;

    event Occupy(address _occupant,uint value);
 
    address payable public owner;//etherum address of person who created the hostel room
    // payable modifier say he will receive etherum crypto currency 
    constructor (){
        owner =payable( msg.sender); // who is owner or who is deploying this function
        currentStatus = Statuses.Vacant;
    }// runs onlly onces 

     modifier onlyWhileVacant{
        // Check Status
        require(currentStatus==Statuses.Vacant,"Currently Occupied");
        _;
     }   
     modifier costs(uint _amount){
        //check Price
        // required check statement whether it true or not
        // require(1+1 ==2)
        //require(if,else)
        // if true then other lines get's executed
        require(msg.value>= _amount,"Not enough ether provided");
        _;
     }   
     
    function book() public  payable onlyWhileVacant costs(2 ether){

        currentStatus = Statuses.Occupied;
       // book the hostel room 
       //pay the person who create the smart contract ex hostelroom owner
       // owner.transfer(msg.value); // transfer sends money to recipient in this case which is owner 
        
        // call is other function we can use for tranfer
        // retrun status 
        (bool sent,bytes memory data ) = owner.call{value : msg.value}("");
        require(true); // above statement should true before going feather

        //  now where from crypto comes from its comes from person who is calling this book function
        //  msg.value the amount to crypto person is sending is stored in this global variable 
        emit Occupy(msg.sender,msg.value);
    }

}