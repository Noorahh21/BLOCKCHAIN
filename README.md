# Simple Voting dApp (MG3012 – Assignment 2)

> This dApp is the working version of my Assignment 1 idea, a **blockchain-based voting system for Pakistan**. In Assignment 1 I built the hash-chain in Python. Here the votes are stored on the Sepolia blockchain using a Solidity smart contract. No real name or CNIC is stored, only the voter's wallet address.

A mini decentralized application: a Solidity smart contract on the **Sepolia testnet** and a single-page HTML/CSS/JavaScript frontend that connects through **MetaMask** using **ethers.js**.

**Student:** Noorah | **Roll No:** 24I-5669
**Course:** MG3012 – Blockchain Technology for Business (Dr. Usama Arshad)
**Program:** BSFT – 5th Semester (Fall 2026)

## Contract details
- **Network:** Sepolia testnet
- **Contract address:** `0x87B7bCdF4868f9Ee72BF1ee0dAb9499012368dDe`
- **Etherscan:** https://sepolia.etherscan.io/address/0x87B7bCdF4868f9Ee72BF1ee0dAb9499012368dDe

## Smart contract functions
| Function | Type | What it does |
|---|---|---|
| `addCandidate(string)` | Write | Owner adds a candidate |
| `vote(uint256)` | Write | Wallet votes once for a candidate |
| `getCandidateCount()` | Read | Number of candidates |
| `getCandidate(uint256)` | Read | Name and votes of a candidate |
| `getWinner()` | Read | Candidate currently leading |

## Project structure
```
├── SmartContract.sol
├── index.html
├── style.css
├── images/logo.svg
├── README.md
└── screenshots/
```

## Setup
1. Install MetaMask and switch to **Sepolia**. Get free test ETH from a Sepolia faucet.
2. Open https://remix.ethereum.org, create `SmartContract.sol`, paste the code.
3. Compile with Solidity 0.8.20+ (Solidity Compiler tab).
4. Deploy: *Deploy & Run* → connect MetaMask → select `SimpleVoting` → Deploy → confirm in MetaMask.
5. Copy the deployed contract address.
6. Open `index.html` and replace the value of `CONTRACT_ADDRESS` with your address (already set to the deployed contract above).
7. Open the page in Chrome with MetaMask installed (for example through GitHub Pages, Live Server, or `python -m http.server`).

## How to use
1. Click **Connect MetaMask** (must be on Sepolia).
2. Owner wallet: add 2–3 candidates (for example Candidate A and Candidate B).
3. Click **Load Candidates**, then **Vote** using a candidate number.
4. Click **Show Current Leader** to see the result.

## Screenshots
The `screenshots/` folder contains:
1. Contract deployment on Sepolia (Remix)
2. MetaMask connected to the page
3. A confirmed transaction and updated vote counts

## Connection with Assignment 1
| Assignment 1 (Python) | Assignment 2 (dApp) |
|---|---|
| Each vote is a block linked by hashes | Each vote is a transaction on Sepolia |
| Voter token instead of real name/CNIC | Wallet address instead of real name/CNIC |
| Candidate A / Candidate B | Candidates added with `addCandidate` |
| Anyone can verify the chain | Anyone can read votes and check them on Etherscan |
| One vote per voter token | `hasVoted` mapping: one vote per wallet |

## Technologies
Solidity, Remix IDE, MetaMask, ethers.js v6, HTML, CSS, JavaScript.
