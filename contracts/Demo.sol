//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Demo{
    uint public balance;

    //Initialize global variables
    constructor(){
        balance = 0;
    }

    //The payable keyword allows this function to accept Ether
    function contribute() public payable{
        //msg.value is the value of Ether sent in a transaction
        balance += msg.value;
    }
}