const Dai = artifacts.require("Dai");
const Provider = artifacts.require("Provider");

module.exports = async (deployer) => {
  await deployer.deploy(Dai);
  const dai = await Dai.deployed();

  await deployer.deploy(Provider, dai.address);
  const provider = await Provider.deployed();
  console.log("contracts deployed.");
};
