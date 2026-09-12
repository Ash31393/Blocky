# Project Handoff — Blockchain and Web3 Lab

> **Repository:** `https://github.com/Ash31393/Blocky`  
> **Status:** Active repository; crypto analytics ETL in progress + Web3 curriculum planned  
> **Last repository inspection:** 2026-09-12 (post PR #2 on `dev`)  
> **Read first:** `../CODING_STUDY_GUIDE_HANDOFF.md` (Part I) and `PROJECT_HANDOFF.md`

## Current learning route — 2026-09-12

**Language status:** User has said stack is locked in conversation history; exact primary toy-ledger language is still **not recorded** in-repo. Recover from user confirmation before starting ledger code.

**Responsibilities:** Preserve Python analytics (CoinGecko → SQLite). Learning-platform seed/Tableau-on-`learning.db` is archived. Solidity remains a proposed later contract option, not proof of a locked allocation.

**Tool and database exposure:** SQLite + DB Browser + Tableau (as previously used); `uv` + `.venv` + Ruff installed locally; Foundry/Hardhat comparison later for contracts; Docker Desktop is a staged candidate elsewhere in the ecosystem (explicit for F1), not required for current ETL.

**Route checkpoint:** Analytics ETL first fetch **verified**. Next product/docs cleanup, then Web3 sequence step 1 (toy hashed ledger) after language confirmation.

### Shared learning policy

Breadth is intentional. Sequence experiments; keep locked stacks intact. Distinguish planned/proposed, installed, implemented, and verified. User types code/commands by default; agents teach and maintain `agent-workflow/` documentation under the standing exception.

## Mission

Learn blockchain fundamentals, smart contracts, wallets, tokens, NFTs, marketplaces, DeFi, trading data, decentralized logistics, governance, and security through staged projects.

## Working Principles

- Professional Git/GitHub workflow and explanations are required.
- Projects remain independently runnable and may expose APIs to the React hub.
- Use local chains, testnets, simulations, and negligible/no-value experiments.
- Never encourage meaningful funds in experimental code.
- Security is part of every milestone.

## Verified Blocky State (2026-09-12)

- `dev` includes merge commits for PR #1 (docs/agent-workflow) and PR #2 (crypto ETL + CI cache fix + Ruff tooling).
- Active script: `data/etl/fetch_prices.py` with repo-relative `DB_PATH`.
- Local DB: `data/sqlite/blocky_analytics.db` with `assets` + `price_daily`; ETH fetch produced ~30 daily rows (gitignored).
- `data/archive/seed_submissions.py` remains archived; still has hardcoded foreign-machine path.
- Node `lint`/`test`/`format` scripts remain placeholders — not real quality gates.
- Living agent docs expanded under `agent-workflow/` per `CODING_STUDY_GUIDE_HANDOFF.md`.

## Suggested Sequence

1. Toy append-only hashed ledger
2. Digital signatures and ownership verification
3. Transactions, balances, and double-spend concepts
4. Local development chain
5. Simple tested smart contract
6. Read-only block/transaction explorer
7. Wallet connection and signing
8. Educational token/NFT marketplace prototype
9. Public on-chain / market data analysis with SQL/Python ← **partially underway (prices)**
10. DeFi mechanism simulations

## Open Decisions

- Record locked toy-ledger language
- Target chain for contract learning
- When to open release PR `dev` → `main`
- First hub integration

## Next Action

See `PROJECT_HANDOFF.md`. Short version: commit pending docs archival + study guide on a `docs/...` branch into `dev`, then confirm ledger language before step 1.

## Update Log

- 2026-09-02: Initial project-specific handoff created.
- 2026-09-03: Added verified repository state, Tableau/SQLite milestone notes.
- 2026-09-09: Synchronized with master handoff learning policy.
- 2026-09-12: Updated for PR #2 ETL verification, study guide intake, living agent-workflow records; corrected stale “finish Tableau submissions” next action.
