require("@nomiclabs/hardhat-ethers");

require("@openzeppelin/hardhat-upgrades");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  defaultNetwork: "hardhat",
  networks: {
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/5sp--_xRAQRILrrILaWf31A_DdKM4ypW",
      accounts: [
        "0xeeea76b57ca6a68dd248b03e92ff1200c15f9145560d369a95428cd9d4c37a13",
      ],
    },
  },
};
