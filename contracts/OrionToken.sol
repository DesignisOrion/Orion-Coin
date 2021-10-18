pragma solidity >=0.4.25 <0.7.0;


// The contract is called OrionToken for it's the ERC20 Token being created.
contract OrionToken{
    address public minter; //user can access minter only if logged in as such
    mapping (address => uint) public balances; // modify the balance of any address who participated in the blockcahin.

// adding event for the "Sent" function showing the address from, to. Also shows the amount of the token sent.
    event Sent(address from, address to, uint amount);

// Constructor - The first thing that runs in the contract. It's public so it can read who's the minter.
// Minter is going to be considered msg.sender because it's sending the coins minted.
    constructor() public {
        minter = msg.sender;
    }

// this function is called "Mint" 
    function Mint(address receiver, uint amount) public{
        require (msg.sender == minter); // confirm the user is the minter
        balances[receiver] += amount; // gets balances from reciever then increment the amount within their wallet.
    }

// this function is called "Send"
    function Send(address receiver, uint amount) public{
        require(amount <= balances[msg.sender], "Insufficent Balance!!!");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        emit Sent(msg.sender, receiver, amount);
    }

}