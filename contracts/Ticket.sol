//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Ticket{
    event newTicket(uint ticketID, string nameTicket, string dateTicket, uint referenceTicket);

    address public owner = msg.sender;
    string public message;

    Tickets[] public tickets;


    struct Tickets{
        string nameTicket;
        string dateTicket;
        uint referenceTicket;
    }


    constructor(){
        message = "Init Contract";
        createTicket("NomTicket1", "13/11/2022", 20221113);
        createTicket("NomTicket2", "10/10/2022", 20221010);
        getTicketsCount();

        //getTicketByID(1);
        //updateTicket(1, "NomTicketUpdate", "01/01/2022", 123456);
        //deleteTicket(1);
    }

    modifier ownerOnly(){
        require(msg.sender == owner, "This function is restricted to the contract's owner");
        _;
    }

    function getMessage() public view returns(string memory){
        return message;
    }

    function setMessage(string memory _message) public ownerOnly{
        message = _message;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function setOwner(address _owner) public ownerOnly{
        owner = _owner;
    }

    //only contract owner can run
    function createTicket(string memory _nameTicket, string memory _dateTicket, uint _referenceTicket) public ownerOnly returns(Tickets memory ticket){
        tickets.push(Tickets(_nameTicket, _dateTicket, _referenceTicket));
        uint _id = tickets.length - 1;
        emit newTicket(_id, _nameTicket, _dateTicket, _referenceTicket);
        return getTicketByID(_id);
    }

    function updateTicket(uint _id, string memory _nameTicket, string memory _dateTicket, uint _referenceTicket) public ownerOnly{
        tickets[_id].nameTicket = _nameTicket;
        tickets[_id].dateTicket = _dateTicket;
        tickets[_id].referenceTicket = _referenceTicket;
    }

    function getAllTickets() public view returns(Tickets[] memory){
        return tickets;
    }

    function getTicketByID(uint _id) public view returns(Tickets memory ticket){
        return tickets[_id];
    }

    function getTicketByName(string memory _nameTicket) public view returns(string memory nameTicket, string memory dateTicket, uint referenceTicket){
        for(uint i = 0; i < tickets.length; i++){
            if(keccak256(abi.encodePacked(tickets[i].nameTicket)) == keccak256(abi.encodePacked(_nameTicket))){
                return (tickets[i].nameTicket, tickets[i].dateTicket, tickets[i].referenceTicket);
            }
        }
    }

    function getTicketByReference(uint _referenceTicket) public view returns(string memory nameTicket, string memory dateTicket, uint referenceTicket){
        for(uint i = 0; i < tickets.length; i++){
            if(tickets[i].referenceTicket == _referenceTicket){
                return (tickets[i].nameTicket, tickets[i].dateTicket, tickets[i].referenceTicket);
            }
        }
    }

    function getTicketByDate(string memory _dateTicket) public view returns(string memory nameTicket, string memory dateTicket, uint referenceTicket){
        for(uint i = 0; i < tickets.length; i++){
            if(keccak256(abi.encodePacked(tickets[i].dateTicket)) == keccak256(abi.encodePacked(_dateTicket))){
                return (tickets[i].nameTicket, tickets[i].dateTicket, tickets[i].referenceTicket);
            }
        }
    }

    function getTicketsCount() public view returns(uint){
        return tickets.length;
    }

    function deleteTicket(uint _id) public ownerOnly{
        delete tickets[_id];
    }

    function deleteAllTickets() public ownerOnly{
        delete tickets;
    }

    
    
    
}