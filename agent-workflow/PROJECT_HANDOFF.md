# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-10-02  
> **Branch observed:** Tableau docs PR merged to `dev` (user confirmed); pull to confirm tip  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Agent style (required — do not skip)

**Guided learning is the default.** The user runs commands and writes code; the agent teaches, explains, checks, and debugs.

- Give **one next step at a time**, with **why** and **expected output**.
- Do **not** silently implement whole features unless the user asks for direct implementation.
- Do **not** commit or push unless the user asks.
- Documentation under `agent-workflow/` may be updated without re-asking (factual records only).

## Current objective

Start **Web3 curriculum step 1**: toy append-only hashed ledger (record language first — recommend Python). Optional parallel: BTC in ETL.

## Last completed step (verified)

- Analytics pipeline: CoinGecko → SQLite (`init_schema.py`, `fetch_prices.py`) → `v_price_trends`.
- Tableau ETH line chart; workbook at `data/tableau/eth_price_trends.twbx`; docs PR merged to `dev` (user 2026-10-02).
- Git flow practiced: feature/docs → PR → `dev`; `gh pr create` used.

## Exact next action

1. `git switch dev` && `git pull --ff-only origin dev` && `git log --oneline -3`
2. **Choose track:**
   - **B (recommended):** confirm toy-ledger language = Python; `git switch -c feature/toy-ledger`; create `labs/toy-ledger/`
   - **A:** `git switch -c feature/etl-btc`; extend schema/ETL for Bitcoin
3. Optional later: release PR `dev` → `main` to snapshot analytics milestone

## Do not change without discussion

- Permission boundary in `CODING_STUDY_GUIDE_HANDOFF.md` Part I
- Git `feature → dev → main` flow
- Keeping `data/sqlite/*.db` gitignored
