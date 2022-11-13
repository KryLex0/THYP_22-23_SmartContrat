var Ticket = artifacts.require("./Ticket.sol");

module.exports = function (deployer) {
    //Ticket is the contract's name
    deployer.deploy(Ticket);
};