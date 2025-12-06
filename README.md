
# MyToken – ERC-20 Token Project

This repository contains the implementation of **MyToken**, a simple ERC-20 compatible token created as part of a learning project.  
The goal of this project was to understand how ERC-20 tokens work at a low level and how wallets, approvals, and transfers function on the Ethereum Virtual Machine.

---

## 📌 Token Details

| Property | Value |
|---------|--------|
| **Name** | MyToken |
| **Symbol** | MTK |
| **Decimals** | 18 |
| **Total Supply** | Defined during deployment |

The full supply is minted once in the constructor and assigned to the deploying wallet.

---

## 📘 What is an ERC-20 Token?

ERC-20 is a **standard interface** for fungible tokens on Ethereum.  
A token is “ERC-20 compliant” if it implements specific functions like:

- `transfer`
- `approve`
- `transferFrom`
- `balanceOf`
- `allowance`

and emits:

- `Transfer`
- `Approval`

Because of this standardization, wallets, exchanges, dApps, and smart contracts can interact with any ERC-20 token **without custom integration**.

---

## 📁 Project Structure

```
my-token/
│
├── contracts/
│   └── MyToken.sol
│
├── README.md
│
└── screenshots/
    ├── compilation.png
    ├── deployment.png
    ├── token-info.png
    ├── transfer-test.png
    └── events.png
```

---

## 🚀 How to Deploy

1. Open **Remix IDE**
2. Create a file under `contracts/` named **MyToken.sol**
3. Paste the smart contract code
4. Compile using **Solidity 0.8.x**
5. Deploy using:
   - **Remix VM (fast test environment)**  
   - or **Injected Provider (MetaMask)**  
6. Pass initial supply (e.g., `1000000 * 10^18`)
7. Confirm deployment  
8. Deployer receives entire supply automatically

---

## 🧪 How to Test the Token

### ✔ Check deployer balance
```
balanceOf(deployerAddress)
```

### ✔ Transfer tokens
```
transfer(receiverAddress, 100 * 10^18)
```

### ✔ Approve a spender
```
approve(spenderAddress, 500 * 10^18)
```

### ✔ Delegated transfer
```
transferFrom(ownerAddress, receiverAddress, 200 * 10^18)
```

### ✔ Check allowance
```
allowance(ownerAddress, spenderAddress)
```

---

## 📊 Features Implemented

- Complete ERC-20 interface
- Fixed supply minted at deployment
- Direct transfers between addresses
- Approvals + delegated transfers
- Event logging (`Transfer`, `Approval`)
- Helper functions:
  - `getTotalSupply()`
  - `getTokenInfo()`

---

## 🖼 Screenshots Included

- Successful Remix compilation
- Deployment transaction + contract address
- Token info output
- Transfer test results
- Event logs verification

---

## 📚 What I Learned

- How ERC-20 mappings store balances  
- Allowance system and how `transferFrom` works  
- Why tokens use **18 decimal precision**  
- How events help off-chain apps track activity  
- How to deploy and interact with smart contracts in Remix  

---

## 📝 License

This project is licensed under the MIT License.

