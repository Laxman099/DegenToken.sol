## DegenToken Smart Contract

### Overview

The `DegenToken` smart contract is an ERC20-based token that includes functionalities for minting, transferring, and burning tokens. Additionally, it features a system for purchasing real-world asset items using the token. Only the contract owner can mint tokens, while any user can transfer tokens and purchase items.

### Features

1. **Minting Tokens**
   - **Function:** `mint`
   - **Description:** Allows the contract owner to mint new tokens and assign them to a specified address.
   - **Access Control:** Only the contract owner can call this function.


2. **Transferring Tokens**
   - **Function:** `transferr`
   - **Description:** Allows any user to transfer tokens from their balance to another address.
   - **Access Control:** Any user can call this function.

3. **Burning Tokens**
   - **Function:** `burn`
   - **Description:** Allows any user to burn tokens from their balance, reducing the total supply.
   - **Access Control:** Any user can call this function.

4. **Purchasing Items**
   - **Function:** `purchase`
   - **Description:** Allows users to purchase items using their tokens. Once an item is purchased, it cannot be purchased again by the same user.
   - **Access Control:** Any user can call this function.
  
5   **Adding Items**
   - **Function:** `addItem`
   - **Description:** Allows owner to add items ,where users can purchase with the tokens .
   - **Access Control**:Only the contract owner can call this function.

### Contract Details

- **Owner:** The address that deploys the contract is set as the owner. The owner has exclusive rights to mint new tokens.
- **Token Name and Symbol:** The token is named "Degen" with the symbol "DGN".

### Functions

#### mint
- **Description:** Mints new tokens and assigns them to a specified address.
- **Parameters:**
  - `to` (address): The address to receive the newly minted tokens.
  - `amount` (uint256): The amount of tokens to mint.
- **Access Control:** Only the owner can call this function.

#### transferr
- **Description:** Transfers tokens from the caller's address to a specified address.
- **Parameters:**
  - `recipient` (address): The recipient's address.
  - `amount` (uint256): The amount of tokens to transfer.
- **Access Control:** Any user can call this function.

#### burn
- **Description:** Burns a specified amount of tokens from the caller's address.
- **Parameters:**
  - `amount` (uint256): The amount of tokens to burn.
- **Access Control:** Any user can call this function.

#### purchase
- **Description:** Allows users to purchase an item using their tokens. Once an item is purchased, it cannot be purchased again by the same user.
- **Parameters:**
  - `itemId` (uint256): The ID of the item to purchase.
- **Access Control:** Any user can call this function.

### Usage

1. **Deploying the Contract:**
   - Deploy the contract using a Solidity-compatible environment, providing the owner's address as a constructor argument.

2. **Minting Tokens:**
   - Only the owner can mint tokens by calling the `mint` function with the recipient's address and the amount of tokens to mint.

3. **Transferring Tokens:**
   - Any user can transfer their tokens to another address by calling the `transferr` function with the recipient's address and the amount of tokens to transfer.

4. **Burning Tokens:**
   - Any user can burn their tokens by calling the `burn` function with the amount of tokens to burn.

5. **Purchasing Items:**
   - Users can purchase items by calling the `purchase` function with the ID of the item they want to purchase, provided they have not already purchased an item.
  

## Transaction 
![image](https://github.com/user-attachments/assets/eeb2a4cf-eee6-4357-a979-0cb09676b16e)

### Transfer
![image](https://github.com/user-attachments/assets/4452c2f7-79b3-4b06-9790-b78937d3363e)

## Token Holders
![image](https://github.com/user-attachments/assets/7f660e6c-f7c1-4d66-ad04-c817933d3ed1)


