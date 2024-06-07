# Module-4-Building-on-Avalanche
This Solidity program is a simple "Hello World" program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

# Description
This Code Types of Function ETH + AVAX is to build your own ERC20 token that enables the funtions and it should be burned and transferred by any user, but they can only be minted at a designated address.

# Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```javascript
pragma solidity ^0.8.0;
contract DegenToken is ERC20, Ownable {

    mapping(uint256 => uint256) public GameItems;
    mapping(address => uint256) public redeemedItems;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        GameItems[1] = 350;
        GameItems[2] = 200;
        GameItems[3] = 100;
        GameItems[4] = 500;
    }

```
Once the Code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DegenToken" and you will see the deploy and click it once done scroll down you can see it in the contract list once you see it click there are approved,burn,mint,buyitem,transfer,transferDGN,transferFrom,transferOwnership,allowance,balanceOf, and reedeemitem of this code you need to redeem the product of what you buy or show the owner that she/he received the item after buying.

# Authors
Chloie Jane T. Cruz 8215697@ntc.edu.ph

# License
This project is licensed under the MIT License - see the LICENSE.md file for details
