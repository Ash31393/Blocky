# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-09-23  
> **Branch observed:** `feature/etl-schema-init` @ `74ed559` (= `origin/feature/etl-schema-init`)  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Agent style (required — do not skip)

**Guided learning is the default.** The user runs commands and writes code; the agent teaches, explains, checks, and debugs.

- Give **one next step at a time** (command or small code section), with **why** and **expected output**.
- Do **not** silently implement whole features, bulk-edit, or skip rationale unless the user explicitly asks for direct implementation.
- Do **not** commit or push unless the user asks.
- Documentation under `agent-workflow/` may be updated without re-asking (factual records only).

## Current objective

Merge schema init into `dev`, finish Tableau chart on `v_price_trends`, commit **uv** / **`pyproject.toml`** setup, then continue Web3 curriculum (toy hashed ledger — language not ADR-locked).

## Last completed step (verified)

- **`data/etl/init_schema.py`** on `feature/etl-schema-init` (`74ed559`): `assets`, `price_daily`, view **`v_price_trends`**, seed ETH (`INSERT OR IGNORE`).
- **`data/etl/fetch_prices.py`** on `dev` (via PR #2 history): CoinGecko `market_chart`, repo-relative `DB_PATH`, ETH → `price_daily` upsert; user run succeeded (`ETH: wrote ~31 rows`).
- **Tableau:** ODBC to `blocky_analytics.db`; `assets` + `price_daily` connected; **line chart from `v_price_trends` not finished**; workbook save deferred.
- **Local Python env (not committed yet):** `[project]` + `[dependency-groups] dev` in `pyproject.toml`, **`uv.lock`**, `.venv` via `uv venv` + `uv sync --group dev` (Ruff only; ETL is stdlib).
- Study guide + living `agent-workflow/` on `dev` @ `ed6915e`; runbooks under `oldInstructions/runbooks/`.

## Confirmed state

| Item | Status |
| --- | --- |
| Git flow | `feature/*` or `docs/*` → PR → `dev` → later release PR → `main` |
| Active analytics DB | `data/sqlite/blocky_analytics.db` (gitignored); `assets`, `price_daily`, view `v_price_trends` |
| `dev` / `origin/dev` | @ `ed6915e` — **does not include `init_schema.py` until PR merge** |
| `feature/etl-schema-init` | Pushed @ `74ed559`; **open or merge PR → `dev`** |
| `main` / `origin/main` | @ `7b660df` — behind `dev`; no release PR yet |
| Dependencies | **`pyproject.toml` + `uv.lock`** (not `requirements.txt`); `oldInstructions/requirements.txt` is archive commentary only |
| Uncommitted local | Modified `pyproject.toml`, untracked `uv.lock` (on feature branch as of 2026-09-23) |
| Node CI | Runs; npm scripts still placeholders |
| Tableau | Connected; chart + saved `.twbx` not finished |

## Blockers / unknowns

- Toy-ledger implementation language not recorded as ADR.
- `data/archive/seed_submissions.py` hardcoded Windows path (archived).
- Pyright/pytest not in dev group yet.
- CoinGecko may fail on some networks (SSL); works when network allows.

## Exact next action

1. **User:** Open PR **`feature/etl-schema-init` → `dev`**, review, merge; then `git checkout dev && git pull`.
2. **User:** Commit **`pyproject.toml`** + **`uv.lock`** on appropriate branch (same PR or follow-up `docs/chore-uv` — user choice).
3. **User (Tableau):** New sheet from **`v_price_trends`**: line chart `price_date` vs `close_usd`, filter/symbol ETH; save workbook.
4. **Optional ETL:** BTC via second CoinGecko id + `asset_id=2` after schema merge.

## Do not change without discussion

- Permission boundary in `CODING_STUDY_GUIDE_HANDOFF.md` Part I
- Git `feature → dev → main` flow
- Keeping SQLite analytics DB under `data/sqlite/` gitignored

## New chat — paste this

```text
Read agent-workflow/PROJECT_HANDOFF.md (Agent style section first), sync-notes.md, and BACKLOG.md.
Repo: Blocky @ C:\Users\Ashin\blocky. Guided learning: I run commands, you explain one step at a time.
Continue from "Exact next action" in PROJECT_HANDOFF.md.
```
