# Sync notes — Blocky

Last updated: 2026-09-14

## Machine / environment (observed)

- OS: Windows 10
- Shell: PowerShell
- Python: 3.14.x via `C:\Python314\python.exe`; project `.venv` via `uv` (when used)
- Node: present (CI uses Node 20 on GitHub Actions)
- Editor: Cursor
- BI: Tableau Desktop + ODBC DSN `SQLite_Blocky_64` → `data/sqlite/blocky_analytics.db`

## Git (observed 2026-09-14)

- **Current tip for integration work:** `dev` @ `f0cacdc` = `origin/dev`
- **Working tree:** clean (before user commits agent-workflow session docs)
- **`main` / `origin/main`:** @ `7b660df` — **8 commits behind `dev`**
- **Stale local branches (safe to keep):** `feature/analytics-pivot` @ `7b660df` (already in `dev` history)
- **Remote:** https://github.com/Ash31393/Blocky.git

## Quick sync commands

```powershell
cd C:\Users\Ashin\blocky
git fetch origin
git status
git log --oneline HEAD..origin/dev    # need pull?
git log --oneline origin/dev..HEAD    # need push?
git log --oneline main..dev           # release gap
```

## Resume instructions

1. `git switch dev` && `git pull origin dev`
2. Read `agent-workflow/PROJECT_HANDOFF.md`
3. Start `feature/tableau-analytics` for Tableau + `init_schema.sql`
4. Optional venv: `.\.venv\Scripts\Activate.ps1`
