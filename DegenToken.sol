// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
// Transferring tokens: Players should be able to transfer their tokens to others.
// Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
// Checking token balance: Players should be able to check their token balance at any time.
// Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    mapping(address => bool) public hasPurchased;
    mapping(address => uint256[]) public playerItems;

    struct Item {
        string name;
        uint256 price;
    }

    Item[] private items;

    constructor(address initialOwner) ERC20("Degen", "DGN") {
        owner = initialOwner;
    }

    function addItem(string memory name, uint256 price) public onlyOwner {
        items.push(Item(name, price));
    }

 function decimals() public view virtual override returns (uint8) {
        return 0; 
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferrr(address recipient, uint256 amount) public returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(_msgSender()) >= amount, "Insufficient balance");

        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function purchase(uint256 itemId) public {
        require(itemId < items.length, "Invalid item ID");
        require(!hasPurchased[msg.sender], "Already purchased");

        Item memory item = items[itemId];
        uint256 price = item.price;

        require(balanceOf(_msgSender()) >= price, "Insufficient balance");

        _burn(_msgSender(), price);
        hasPurchased[msg.sender] = true;

        playerItems[msg.sender].push(itemId);
    }

    function burnnn(uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(_msgSender()) >= amount, "Insufficient balance");

        _burn(_msgSender(), amount);
    }

    function balanceOff(address account) public view returns (uint256) {
        return super.balanceOf(account);
    }

    function getItem(uint256 itemId) public view returns (string memory name, uint256 price) {
        require(itemId < items.length, "Invalid item ID");
        Item memory item = items[itemId];
        return (item.name, item.price);
    }

    function getAllItems() public view returns (Item[] memory) {
    return items;
}

function getPlayerPurchasedItems(address player) public view returns (Item[] memory) {
    uint256[] memory purchasedItemIds = playerItems[player];
    Item[] memory purchasedItems = new Item[](purchasedItemIds.length);

    for (uint256 i = 0; i < purchasedItemIds.length; i++) {
        purchasedItems[i] = items[purchasedItemIds[i]];
    }

    return purchasedItems;
}
}
