const DaycareManager = artifacts.require("DaycareManager")

module.exports = async (deployer, network, accounts) => {
    await deployer.deploy(DaycareManager);
    const daycareManager = await DaycareManager.deployed();
    console.log(daycareManager.address);
    pausePromise('daycareManager');
}

function pausePromise(message, durationInSeconds = 1) {
    return new Promise(function (resolve, error) {
        setTimeout(() => {
            console.log(message)
            return resolve()
        }, durationInSeconds * 10)
    })
}