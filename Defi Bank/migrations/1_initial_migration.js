// const Migrations = artifacts.require('Migrations');

// const RWD = artifacts.require('RWD');
// const DecentralBank = artifacts.require('DecentralBank');
// const Tether = artifacts.require('Tether');

// module.exports =  async function(deployer) {
//     await deployer.deploy(Tether);

//     await deployer.deploy(DecentralBank);
    
//     await deployer.deploy(RWD);
    
// };

const Migrations = artifacts.require("Migrations")

module.exports = async (deployer) => {
  await deployer.deploy(Migrations);
}