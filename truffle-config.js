const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config();

const {PRIVATE_KEY, POLYGONSCAN_API_KEY} = process.env;

module.exports = {
  networks: {
    matic: { // truffle deploy --network matic --reset
      provider: () => new HDWalletProvider(PRIVATE_KEY, 'https://polygon-mainnet.g.alchemy.com/v2/otv8MK4bZZfs0g1BDyastBFaKiHTiswG'),
      network_id: 137,
      gas: 7000000,
      gasPrice: 44000000000,
      skipDryRun: true,
    },
    mumbai: { // truffle deploy --network mumbai --reset
      provider: () => new HDWalletProvider(PRIVATE_KEY, 'https://matic-mumbai.chainstacklabs.com'),
      network_id: 80001,
      gas: 3000000,
      skipDryRun: true,
    }
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  compilers: {
    solc: {
      version: "0.8.7",    // Fetch exact version from solc-bin (default: truffle's version)
      docker: false,        // Use "0.5.1" you've installed locally with docker (default: false)
      settings: {          // See the solidity docs for advice about optimization and evmVersion
        optimizer: {
          enabled: true,
          runs: 200
        },
        evmVersion: "istanbul"
      }
    }
  },

  plugins: [
    'truffle-plugin-verify'
  ],

  api_keys: {
    polygonscan: POLYGONSCAN_API_KEY
  }
};
