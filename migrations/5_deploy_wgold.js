const WGold = artifacts.require("wrapped_scarcity_gold.sol")

module.exports = async (deployer, network, accounts) => {
  await deployer.deploy(WGold);
  const wgold = await WGold.deployed();
  console.log(wgold.address);
  pausePromise('wrapped_scarcity_gold')

}

function pausePromise(message, durationInSeconds = 1) {
  return new Promise(function (resolve, error) {
      setTimeout(() => {
          console.log(message)
          return resolve()
      }, durationInSeconds * 10)
  })
}