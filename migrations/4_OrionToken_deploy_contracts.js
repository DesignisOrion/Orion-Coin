const OrionToken = artifacts.require("OrionToken");

module.exports = function(deployer) {
  deployer.deploy(OrionToken);
};
