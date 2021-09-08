const Rarity = artifacts.require("rarity.sol")
const Gold = artifacts.require("rarity_gold.sol")
const Attributes = artifacts.require("rarity_attributes.sol")

module.exports = async (deployer, network, accounts) => {
  await deployer.deploy(Rarity);
  const rarity = await Rarity.deployed();
  console.log(rarity.address);
  pausePromise('rarity')
  
  // await deployer.deploy(Gold)
  // const gold = await Gold.deployed()
  // pausePromise('gold')

  // await deployer.deploy(Attributes)
  // const attr = await Attributes.deployed()
  // pausePromise('attr')
}

function pausePromise(message, durationInSeconds = 1) {
  return new Promise(function (resolve, error) {
      setTimeout(() => {
          console.log(message)
          return resolve()
      }, durationInSeconds * 10)
  })
}