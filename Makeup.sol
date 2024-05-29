// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MakeUp is ERC20, Ownable {

    mapping(uint256 => uint256) public LipstickCost;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        LipstickCost[1] = 300;
        LipstickCost[2] = 250;
        LipstickCost[3] = 200;
        LipstickCost[4] = 350;
    }


    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _to, _amount);
    }

    function LipstickItems() external pure returns (string memory) {
        string memory saleOptions = "The Lipstick on sale: {1} Matte (300) {2} Lipgloss (250) {3} Lipbalm (200) {4} Lipliner (350)";
        return saleOptions;
    }

    function redeemitem(uint256 _item) public {
        require(LipstickCost[_item] > 0, "Item is not available.");
        require(_item <= 4, "Item is not available.");
        require(balanceOf(msg.sender) >= LipstickCost[_item], "Redeem Failed: Insufficient balance.");
        transfer(owner(), LipstickCost[_item]);
    }
    
    function burn(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function decimals() override public pure returns (uint8) {
        return 18;
    }

    
}
