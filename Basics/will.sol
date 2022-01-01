// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Will{
    address owner;
    uint fortune;
    bool deceased;
    
    constructor() payable public {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }

    //create modifier  so that only person who can call the contract is the owner

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    // create modifier so that we only allocate funds if friends gramp is deceased
    modifier mustBeDeceased{
        require(deceased == true);
        _;
    }

    //payable to make it pay ether into these wallets
    address payable[] familyWallets;

    mapping(address => uint) inheritance;

    //sets the inheritance for each address
    function setInheritance(address payable wallet, uint amount) public onlyOwner{
        //to add wallets to the family wallets .push
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    //pay each family member based on their wallet address
    function payout() private mustBeDeceased {
        //for loop to loop through things and set condition
        for(uint i=0;i<familyWallets.length;i++)
        {
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
            //transfer the funds from contract address to receiver address
        }

    }

    function hasDeceased() public onlyOwner
    {
        deceased=true;
        payout();
    }


}