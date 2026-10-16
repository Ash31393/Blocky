# Code Walkthrough — Blocky

Companion to `AGENT_HANDOFF.md` / `AGENT_INSTRUCTIONS.md`.  
Agent maintains this file. Label proposed vs applied. Record verification only from evidence.

Status: 2026-10-16 — `labs/solidity/BlockyToken.sol` saved & verified; `web3` + `py-solc-x` installed via `uv`; teaching `labs/solidity/deploy_token.py`.

## Coverage index

| File | Snapshot | Coverage | Status |
| --- | --- | --- | --- |
| `data/etl/init_schema.py` | Merged on `dev` (`830f1bf`) | Seed `SEED_SQL` (ETH+BTC) | Verified in local SQLite DB |
| `data/etl/fetch_prices.py` | Merged on `dev` (`830f1bf`) | Full file; `main` ETH+BTC | Verified (`ETH: wrote 31 rows` / `BTC: wrote 31 rows`) |
| `labs/sql/01..05_*.sql` | Committed on `feature/labs-sql-01` (`5d0c134`) | SQL Fundamentals to Query Plans | Exercises 1–4 verified in DBeaver |
| `labs/solidity/BlockyToken.sol` | Working tree on `feature/web3-solidity-lab` | Minimal ERC-20 Token in Solidity (26 lines) | Applied & verified on disk |
| `labs/solidity/deploy_token.py` | Proposed on `feature/web3-solidity-lab` | Local Solidity compilation + Sepolia RPC deployment | Teaching in progress |

---

## File: `labs/solidity/BlockyToken.sol` (Applied — 26 lines)

**Role:** A minimal, standard-compatible ERC-20 token smart contract written in Solidity that mints an initial supply to the deployer's MetaMask wallet and lets anyone transfer tokens on any EVM chain.

### Line-by-Line Mental Model

- **Lines 1–2 (`SPDX-License-Identifier`, `pragma solidity ^0.8.20;`):** Open-source license tag and compiler version constraint (`0.8.20`+ includes automatic overflow/underflow checks).
- **Lines 4–8 (`name`, `symbol`, `decimals`, `totalSupply`):** State variables stored permanently in contract storage. `public` automatically generates getter functions (`name()`, `symbol()`, `decimals()`, `totalSupply()`).
- **Line 10 (`mapping(address => uint256) public balanceOf;`):** On-chain key-value table mapping each `0x...` wallet address to its integer token balance.
- **Line 12 (`event Transfer(...)`):** Emits an indexed on-chain receipt log whenever tokens are minted or moved.
- **Lines 14–18 (`constructor(uint256 initialSupply)`):** Runs once at deployment. Multiplies `initialSupply` by `10 ** 18`, assigns 100% of `totalSupply` to `msg.sender` (the deployer wallet), and emits a mint `Transfer` event from `address(0)`.
- **Lines 20–26 (`transfer(address to, uint256 amount)`):** Checks `balanceOf[msg.sender] >= amount` via `require` (reverts atomically if false), updates sender and recipient balances, emits `Transfer`, and returns `true`.

---

## File: `labs/solidity/deploy_token.py` (Proposed — Step 2)

**Role:** Compiles `BlockyToken.sol` locally using `py-solc-x` into **ABI** + **Bytecode**, connects to Ethereum Sepolia via JSON-RPC (`web3.py`), signs the deployment transaction with your MetaMask testnet account, and prints the live contract address.

### Key Concepts in `deploy_token.py`

| Concept | What It Is |
| --- | --- |
| **ABI (Application Binary Interface)** | A JSON menu of your contract's functions (`name()`, `symbol()`, `balanceOf(address)`, `transfer(address,uint256)`) so Python and MetaMask know how to call them. |
| **Bytecode (`bin`)** | The actual compiled machine code (`0x60806040...`) that gets uploaded to the Ethereum Virtual Machine (EVM). |
| **RPC URL (`https://ethereum-sepolia-rpc.publicnode.com`)** | The Sepolia gateway node we discussed earlier! `Web3(Web3.HTTPProvider(RPC_URL))` connects Python directly to Sepolia. |
| **Nonce (`get_transaction_count`)** | Every transaction sent from your wallet has a sequential counter (`0, 1, 2, ...`) so the same transaction can never be processed twice. |
| **Chain ID (`11155111`)** | Sepolia's network ID, baked into the signed transaction for replay protection. |
