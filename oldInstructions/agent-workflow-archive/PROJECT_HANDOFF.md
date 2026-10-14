# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-10-05  
> **Branch observed:** local `feature/etl-btc` @ `845da7e` (same commit as `origin/dev`). Live status is `agent-workflow/AGENT_HANDOFF.md`.  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Agent style (required — do not skip)

**Guided learning is the default.** The user runs commands and writes code; the agent teaches, explains, checks, and debugs.

- Give **one next step at a time**, with **why** and **expected output**.
- Do **not** silently implement whole features unless the user asks for direct implementation.
- Do **not** commit or push unless the user asks.
- Documentation under `agent-workflow/` may be updated without re-asking (factual records only).

## Current objective

Add BTC to the analytics ETL. Toy-ledger step 1 already exists on another branch; it is recorded here and is not the current slice.

## Last completed step (verified)

- Local `dev` fast-forwarded `ed6915e` → `845da7e` and matches `origin/dev` (2026-10-05).
- User chose BTC in the ETL (2026-10-05).
- Toy ledger recovered from GitHub, not from local `dev`: `origin/feature/toy-ledger` @ `ab37c81`, open PR #6 → `dev` (https://github.com/Ash31393/Blocky/pull/6). Python file `labs/toy-ledger/ledger.py` (`133db34`): `Block`, `make_block`, `chain_is_valid`, tamper demo. That file is not in the local `dev` working tree. Branch handoff (2026-10-04) records `valid: True` and `valid after tamper: False`; this session did not re-run the script.
- Local DB has assets ETH id 1 and BTC id 2. After an unauthorized agent run of `fetch_prices.py` (2026-10-05), `price_daily` held 72 ETH dates and 30 BTC dates. Source files were restored afterward. Committed `init_schema.py` still seeds ETH only.

## Confirmed state

| Item | Status |
| --- | --- |
| Local `dev` / `origin/dev` | @ `845da7e` |
| `main` / `origin/main` | @ `7b660df` (behind `dev`; no release PR) |
| Analytics DB | `data/sqlite/blocky_analytics.db` (gitignored) |
| Tableau workbook | `data/tableau/eth_price_trends.twbx` committed on `dev` |
| uv | `pyproject.toml` + `uv.lock` committed on `dev` |
| Toy ledger | Python step 1 on `origin/feature/toy-ledger` @ `ab37c81`; PR #6 open, not merged |

## Exact next action

See `agent-workflow/AGENT_HANDOFF.md`. URL lesson verified (`ETH: wrote 31 rows`). Next: pass `asset_id` and fetch Bitcoin as id 2.

## Do not change without discussion

- Permission boundary in `CODING_STUDY_GUIDE_HANDOFF.md` Part I
- Git `feature → dev → main` flow
- Keeping `data/sqlite/*.db` gitignored
