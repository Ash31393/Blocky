# Sync notes — Blocky

Last updated: 2026-10-05

## Machine / environment (observed)

- OS: Windows 10 (build 26200)
- Shell: PowerShell
- Repo path: **`C:\Users\Ashin\blocky`** (ignore stale `C:\Users\User\Desktop\Blocky` references)
- Python: **CPython 3.13.2** in `.venv` (created by `uv venv`); system may also have other Python installs
- Package manager: **`uv`** 0.8.x — dependencies in **`pyproject.toml`** + **`uv.lock`**, not `requirements.txt`
- Dev tools: Ruff in `.venv` (`uv sync --group dev`)
- Node: present (CI uses Node 20 on GitHub Actions)
- Editor: Cursor (Prettier + Ruff format-on-save)
- BI: Tableau Desktop + ODBC → `data/sqlite/blocky_analytics.db` (DSN e.g. `SQLite_Blocky_64`)

## Git (observed 2026-10-05)

- **Current branch:** `dev` @ `845da7e` (tracks `origin/dev`, fast-forwarded from `ed6915e`)
- **`main` / `origin/main`:** @ `7b660df` (behind `dev`)
- **`feature/etl-schema-init`:** still exists locally @ `ce70649`; already contained in `dev` via PR #4
- **`origin/feature/toy-ledger`:** @ `ab37c81` (3 commits ahead of `dev`). Open PR #6. Not checked out locally. File `labs/toy-ledger/ledger.py` is on that branch only.
- **Working tree:** agent-workflow doc refresh (toy-ledger recovery + BTC slice). Commit only if the user asks.
- **Remote:** https://github.com/Ash31393/Blocky.git

## Quick sync commands

```powershell
cd C:\Users\Ashin\blocky
git fetch origin
git status
git log --oneline HEAD..origin/dev    # commits on dev you don't have
git log --oneline origin/dev..HEAD    # commits to push / in PR
git log --oneline main..dev           # release gap
```

## Python / uv (resume)

```powershell
cd C:\Users\Ashin\blocky
uv sync --group dev
.\.venv\Scripts\Activate.ps1
py data\etl\init_schema.py
py data\etl\fetch_prices.py
ruff check data
```

Without activating: `uv run py data\etl\fetch_prices.py`

## Resume instructions

1. Read `agent-workflow/PROJECT_HANDOFF.md` — **Agent style** + **Exact next action**
2. Local `dev` already matches `origin/dev` @ `845da7e` (schema, uv lock, Tableau workbook)
3. User chose BTC in the ETL (2026-10-05). Toy-ledger step 1 is already on open PR #6; do not treat it as unstarted.

## Context / agent hygiene

- Start a **new chat** when context is high (~85%+) or explanations keep getting skipped.
- Handoff files are the source of truth; do not rely on long thread memory.
