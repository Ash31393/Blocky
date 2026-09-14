# Session — 2026-09-14 — Git sync + analytics handoff

## What we did

- Verified local `dev` matches `origin/dev` at `f0cacdc` (clean working tree).
- Confirmed `main` / `origin/main` still at `7b660df` — **8 commits behind `dev`** (release PR not done).
- Confirmed `feature/analytics-pivot` fully contained in `dev` (no merge needed).
- Merged `origin/docs/study-guide-living-records` into local `dev` earlier in the week (now on GitHub).
- Reviewed `git log` syntax: `HEAD..origin/dev` (pull?), `origin/dev..HEAD` (push?), `main..dev` (release gap).
- Analytics track status: `fetch_prices.py` on `dev` loads ETH into `blocky_analytics.db`; user connected Tableau via ODBC (`SQLite_Blocky_64`) to `assets` + `price_daily`.

## Concepts covered

- `HEAD`, `A..B` commit range notation, local vs `origin/*` branch labels.
- PowerShell: paste only commands, not prompt/output lines.

## Not done (next session)

- Create `feature/tableau-analytics` from `dev`, push, PR when ready.
- `CREATE VIEW v_price_trends` (if not already in local DB).
- `data/sqlite/init_schema.sql` in repo for reproducible DB setup.
- Finish Tableau line chart (`price_date` vs `close_usd`), save `.twbx`.

## Files touched this session (agent docs only)

- `agent-workflow/PROJECT_HANDOFF.md`
- `agent-workflow/sync-notes.md`
- `agent-workflow/BACKLOG.md`
- this file

## Verification notes

- User to push after agent doc updates (expected on `dev` or a short `docs/...` branch per workflow preference).
