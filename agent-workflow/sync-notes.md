# Sync notes — Blocky

Last updated: 2026-09-22

## Machine / environment (observed)

- OS: Windows 10
- Shell: PowerShell (Starship prompt)
- Python: 3.14.7 via `C:\Python314\python.exe`; project `.venv` via `uv`
- Ruff 0.16.6 in `.venv`
- Node: present (CI uses Node 20 on GitHub Actions)
- Editor: Cursor (Prettier + Ruff format-on-save)
- BI: Tableau Desktop + ODBC → `data/sqlite/blocky_analytics.db` (DSN name may vary by machine)

## Git (observed 2026-09-22)

- **Integration tip:** `origin/dev` @ `ed6915e`
- **Current branch:** `feature/etl-schema-init` (created from that `dev`)
- **`main` / `origin/main`:** still behind `dev` (release PR not done)
- **Remote:** https://github.com/Ash31393/Blocky.git
- Note: an older sync-notes path `C:\Users\Ashin\blocky` is stale; this machine uses `C:\Users\User\Desktop\Blocky`

## Quick sync commands

```powershell
cd C:\Users\User\Desktop\Blocky
git fetch origin
git status
git log --oneline HEAD..origin/dev    # need pull?
git log --oneline origin/dev..HEAD    # need push?
git log --oneline main..dev           # release gap
```

## Resume instructions

1. On `feature/etl-schema-init`, finish conflict cleanup if needed
2. Activate: `.\.venv\Scripts\Activate.ps1`
3. Implement `data/etl/init_schema.py`
4. Read `agent-workflow/PROJECT_HANDOFF.md` for the exact next coding step
