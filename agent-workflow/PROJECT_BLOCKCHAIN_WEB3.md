# Project Handoff — Blockchain and Web3 Lab

> **Repository:** `https://github.com/Ash31393/Blocky`  
> **Status:** Active repository; blockchain engineering direction plus learning analytics  
> **Last repository inspection:** 2026-09-03; `main`, `dev`, `feature/analytics-pivot`, and `docs/agent-handoff` visible  
> **Read first:** `../AGENT_INSTRUCTIONS.md` and `../AGENT_HANDOFF.md`

## Current learning route — 2026-09-09

**Language status:** User says stack locked; exact primary ledger language not captured here.

**Responsibilities:** Preserve recorded Python analytics, SQLite and Tableau. Solidity remains a previously proposed contract-learning option, not proof of a final locked allocation. Recover the selected ledger language from current project instructions instead of choosing it anew.

**Tool and database exposure:** Existing BI tools; Foundry/Hardhat comparison where compatible with the locked stack, local chain, RPC clients, debugger, static analysis, Docker Desktop for isolated local-chain/indexer experiments.

**Route checkpoint:** Continue the recorded analytics checkpoint after verifying actual state, then follow the already selected blockchain language route. This is a planned next step, not evidence of completion. Inspect the actual repo/environment before implementing.

### Shared learning policy

Breadth is intentional: no fixed cap on languages, databases, IDEs, apps, extensions or infrastructure. Two languages is a starting pattern, not a ceiling. Sequence concrete experiments; do not remove a useful learning branch solely to simplify maintenance. Consolidation can be reviewed later. Keep existing locked stacks intact. Distinguish planned/proposed, installed, implemented and verified states.

The user normally types application code and commands; explain syntax, purpose, expected results, architecture and debugging. Teach GUI and CLI views when useful. Maintain Git branches/PRs, meaningful checks, source provenance, and a dated next step. Choose new databases for meaningful exposure where appropriate; do not override an already selected database to satisfy a novelty quota. Docker Desktop is explicitly selected for F1; its use elsewhere is a staged candidate and must respect existing setup decisions.

Read [master handoff](../AGENT_HANDOFF.md) and [agent instructions](../AGENT_INSTRUCTIONS.md) for the full route and tool policy. Cross-language integration starts with a small contract and independent run commands; additional runtimes do not require premature microservices.


## Mission

Learn blockchain fundamentals, smart contracts, wallets, tokens, NFTs, marketplaces, DeFi, trading data, decentralized logistics, governance, and security through staged projects.

## Working Principles

- Professional Git/GitHub workflow and explanations are required.
- Projects remain independently runnable and may expose APIs to the React hub.
- Use local chains, testnets, simulations, and negligible/no-value experiments.
- Never encourage meaningful funds in experimental code.
- Security is part of every milestone.

## Verified Blocky State

- Commit `7b660df` was the public `main`/`dev`/`feature/analytics-pivot` tip during inspection; `docs/agent-handoff` was one commit ahead at `a7a6389`.
- The repository contains Python ETL/archive scripts, runbooks, a `package.json`, and a documented SQLite learning database/data model.
- Documented tables include users, modules, lessons, checkpoints, submissions, and events; BI views include completion funnel and error hotspots.
- Tableau is documented as connected to the SQLite database through ODBC.
- The next documented analytics task is adding realistic submission data, refreshing Tableau, completing two visualizations and a dashboard, and recording insights.
- `lint`, `test`, and `format` npm scripts are placeholders. They must not be treated as quality gates; replace them with real tooling when the matching source code is introduced.

## Suggested Sequence

1. Toy append-only hashed ledger
2. Digital signatures and ownership verification
3. Transactions, balances, and double-spend concepts
4. Local development chain
5. Simple tested smart contract
6. Read-only block/transaction explorer
7. Wallet connection and signing
8. Educational token/NFT marketplace prototype
9. Public on-chain data analysis with SQL/Python
10. DeFi mechanism simulations

## Architecture and Concepts

Hashing, Merkle structures, public/private keys, signatures, consensus, nodes, mempools, blocks, finality, gas, RPC, ABIs, wallets, custody, oracles, indexing, governance, and bridge risk.

## Security Curriculum

Key management, approvals, reentrancy, access control, unit/integer mistakes, oracle manipulation, MEV/front-running, upgradeability, bridge risk, dependency risk, testing, static analysis, and audit limitations.

## Software Exposure

Git, Foundry or Hardhat after comparison, local nodes, Solidity tooling, block explorers, wallet developer tools, Slither/static analysis, testnets, Python/SQL analytics, GraphQL/indexing concepts, and hardware-wallet principles later.

## Open Decisions

Recover the already locked toy-ledger language from current instructions (missing from this snapshot), target chain for contract learning, how the analytics-learning track relates to blockchain modules, and first hub integration.

## Next Action

Finish and document the current SQLite/Tableau analytics milestone, then merge its focused branch through `dev` before continuing in the already selected toy-ledger implementation language.

## Update Log

- 2026-09-02: Initial project-specific handoff created.
- 2026-09-03: Added verified `Blocky` repository state, branch evidence, Tableau/SQLite milestone, and placeholder-script warning.

- 2026-09-09: Synchronized language responsibilities, broad software/database learning, container applicability, and next-step guidance with the master handoff.
