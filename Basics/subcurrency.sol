// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Coin{
    // keyword public is making the variables not accessible from other contracts
    address public minter;
    mapping(address => uint) public balances; 

    // event to store arguments and are stored on the eth blockchain
    // we forgot to omit our event
    event Sent(address from , address to, uint amount);


    // constructor runs only when we deploy our contract
    constructor()
    {
        minter=msg.sender;
    }

    //make new coins and send them to an address
    function mint(address receiver, uint amount) public
    {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    error insufficientBalance(uint requested, uint available);

    // send any amount of coins to an existing address
    function send(address receiver, uint amount) public
    {
        // require amount to be greater than x == true and then run this
        if(balances[msg.sender] < amount)
        revert insufficientBalance({
            requested : amount,
            available : balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender,receiver,amount);
    }
}

