# Troubleshooting — Blocky

Record errors with date, environment, trigger, exact message (no secrets), hypothesis, what was tried, result, and next suggestion.

## 2026-09-09 — CI Setup Node failed (no lockfile)

- **Machine:** GitHub Actions `ubuntu-latest`
- **Trigger:** Push/PR on docs and feature branches
- **Error:** `Dependencies lock file is not found ... Supported file patterns: package-lock.json, npm-shrinkwrap.json, yarn.lock`
- **Cause:** `.github/workflows/ci.yml` set `cache: npm` without a lockfile in the repo
- **Tried:** Identified from Actions log; removed `cache: npm` on `feature/crypto-etl` (`a9b89d8`)
- **Result:** Resolved and verified — PR #2 checks passed
- **Status:** resolved and verified

## 2026-09-09 — `git` not on PATH after GitHub Desktop

- **Machine:** Windows PowerShell on development PC
- **Trigger:** `git branch`
- **Error:** `git` not recognized
- **Cause:** GitHub Desktop’s bundled git not on PATH; official Git for Windows not installed yet
- **Tried:** Located Desktop’s internal `git.exe`; user installed Git for Windows manually
- **Result:** `git version 2.55.0.windows.3` works
- **Status:** resolved and verified

## 2026-09-09 — Ruff E501 / UP017 on `data/`

- **Trigger:** `py -m ruff check data`
- **Issues:** line length; prefer `datetime.UTC`; format drift
- **Tried:** `ruff check --fix`, `ruff format`, manual wrap of long SQL string in archive seed script
- **Result:** `All checks passed!`
- **Status:** resolved and verified

## Open / known

- Archive `seed_submissions.py` still hardcodes `C:\Users\Ashin\...` (fails on other machines if run). Proposed fix: repo-relative Path like `fetch_prices.py`. Not fixed yet.
- Root `pip install ruff` went to user site-packages before venv existed. Prefer `.venv` + `uv pip install` going forward.
