pragma solidity ^0.8.17;

contract Ticket{
    event newTicket(uint ticketID, string nameTicket, string dateTicket, uint referenceTicket);

    address public owner = msg.sender;
    string public message;

    struct Ticket{
        string nameTicket;
        string dateTicket;
        uint referenceTicket;
    }

    Ticket[] public tickets;

    constructor() public{
        message = "Init Contract";
        _createTicket("NomTicket1", "13/11/2022", 20221113);
        _createTicket("NomTicket2", "10/10/2022", 20221010);
        getTicketsCount();

        _getTicketByID(1);
    }

    modifier ownerOnly(){
        require(msg.sender == owner, "This function is restricted to the contract's owner");
        _;
    }

    //only contract owner can run
    function _createTicket(string memory _nameTicket, string memory _dateTicket, uint _referenceTicket) public ownerOnly{
        tickets.push(Ticket(_nameTicket, _dateTicket, _referenceTicket));
        uint _id = tickets.length - 1;
        emit newTicket(_id, _nameTicket, _dateTicket, _referenceTicket);
    }
    
    function _getTicketByID(uint _id) public ownerOnly returns(Ticket memory ticket){
        return tickets[_id];
    }
/*
    function retrieveTickets() public ownerOnly{
        for(uint i=0; i<getTicketsCount(); i++){
            tickets[i];
        }
    }
*/
    function getTicketsCount() public view returns(uint count){
        return tickets.length;
    }
}