const AdventureTime = artifacts.require("AdventureTime")

module.exports = async (deployer, network, accounts) => {
    await deployer.deploy(AdventureTime);
    const adventureTime = await AdventureTime.deployed();
    console.log(adventureTime.address);
    pausePromise('adventureTime');
}

function pausePromise(message, durationInSeconds = 1) {
    return new Promise(function (resolve, error) {
        setTimeout(() => {
            console.log(message)
            return resolve()
        }, durationInSeconds * 10)
    })
}