const Migrations = artifacts.require("Migrations");
const ClientLib = artifacts.require("ClientLib");
const Client = artifacts.require("Client");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(ClientLib);
  deployer.deploy(Client);
};
