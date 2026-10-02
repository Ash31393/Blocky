# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-09-25  
> **Branch observed:** local `dev` @ `f598113` (confirm still current)  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Agent style (required — do not skip)

**Guided learning is the default.** The user runs commands and writes code; the agent teaches, explains, checks, and debugs.

- Give **one next step at a time**, with **why** and **expected output**.
- Do **not** silently implement whole features unless the user asks for direct implementation.
- Do **not** commit or push unless the user asks.
- Documentation under `agent-workflow/` may be updated without re-asking (factual records only).

## Current objective

Save the Tableau workbook to the repo (or a chosen path), optionally tidy the date axis, then either multi-asset ETL or Web3 toy ledger.

## Last completed step (verified)

- PR #4 on `dev`: `init_schema.py`, `uv.lock`, handoffs.
- SQLite ODBC connected as **BlockAnalytics**; view **`v_price_trends`**.
- **Tableau Sheet 1:** line chart `Price Date` × `SUM(Close Usd)`, Marks = Line, Symbol on Detail; ~45 marks, dates ~2026-08-12 to 2026-09-10, close ~1900→2500. User showed working chart 2026-09-25.
- Workbook save path not yet confirmed in-repo.

## Exact next action

1. **File → Save As** workbook (suggested): `data/tableau/eth_price_trends.twbx` (create folder if needed). Note: `.twbx` may be large; decide whether to gitignore or commit.
2. Optional polish: change **Price Date** type to **Date**, use **Continuous** on Columns; move **Symbol** to **Color**.
3. Optional: commit handoff update on `docs/tableau-chart` → PR → `dev`.
4. Next product slice: BTC in ETL **or** record toy-ledger language + `labs/toy-ledger/`.

## Do not change without discussion

- Permission boundary in `CODING_STUDY_GUIDE_HANDOFF.md` Part I
- Git `feature → dev → main` flow
- Keeping `data/sqlite/*.db` gitignored
