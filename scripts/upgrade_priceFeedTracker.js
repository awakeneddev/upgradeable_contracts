const { ethers, upgrades } = require("hardhat");

async function main() {
  const deployedProxy = process.env.PROXY_ADDRESS_V1;

  const priceFeedTrackerV2 = await ethers.getContractFactory(
    "PriceFeedTrackerv2"
  );

  console.log("Upgrading Price Tacker");

  await upgrades.upgradeProxy(deployedProxy, priceFeedTrackerV2);

  console.log("Price Feed Tracker Upgraded");
}

main();
