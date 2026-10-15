# Agent Handoff — Blocky

Last updated: 2026-10-14  
Default mode: Guided learning — the agent teaches; the user types/pastes code and runs commands.  
Canonical live docs:

```text
agent-workflow/
├── AGENT_INSTRUCTIONS.md
├── AGENT_HANDOFF.md
└── CODE_WALKTHROUGH.md
```

## Mandatory edit boundary

Agent may create/edit files **only** inside `agent-workflow/` unless the user authorizes a named outside action. User runs app commands, SQL in DBeaver, Git, and installs. This session authorized creating `labs/sql/*` for Lab 01.

## Project purpose

**Blocky** — crypto analytics learning repo: CoinGecko → SQLite → SQL labs / Tableau (and later Python, R, Power BI). Parallel Web3 track: toy hashed ledger (separate branch/PR history).

## Current architecture

| Layer | Choice |
| --- | --- |
| Python ETL | `data/etl/init_schema.py`, `fetch_prices.py` (stdlib) |
| SQLite | `data/sqlite/blocky_analytics.db` (gitignored) — `assets`, `price_daily`, `v_price_trends` |
| SQL labs | `labs/sql/` on `feature/labs-sql-01` |
| BI | `data/tableau/eth_price_trends.twbx` |
| Tooling | uv + Ruff; guided agent-workflow docs |
| Git | feature → PR → `dev` → later `main` |

## Current verified state

| Item | Status | Evidence |
| --- | --- | --- |
| Branch | `feature/labs-sql-01` from `dev` @ `830f1bf` | git 2026-10-15 |
| PR #7 BTC ETL | **Merged** into `dev` | merge commit `830f1bf` |
| Local DB ETH+BTC assets | Verified after seed repair | init_schema + checks |
| Orphan prices | 0 after repair | LEFT JOIN check |
| Lab 01 SQL files | **Created & Exercises 1–4 verified in DBeaver** | DBeaver screenshots 2026-10-15 |
| Next focus | **Solidity + Wallet + Testnet (Tokens, NFTs, DeFi)** | User selected 2026-10-15 |

## Work in progress

1. **Wrap up `feature/labs-sql-01`:** Commit the SQL lab files and switch to a clean Web3 feature branch (`feature/web3-solidity-lab`).
2. **Start Web3 / Solidity + Testnet track:** Explore wallet + testnet setup, local chain vs testnet (e.g. Sepolia), and write/test our first Solidity smart contract (ERC-20 / NFT / DeFi mechanics).

## Important decisions

- Guided learning; SQL labs read the shared analytics DB.
- No indexes / destructive DDL on live `blocky_analytics.db`; perf demos use scratch DB in script 05.
- Web3 safety rule: **strictly use local simulated chains and testnets (zero real funds / no mainnet private keys).**
- Keep SQL lab work cleanly isolated on `feature/labs-sql-01` before branching off `dev` for Solidity/Web3.

## Problems / blockers

- None.

## Learning context

- Completed SQL fundamentals (`SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, foreign key inspection in DBeaver).
- Moving into Web3: EOA wallets, public/private keys, testnets (Sepolia/Holesky), EVM gas & transactions, Solidity smart contracts, ERC-20 (fungible tokens / DeFi), and ERC-721 (NFTs).

## Exact next step

**Step 1 (Git hygiene):** User runs the commands below in PowerShell to commit `labs/sql/` on `feature/labs-sql-01`, push it, and create a fresh branch `feature/web3-solidity-lab` off `dev`:

```powershell
git status -sb
git add labs/sql/ agent-workflow/AGENT_HANDOFF.md agent-workflow/CODE_WALKTHROUGH.md
git commit -m "feat(labs): add Lab 01 SQL fundamentals and analytics exercises"
git push -u origin feature/labs-sql-01
git switch dev
git switch -c feature/web3-solidity-lab
```

### Latest learning checkpoint

- Date: 2026-10-15.
- Verified: DBeaver connected to `blocky_analytics.db`; user ran `SELECT`, `ORDER BY`, `WHERE`, and `LIMIT` queries on `assets` and `price_daily`.
- Next: Commit SQL lab branch, switch to `feature/web3-solidity-lab`, and begin Wallet + Testnet + Solidity onboarding.
