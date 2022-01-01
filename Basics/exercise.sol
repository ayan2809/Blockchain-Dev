// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//create a contract that can store data and return the data back

//be able to do the following:
//CRUD basically but with smart contract

contract simpleStorage{
    //write all the code inside here - functions and its state

    uint storeData;
    // string names ='Bob';
    // bool switchON= true;

    function set(uint x) public {
        storeData = x * 5;
    }

    //view that tells that the function cannot modify the state
    function get() public view returns(uint) {
        return storeData;
    }

}

