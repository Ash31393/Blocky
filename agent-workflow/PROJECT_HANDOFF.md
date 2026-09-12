# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-09-12  
> **Branch observed:** local `dev` matching `origin/dev` at merge of PR #2  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Current objective

Keep crypto analytics ETL usable and documented; finish leftover docs archival; then resume the Web3 curriculum (toy hashed ledger language still not recorded as locked in-repo).

## Last completed step (verified)

- PR #1 merged into `dev`: agent-workflow templates + archived old root handoffs.
- PR #2 merged into `dev` (`ac32d4a`): repo-relative `fetch_prices.py`, CI npm-cache removal, Ruff/`pyproject.toml`, `.vscode` Python format-on-save.
- Local `.venv` via `uv`; Ruff installed in venv; `ruff check data` passed.
- User ran `py data\etl\fetch_prices.py` → `ETH: wrote 31 rows`; later count query showed `30` price_daily rows with recent closes (~2460–2514 USD).
- User added repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (2026-09-12).

## Confirmed state

| Item | Status |
| --- | --- |
| Git flow | `feature/*` or `docs/*` → PR → `dev` → later release PR → `main` |
| Active analytics DB | `data/sqlite/blocky_analytics.db` (gitignored); tables `assets`, `price_daily`; ETH seeded |
| Learning DB track | Archived under `data/archive/`; empty/placeholder `learning.db` may exist locally |
| Node CI | Runs; npm scripts still placeholders; `cache: npm` removed until lockfile exists |
| `main` | Still behind `dev` (no release PR yet) |

## Blockers / unknowns

- Exact toy-ledger implementation language not captured as a locked decision in current docs.
- `data/archive/seed_submissions.py` still has hardcoded `C:\Users\Ashin\...` path (CodeRabbit note on PR #2; archived script).
- Local uncommitted move: `docs/runbooks/*` and root `requirements.txt` deleted from tracked paths; content present under `oldInstructions/` but not committed.
- Pyright/pytest not installed in project venv yet.
- No in-repo schema init script yet (schema was created via one-off `py -c`).

## Exact next action

1. User: commit leftover archival on a `docs/...` branch from updated `dev`, PR into `dev` (do not commit on `dev` directly if following GIT_WORKFLOW).
2. Optional: add `data/etl/init_schema.py` (or SQL file) so DB setup is reproducible.
3. Optional: fix archive script path or leave until touched.
4. After docs clean: choose/record toy-ledger language, then start `labs/toy-ledger/` (or agreed path) on a new feature branch.

## Do not change without discussion

- Permission boundary in `CODING_STUDY_GUIDE_HANDOFF.md` Part I
- Git `feature → dev → main` flow
- Keeping SQLite analytics DB gitignored
