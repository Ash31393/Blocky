# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-09-22  
> **Branch observed:** local `feature/etl-schema-init` from `dev` @ `ed6915e` (= `origin/dev`)  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Current objective

Add reproducible DB schema init (`data/etl/init_schema.py` and/or SQL), keep Tableau price charting moving, then resume Web3 curriculum (toy hashed ledger — language not locked in-repo).

## Last completed step (verified)

- Study guide + living `agent-workflow/` on `dev` (`7c617bc` … `ed6915e`); runbooks under `oldInstructions/runbooks/`.
- PR #2 on `dev`: repo-relative `fetch_prices.py`, Ruff/`pyproject.toml`, CI npm-cache fix.
- User ran ETL successfully (`ETH: wrote ~31 rows` into `price_daily`).
- Tableau ODBC connected to `blocky_analytics.db`; `assets` + `price_daily` visible (line chart still deferred).
- 2026-09-22: pulled `dev` to `ed6915e`; created `feature/etl-schema-init`; resolved stash conflicts in this handoff.

## Confirmed state

| Item | Status |
| --- | --- |
| Git flow | `feature/*` or `docs/*` → PR → `dev` → later release PR → `main` |
| Active analytics DB | `data/sqlite/blocky_analytics.db` (gitignored); tables `assets`, `price_daily` |
| `dev` vs GitHub | In sync at `ed6915e` before feature branch |
| `main` | Still behind `dev` — no release PR yet |
| Node CI | Runs; npm scripts still placeholders |
| Tableau | Connected; chart + saved workbook not finished |
| Schema in repo | **No** `init_schema.py` / `init_schema.sql` yet — this branch’s job |

## Blockers / unknowns

- Toy-ledger implementation language not recorded as ADR.
- `data/archive/seed_submissions.py` still has hardcoded Windows path (archived script).
- Pyright/pytest not in project venv yet.
- CoinGecko may be blocked on some networks (SSL); user had success when network allowed.

## Exact next action

1. Stay on `feature/etl-schema-init`; mark conflict resolution resolved (`git add` the two files; `git stash drop` if stash remains).
2. Add `data/etl/init_schema.py` (create `assets` + `price_daily`, seed ETH); run it; confirm with a SELECT.
3. Optionally add `v_price_trends` view for Tableau.
4. Commit, push, PR → `dev`; then Tableau line chart on a follow-up branch if preferred.

## Do not change without discussion

- Permission boundary in `CODING_STUDY_GUIDE_HANDOFF.md` Part I
- Git `feature → dev → main` flow
- Keeping SQLite analytics DB under `data/sqlite/` gitignored
