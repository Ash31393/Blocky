# Sync notes — Blocky

Last updated: 2026-09-12

## Machine / environment (observed)

- OS: Windows 10
- Shell: PowerShell (Starship prompt)
- Python: 3.14.7 via `C:\Python314\python.exe`; project `.venv` created with `uv venv`
- Package manager for Python env: `uv` 0.12.5; Ruff 0.16.6 installed into `.venv`
- Node: present (package.json / CI use Node 20 on Actions)
- Editor: Cursor; Prettier + Ruff extensions intended for format-on-save

## Git (observed after PR #2)

- Branch: `dev` @ `ac32d4a` (Merge pull request #2 from Ash31393/feature/crypto-etl)
- Tracking: `origin/dev`
- `main` still at older tip (`7b660df` era pivot) relative to `dev` merges — release PR not done
- Local feature branches may still exist: `feature/crypto-etl`, `docs/agent-handoff`

## Pending local changes (not committed)

- Deleted tracked: `docs/runbooks/phase-1-data-and-analytics-guide.md`, `project-living-brief.html`, `project-living-brief.pdf`, root `requirements.txt`
- Untracked: `oldInstructions/requirements.txt`, `oldInstructions/runbooks/`, `CODING_STUDY_GUIDE_HANDOFF.md`
- New/updated under `agent-workflow/` living records (this documentation pass) — uncommitted until user authorizes Git

## Resume instructions

1. `git switch dev` && `git pull --ff-only origin dev`
2. Activate venv: `.\.venv\Scripts\Activate.ps1`
3. Read `agent-workflow/PROJECT_HANDOFF.md`
4. Decide: commit docs archival + study guide + agent-workflow living records on a `docs/...` branch, PR → `dev`
