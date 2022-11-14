const Ticket = artifacts.require("Ticket");

contract("Ticket", accounts => {
    it("This should create a Ticket...", async () => {
        const Contract = await Ticket.deployed();
        const result = await Contract.createTicket("NomTicketTest", "12/34/5678", 987654321, { from: accounts[0] });
        assert.equal(result.logs[0].args.nameTicket, "NomTicketTest", "Ticket doesn't exists!");
    })
    
    it("Ticket Update", async () => {
        const Contract = await Ticket.deployed();
        const result = await Contract.updateTicket(1, "NomTicketUpdate", "98/76/5432", 123456789);
        var _ticketData = await Contract.getTicketByID(1);
        var _nameTicket = _ticketData[0];
        
        assert.equal(_nameTicket, "NomTicketUpdate", "Ticket doesn't updated!");
        
    })
    
});