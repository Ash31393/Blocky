# Code Walkthrough

Status: URL parameter applied and run by the user, 2026-10-05. Next change is **proposed/not yet applied**.  
Location: `agent-workflow/CODE_WALKTHROUGH.md`.  
Companion: `agent-workflow/AGENT_HANDOFF.md`.

## Coverage index

| File | Snapshot | Coverage | Explanation section | Status |
| --- | --- | --- | --- | --- |
| `data/etl/init_schema.py` | User-saved, inspected 2026-10-05. Uncommitted on `feature/etl-btc`. | Lines 43–48. | [Seed](#file-dataetlinit_schemapy) | Applied. User output recorded. |
| `data/etl/fetch_prices.py` | User-saved, inspected 2026-10-05. Uncommitted. | Lines 11–21 and 72 applied. Lines 31 and 55 still hardcode ETH. Proposed `asset_id` parameter not applied. | [URL](#file-dataetlfetch_pricespy) | URL applied. Asset id proposal only. |

Excluded: `uv.lock`, `data/tableau/eth_price_trends.twbx`, and the gitignored SQLite file. `save_eth_prices` body other than the hardcoded `1` is unchanged context.

## Feature and runtime overview

**Confirmed:** `init_schema.py` seeds ETH id 1 and BTC id 2. The user ran it and got both assets in the printout. `fetch_prices.py` builds the CoinGecko URL from a slug. The user ran it and got `ETH: wrote 31 rows`. `save_eth_prices` still stores every row as asset id 1.

**Proposed/not yet applied:** pass that id into the save function and download `bitcoin` into id 2.

## File: `data/etl/init_schema.py`

### Purpose and snapshot

- Language: Python 3
- Role: Create the analytics tables and seed asset rows
- Source date / commit / working-tree state: user-edited, inspected 2026-10-05, uncommitted on `feature/etl-btc`
- Applied status and evidence: lines 43–48 read from disk after the user ran the script
- Coverage: the seed assignment. Lines 1–41 and 51–67 are unchanged context and are not annotated line by line.
- Called by: the user, from PowerShell, in `C:\Users\Ashin\blocky`
- Related tests: no test module. Check is the script printout.

### Exact source excerpt

Applied. Lines 43–48:

```python
SEED_SQL = """
INSERT OR IGNORE INTO assets (id, symbol, name, coingecko_id)
VALUES
  (1, 'ETH', 'Ethereum', 'ethereum'),
  (2, 'BTC', 'Bitcoin', 'bitcoin');
"""
```

### Line-by-line explanation

| Current source line | Exact code | Explanation |
| --- | --- | --- |
| 43 | `SEED_SQL = """` | Starts the Python string `main` passes to `conn.execute`. Triple quotes let it span lines. It ends at line 48. |
| 44 | `INSERT OR IGNORE INTO assets (id, symbol, name, coingecko_id)` | Inserts into `assets`. `OR IGNORE` skips a row that would break the primary key or a unique column. |
| 45 | `VALUES` | Starts the row list. |
| 46 | `(1, 'ETH', 'Ethereum', 'ethereum'),` | ETH row. The comma continues the list. |
| 47 | `(2, 'BTC', 'Bitcoin', 'bitcoin');` | BTC row. Id 2. Slug `bitcoin`. The semicolon ends the SQL statement. |
| 48 | `"""` | Ends the Python string. |

`assets` is a table in this same file's `SCHEMA_SQL`: `id` integer primary key, `symbol` and `coingecko_id` unique. `bitcoin` is a CoinGecko id, not a Python name.

### Concrete execution trace

1. The user saved the two-row seed and ran `.\.venv\Scripts\python.exe data\etl\init_schema.py`.
2. `main` ran the `CREATE` script, executed `SEED_SQL`, committed, and printed id, symbol, and name.
3. Observed output: `DB ready: C:\Users\Ashin\blocky\data\sqlite\blocky_analytics.db` and `assets: [(1, 'ETH', 'Ethereum'), (2, 'BTC', 'Bitcoin')]`.
4. Line 58 still does not print `coingecko_id`. The slug `bitcoin` is in the file at line 47.

### Why this design

`price_daily.asset_id` has to point at a row in `assets`. Seeding BTC here is the record of "id 2 means Bitcoin." Leaving the id only inside `fetch_prices.py` would let a later fetch write prices for an asset the schema script never creates.

`OR IGNORE` will not repair a wrong slug already stored under id 2. This database was previously seen with slug `bitcoin`. The printout does not show `coingecko_id`, because line 58 selects only id, symbol, and name. The listing of BTC is enough for this lesson.

### Verification

| Command or test | What it establishes | Actual result |
| --- | --- | --- |
| `.\.venv\Scripts\python.exe data\etl\init_schema.py` | Seed script runs and lists assets | User output: `DB ready: C:\Users\Ashin\blocky\data\sqlite\blocky_analytics.db` and `assets: [(1, 'ETH', 'Ethereum'), (2, 'BTC', 'Bitcoin')]` |

## File: `data/etl/fetch_prices.py`

### Purpose and snapshot

- Language: Python 3
- Role: Download one coin's daily USD prices and upsert them as asset id 1
- Applied status: lines 11–21 and 72 read from disk after the user ran the script. Output: `ETH: wrote 31 rows`.
- Coverage: the URL function is applied. The next proposal is the hardcoded `1` on line 55 and `main`.

### Exact source excerpt

Applied. Lines 11–21 and 72:

```python
API_TEMPLATE = (
    "https://api.coingecko.com/api/v3/coins/{coingecko_id}/market_chart"
    "?vs_currency=usd&days=30&interval=daily"
)


def fetch_prices(coingecko_id):
    url = API_TEMPLATE.format(coingecko_id=coingecko_id)
    with urllib.request.urlopen(url) as response:
        data = json.loads(response.read())
        return data
```

```python
        payload = fetch_prices("ethereum")
```

Line 55 is still the literal `1`, the first value bound to `asset_id`.

**Proposed/not yet applied.** Change the save function's first line from:

```python
def save_eth_prices(conn, payload):
```

to:

```python
def save_prices(conn, asset_id, payload):
```

Inside the value tuple, replace the literal `1` with `asset_id`. Replace `main`'s try body with:

```python
        eth_count = save_prices(conn, 1, fetch_prices("ethereum"))
        print(f"ETH: wrote {eth_count} rows")
        btc_count = save_prices(conn, 2, fetch_prices("bitcoin"))
        print(f"BTC: wrote {btc_count} rows")
```

### Line-by-line explanation of the proposal

| Proposed code | Explanation |
| --- | --- |
| `def save_prices(conn, asset_id, payload):` | Third parameter is the CoinGecko dict. `asset_id` is the integer from `assets.id`. The old name `save_eth_prices` is removed so a later call cannot forget and use the ETH-only function. |
| `asset_id` in the value tuple | Replaces the literal `1`. SQLite binds it to the first `?`, which is the `asset_id` column. Id `2` matches the BTC row seeded in `init_schema.py`. |
| `save_prices(conn, 1, fetch_prices("ethereum"))` | Downloads ETH, then writes those points as asset 1. The inner call runs first. |
| `save_prices(conn, 2, fetch_prices("bitcoin"))` | Same writer, Bitcoin slug, asset id 2. A mismatch, such as id 1 with slug `bitcoin`, would store BTC prices on the ETH row. |
| `print(f"BTC: wrote {btc_count} rows")` | `btc_count` is how many payload points were visited, not always how many distinct dates remain after the primary key upsert. |

### Verification

| Command or test | What it establishes | Actual result |
| --- | --- | --- |
| `.\.venv\Scripts\python.exe data\etl\fetch_prices.py` | URL parameter still fetches ETH | User output: `ETH: wrote 31 rows` |
| Same command after the `asset_id` edit | BTC points are written as asset 2 | Not run |

## Synchronization checklist

- [x] Seed excerpt matches the inspected file. Line numbers 43–48.
- [x] User output recorded for `init_schema.py` and for the ETH URL step.
- [x] Asset-id change labeled proposed.
- [ ] Update this file after the user pastes the two-line fetch output.
