const { ethers, network, upgrades } = require("hardhat");

async function main() {
  const contractFactory = await ethers.getContractFactory("PriceFeedTracker");
  console.log("Deploying price feed to :", network.name);

  const [account1] = await ethers.getSigners();

  const priceFeedTracker = await upgrades.deployProxy(
    contractFactory,
    [account1.address],
    { initializer: "initialize" }
  );

  await priceFeedTracker.deployed();

  console.log("price FeedTracker deployed to:", priceFeedTracker.address);
}

main();