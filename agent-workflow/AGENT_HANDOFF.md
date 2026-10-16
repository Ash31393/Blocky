# Agent Handoff — Blocky

Last updated: 2026-10-16  
Default mode: Guided learning — the agent teaches; the user types/pastes code and runs commands.  
Canonical live docs (only these three):

```text
agent-workflow/
├── AGENT_INSTRUCTIONS.md   ← reusable teaching rules
├── AGENT_HANDOFF.md        ← this file (project state + next step)
└── CODE_WALKTHROUGH.md     ← taught-code explanations
```

Archived older workflow trees: `oldInstructions/` and `oldInstructions/agent-workflow-archive/` (review only; not live status).

## Mandatory edit boundary

**The agent may create or edit files ONLY inside `agent-workflow/`** unless the user explicitly authorizes a named outside action. General “help / continue / fix / build” means teach, not edit app source. The agent may inspect the repo and Git state read-only. The user runs app commands, installs, tests, and Git.

## Project purpose

**Blocky** is a hands-on crypto analytics + Web3 learning repo:
1. **Data & Analytics (`data/`, `labs/sql/`):** Pull public CoinGecko daily prices into a local SQLite database (`data/sqlite/blocky_analytics.db`), practice SQL analytics in DBeaver, and explore in Tableau.
2. **Web3 & Smart Contracts (`labs/solidity/`):** Write Solidity smart contracts (ERC-20 tokens, NFTs, DeFi mechanics), compile & deploy directly from VS Code/Cursor using Python (`web3.py` + `py-solc-x`) to EVM testnets (Ethereum Sepolia, Metis Sepolia, Avalanche Fuji), and inspect in MetaMask.

## Current architecture

| Layer | Choice |
| --- | --- |
| Language (Off-chain / ETL / Deploy) | Python 3 (`web3==8.0.0`, `py-solc-x==2.0.5` added via `uv`; stdlib for ETL) |
| Language (On-chain) | Solidity (`^0.8.20`) — EVM smart contracts in `labs/solidity/` |
| Wallet & Testnets | MetaMask connected to Ethereum Sepolia (`11155111`), Metis Sepolia, Avalanche Fuji |
| Tooling | `uv` + `pyproject.toml` / `uv.lock`; Ruff in dev group; DBeaver for SQLite |
| Database | SQLite file `data/sqlite/blocky_analytics.db` (**gitignored**) |
| Schema & ETL | `data/etl/init_schema.py` + `data/etl/fetch_prices.py` (ETH id 1, BTC id 2) |
| SQL Labs | `labs/sql/` (Committed on `feature/labs-sql-01` @ `5d0c134`, pushed to origin) |
| Git | feature → PR → `dev` → later release PR → `main` |

## Current verified state

Evidence-based only:

| Item | Status | Evidence |
| --- | --- | --- |
| Current Branch | `feature/web3-solidity-lab` (branched from `dev` @ `830f1bf`) | Terminal 1 (`git switch -c feature/web3-solidity-lab`) |
| `.gitignore` `.env` protection | **Applied & verified** | File read of `.gitignore` (line 6: `.env`) |
| `labs/solidity/BlockyToken.sol` | **Created & verified** (26 lines) | File read of `labs/solidity/BlockyToken.sol` |
| Python Web3 toolchain (`web3`, `py-solc-x`) | **Installed via `uv`** (`web3==8.0.0`, `py-solc-x==2.0.5`) | Terminal 1 output |
| Next Milestone | **Create `labs/solidity/deploy_token.py` & deploy `BlockyToken.sol` to Sepolia** | In progress |

## Work in progress

**Milestone:** Compile and deploy `labs/solidity/BlockyToken.sol` directly from VS Code/Cursor using Python (`labs/solidity/deploy_token.py`) without leaving the IDE.

Steps:
1. DONE: Create `labs/solidity/BlockyToken.sol` (26 lines).
2. DONE: Add `.env` to `.gitignore` and install `web3` + `py-solc-x` via `uv`.
3. NEXT: Create `labs/solidity/deploy_token.py` which:
   - Compiles `BlockyToken.sol` locally using `solcx.compile_source` (Produces **ABI** + **Bytecode**).
   - Connects to Sepolia RPC (`https://ethereum-sepolia-rpc.publicnode.com`, Chain ID `11155111`).
   - Prompts securely with `getpass` (or reads `.env`) for the deployer's testnet private key so it never shows on screen or in Git.
   - Signs and broadcasts the contract deployment transaction (`constructor(1_000_000)`), waits for the transaction receipt, and prints the deployed `0x...` token contract address!

## Exact next step

User creates and runs `labs/solidity/deploy_token.py` to compile `BlockyToken.sol` and deploy it to Sepolia (or dry-run compile first), then imports the printed contract address into MetaMask.
