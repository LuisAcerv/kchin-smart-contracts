const KchinCrowdsale = artifacts.require('./KchinCrowdsale.sol');
const KchinToken = artifacts.require('./KchinToken.sol');
const KchinId = artifacts.require('./KchinId.sol');

module.exports = function(deployer, network, accounts) {
    const openingTime = web3.eth.getBlock('latest').timestamp + 2; // two secs in the future
    const closingTime = openingTime + 86400 * 20; // 20 days
    //const rate = new web3.BigNumber(1000);
    const rate = 100000;
    const wallet = accounts[1];
    var tokenAddress;
    const goal  = 200 * (10 ** 18);
    const cap = 500 * (10 ** 18);


    return deployer
        .then(() => {
            return deployer.deploy(KchinToken);
        })
        .then(()=>{
          return deployer.deploy(KchinStores, KchinToken.address);
        })
        .then(() => {
            return deployer.deploy(
                KchinCrowdsale,
                openingTime,
                closingTime,
                rate,
                wallet,
                cap,
                KchinToken.address,
            );

        });
};
/*
const KchinStores = artifacts.require('KchinStores');
module.exports = function(deployer) {
return deployer.deploy(KchinStores)
};
*/
