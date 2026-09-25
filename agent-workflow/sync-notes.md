# Sync notes — Blocky

Last updated: 2026-09-23

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

## Git (observed 2026-09-23)

- **Current branch:** `feature/etl-schema-init` @ `74ed559` (tracks `origin/feature/etl-schema-init`)
- **`dev` / `origin/dev`:** @ `ed6915e` (no `init_schema.py` until merge)
- **`main` / `origin/main`:** @ `7b660df` (behind `dev`)
- **Working tree:** modified `pyproject.toml`, untracked `uv.lock` (commit when user asks)
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
2. Merge or continue PR for `feature/etl-schema-init` → `dev`
3. Tableau: chart from `v_price_trends`
4. Commit `pyproject.toml` + `uv.lock` when ready

## Context / agent hygiene

- Start a **new chat** when context is high (~85%+) or explanations keep getting skipped.
- Handoff files are the source of truth; do not rely on long thread memory.
