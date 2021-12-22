require("@nomiclabs/hardhat-waffle");
require('dotenv').config();
// Double check & make sure environment variables loaded...
console.log(process.env);


module.exports = {
  // Configure the different networks.
  networks: {
    hardhat: {
      chainId: 1337
    },
    mumbai: {
      url: "https://polygon-mumbai.infura.io/v3/${INFURA_PROJECTID}",
      // Below is a list of accounts from which we are deploying our contracts.
      // NOTE: Hardhat Test Env. will automatically inject & use an account for us unless we define one.
      accounts: []
    },
    mainnet: {
      url: "https://polygon-mainnet.infura.io/v3/${INFURA_PROJECTID}",
      accounts: []
    }
  }
  solidity: "0.8.4",
};
