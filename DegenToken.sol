// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    mapping(uint256 => uint256) public GameItems;
    mapping(address => uint256) public redeemedItems;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        GameItems[1] = 350;
        GameItems[2] = 200;
        GameItems[3] = 100;
        GameItems[4] = 500;
    }


    function mintDGN(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _to, _amount);
    }

    function showGameItems() external pure returns (string memory) {
        string memory saleOptions = "The items on sale: {1} GameItems [Tekken (350)] {2} GameItems [Valorant (200)] {3} GameItems [ ML (100)] {4} GameItems [ COD (500)]";
        return saleOptions;
    }

    function buyItem(uint256 _item, address _recipient) public {
        require(GameItems[_item] > 0, "Item is not available.");
        require(_item <= 4, "Item is not available.");
        require(balanceOf(msg.sender) >= GameItems[_item], "Buy Failed: Insufficient balance.");
        
        redeemedItems[_recipient] = _item;
        transfer(owner(), GameItems[_item]);
    }

    function hasRedeemedItem() external view returns (uint256) {
        return redeemedItems[msg.sender];
    }
    
    function burnDGN(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

}
