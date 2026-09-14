# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-09-14  
> **Branch observed:** local `dev` @ `f0cacdc`, matching `origin/dev`  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Current objective

Finish **crypto analytics BI** (Tableau line chart + optional schema SQL in repo), then resume **Web3 curriculum** (toy hashed ledger — language not locked in-repo).

## Last completed step (verified)

- Study guide + living `agent-workflow/` merged to `dev` (`7c617bc`, `f0cacdc`); runbooks archived under `oldInstructions/runbooks/`.
- PR #2 on `dev`: repo-relative `fetch_prices.py`, Ruff/`pyproject.toml`, CI npm-cache fix.
- User ran ETL successfully (`ETH: wrote ~31 rows` into `price_daily`).
- Tableau ODBC connected to `blocky_analytics.db`; `assets` + `price_daily` visible in data source (line chart deferred).
- Git: `dev` synced with GitHub; user practiced `git log` ahead/behind checks (`HEAD..origin/dev`, `main..dev`).

## Confirmed state

| Item | Status |
| --- | --- |
| Git flow | `feature/*` or `docs/*` → PR → `dev` → later release PR → `main` |
| Active analytics DB | `data/sqlite/blocky_analytics.db` (gitignored); tables `assets`, `price_daily` |
| `dev` vs GitHub | In sync at `f0cacdc` |
| `main` | Still **8 commits behind `dev`** — no release PR yet |
| Node CI | Runs; npm scripts still placeholders |
| Tableau | Connected; **chart + saved workbook not finished** |
| Schema in repo | **No** `init_schema.sql` / `init_schema.py` yet |

## Blockers / unknowns

- Toy-ledger implementation language not recorded as ADR.
- `data/archive/seed_submissions.py` still has hardcoded Windows path (archived script).
- Pyright/pytest not in project venv yet.
- CoinGecko may be blocked on some networks (SSL); user had success when network allowed.

## Exact next action (next session)

1. `git switch dev` && `git pull origin dev`
2. `git switch -c feature/tableau-analytics`
3. Run `py data\etl\fetch_prices.py`; confirm row counts in DB Browser
4. Create `v_price_trends` view (if missing); add `data/sqlite/init_schema.sql` and commit on feature branch
5. **Tableau:** line chart from `v_price_trends`, save workbook, push branch, PR → `dev`

## Do not change without discussion

- Permission boundary in `CODING_STUDY_GUIDE_HANDOFF.md` Part I
- Git `feature → dev → main` flow
- Keeping SQLite analytics DB gitignored
