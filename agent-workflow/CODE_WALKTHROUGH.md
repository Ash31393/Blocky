# Code Walkthrough — Blocky

Companion to `AGENT_HANDOFF.md` / `AGENT_INSTRUCTIONS.md`.  
Agent maintains this file. Label proposed vs applied. Record verification only from evidence.

Status: 2026-10-07 — URL slug + `asset_id` in INSERT applied. `main` still ETH-only (**BTC call proposed**).

## Coverage index

| File | Snapshot | Coverage | Status |
| --- | --- | --- | --- |
| `data/etl/init_schema.py` | Working tree 2026-10-07 | Seed `SEED_SQL` (ETH+BTC) | Applied in file; earlier user run listed both assets |
| `data/etl/fetch_prices.py` | Working tree 2026-10-07 | Full file; focus save + `main` | URL + `asset_id` applied; BTC in `main` pending |
| `labs/toy-ledger/ledger.py` | Other branch / PR #6 | Not on `feature/etl-btc` | Deferred |

Excluded from exhaustive coverage: `uv.lock`, Tableau `.twbx`, gitignored `.db`, archived docs under `oldInstructions/`.

## Feature and runtime overview

```text
CoinGecko HTTP (slug)
    → JSON { prices, total_volumes, market_caps }
    → save_*(conn, asset_id, payload)
    → SQLite price_daily (upsert on asset_id + price_date)
```

`assets` rows (id 1 ETH / id 2 BTC) come from `init_schema.py`. Fetch script must pass matching `(slug, asset_id)` pairs.

## File: `data/etl/init_schema.py`

**Role:** create tables/view and seed asset rows.

Applied seed:

```python
SEED_SQL = """
INSERT OR IGNORE INTO assets (id, symbol, name, coingecko_id)
VALUES
  (1, 'ETH', 'Ethereum', 'ethereum'),
  (2, 'BTC', 'Bitcoin', 'bitcoin');
"""
```

- `INSERT OR IGNORE` — skip if primary key / unique already present.
- `coingecko_id` — API slug string, not a Python name.
- Common mistake: fetching `bitcoin` but writing `asset_id=1` (prices land on ETH).

## File: `data/etl/fetch_prices.py`

### Imports and paths

| Lines | Idea |
| --- | --- |
| `json`, `sqlite3`, `urllib.request` | Parse API, talk to SQLite, HTTP without third-party deps |
| `Path(__file__).resolve().parents[2] / "data" / "sqlite" / ...` | Repo-relative DB path (works across machines) |
| `API_TEMPLATE` with `{coingecko_id}` | Filled by `.format` in `fetch_prices` |

### `fetch_prices(coingecko_id)`

Builds URL → `urlopen` → `json.loads` → returns dict. Parameter is the CoinGecko slug (`"ethereum"`, `"bitcoin"`).

### `connect()`

Ensures parent dir exists, `sqlite3.connect`, `row_factory = sqlite3.Row`, returns connection.

### `save_eth_prices(conn, asset_id, payload)` (name still ETH-specific)

| Piece | Meaning |
| --- | --- |
| `asset_id` | Integer FK → `assets.id`; must be used in the INSERT tuple |
| `payload["prices"]` | List of `[ms, usd]` |
| volume/mcap dicts | Keyed by same millisecond for `.get(ms)` |
| `ms / 1000` → `%Y-%m-%d` | CoinGecko ms timestamp → UTC date string |
| `INSERT ... ON CONFLICT(asset_id, price_date) DO UPDATE` | Upsert; re-runs refresh values |
| Line 55 `asset_id` | **Applied** — first bound `?` is the caller’s id |
| return `rows_written` | Loop count (points visited), not “new PK rows only” |

**Design note:** Body is already generic; renaming to `save_prices` is cleanup so callers do not think the function is ETH-only.

### `main()` — current vs proposed

**Current (applied):**

```python
        payload = fetch_prices("ethereum")
        count = save_eth_prices(conn, 1, payload)
        print(f"ETH: wrote {count} rows")
```

**Proposed / not yet applied:**

```python
        eth_count = save_eth_prices(conn, 1, fetch_prices("ethereum"))
        print(f"ETH: wrote {eth_count} rows")
        btc_count = save_eth_prices(conn, 2, fetch_prices("bitcoin"))
        print(f"BTC: wrote {btc_count} rows")
```

- Inner `fetch_prices(...)` runs first; result feeds save.
- Id `2` must match the BTC seed in `init_schema.py`.
- `try`/`finally` still closes the connection.

### Verification

| Check | Result |
| --- | --- |
| Earlier ETH run | `ETH: wrote 31 rows` (user) |
| After BTC `main` edit | Not run yet — need both print lines |

## Synchronization checklist

- [x] `asset_id` in INSERT documented
- [x] Full-file teaching notes for current ETL lesson
- [ ] Update after user applies BTC `main` + pastes output
- [ ] Optional rename `save_prices` when user does it
