# Blocky Master Project Snapshot (Condensed)

## Purpose
Blocky is a build-to-learn blockchain engineering lab. Current focus is **crypto market analytics**: pull real price data, store it in SQLite, then analyze and visualize it.

Learning-platform seed work (users/modules/submissions + Tableau on `learning.db`) is **archived**. Scripts live under `data/archive/`.

## Working Mode
- You run commands, DB tools, Tableau, and integrations.
- Assistant helps with code, schema, docs, and debugging.
- Prefer relative paths so the repo works on any machine.

## Current Status Summary
- Git: working on branch `dev` (tracks `origin/dev`)
- CI baseline exists at `.github/workflows/ci.yml`
- Python ETL stub exists: `data/etl/fetch_prices.py` (CoinGecko ETH daily)
- Target DB: `data/sqlite/blocky_analytics.db` (**not created yet on this PC**)
- Archived: `data/archive/seed_submissions.py` + empty placeholder `data/sqlite/learning.db`
- `requirements.txt` exists (stdlib only for now; untracked until committed)
- Known issue: `fetch_prices.py` still hardcodes `C:\Users\Ashin\...` — must point at this repo’s `data/sqlite/` path

## What You Have Completed
- Repo + GitHub Desktop + Git for Windows on PATH
- Learning schema/seed/Tableau phase (archived)
- Pivot commit: crypto analytics ETL direction

## What Is Blocking Right Now
1. `blocky_analytics.db` does not exist yet.
2. No schema for `assets` / `price_daily` tables the ETL expects.
3. `DB_PATH` in `fetch_prices.py` points at another user’s machine.

## Immediate Next Steps (Crypto ETL Phase)
1. Create `data/sqlite/blocky_analytics.db` with schema:
   - `assets` (id, symbol, name, coingecko_id, …)
   - `price_daily` (asset_id, price_date, close_usd, volume_usd, market_cap_usd, fetched_at)
   - unique constraint on `(asset_id, price_date)` for upserts
2. Seed at least one asset row: Ethereum (`id=1`, symbol `ETH`).
3. Fix `DB_PATH` in `fetch_prices.py` to a repo-relative path.
4. Run `py data/etl/fetch_prices.py` and confirm ~30 ETH daily rows.
5. Validate with SQL, then reconnect Tableau (or start fresh) to `blocky_analytics.db`.

## Suggested Schema (starter)

```sql
CREATE TABLE IF NOT EXISTS assets (
  id INTEGER PRIMARY KEY,
  symbol TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  coingecko_id TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS price_daily (
  asset_id INTEGER NOT NULL REFERENCES assets(id),
  price_date TEXT NOT NULL, -- YYYY-MM-DD UTC
  close_usd REAL NOT NULL,
  volume_usd REAL,
  market_cap_usd REAL,
  fetched_at TEXT NOT NULL,
  PRIMARY KEY (asset_id, price_date)
);

INSERT OR IGNORE INTO assets (id, symbol, name, coingecko_id)
VALUES (1, 'ETH', 'Ethereum', 'ethereum');
```

## Run / Validate

```powershell
# from repo root
py data\etl\fetch_prices.py
```

```sql
SELECT count(*) FROM price_daily WHERE asset_id = 1;
SELECT price_date, close_usd, volume_usd, market_cap_usd
FROM price_daily
WHERE asset_id = 1
ORDER BY price_date DESC
LIMIT 10;
```

## Tools In Use
- Python (`py` launcher), stdlib only (`urllib`, `sqlite3`, `json`, `datetime`)
- SQLite file DB under `data/sqlite/` (gitignored)
- DB Browser for SQLite
- Tableau Desktop via ODBC (point at analytics DB once rows exist)
- Git / GitHub Desktop on `dev`

## Evidence To Capture Next Session
- schema created + ETH asset seeded
- ETL run output (rows written)
- sample `SELECT` from `price_daily`
- note any CoinGecko rate-limit / network errors

## Next Milestone After First Successful Fetch
- Add more assets (BTC, etc.) without hardcoding `asset_id = 1`
- Optional analytics views (returns, rolling averages)
- Tableau sheets on real price history
- Commit `requirements.txt` and path fix on `dev`
