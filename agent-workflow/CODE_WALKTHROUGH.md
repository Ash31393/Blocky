# Code Walkthrough — Blocky

Companion to `AGENT_HANDOFF.md`.  
Status: 2026-10-14 — Lab 01 SQL scripts created; teaching starts at fundamentals Exercise 1.

## Coverage index

| File | Coverage | Status |
| --- | --- | --- |
| `data/etl/fetch_prices.py` | Prior milestone (ETH+BTC `save_prices`) | Merged via PR #7 |
| `data/etl/init_schema.py` | Seed ETH+BTC; schema + view | Merged / local repair verified |
| `labs/sql/README.md` | Lab orientation + DBeaver setup | Created |
| `labs/sql/01_fundamentals.sql` | SELECT / WHERE / ORDER BY / LIMIT | Teaching now |
| `labs/sql/02_joins.sql` … `05_*.sql` | Joins → windows → EXPLAIN | Created; teach later |

## Data model (why the SQL labs look this way)

```text
assets (id PK, symbol, name, coingecko_id)
    ↑
    │ asset_id  (many prices per asset)
price_daily (asset_id + price_date PK, close_usd, …)

v_price_trends = price_daily INNER JOIN assets
```

- **Dimension** `assets`: one row per coin.
- **Fact** `price_daily`: one row per coin per day.
- **View** `v_price_trends`: chart-ready labels (what Tableau often consumes).

## Lab SQL teaching notes

### `SELECT * FROM assets`

- `SELECT` lists result columns; `*` means every column.
- `FROM assets` names the table.
- Result should be two rows after BTC seed repair: ETH id 1, BTC id 2.

### `WHERE` / `ORDER BY` / `LIMIT`

- `WHERE` filters **rows** before you see them.
- `ORDER BY price_date DESC` puts newest first (ISO dates sort as text).
- `LIMIT 5` returns only five rows — sampling, not a permanent table change.

### Joins (preview for script 02)

- `price_daily.asset_id` matches `assets.id`.
- `INNER JOIN` drops orphans; that is why missing BTC in `assets` hid BTC from the view earlier.

### Performance script 05

- `EXPLAIN QUERY PLAN` is safe on the live DB.
- `CREATE INDEX` only on `ATTACH`ed scratch DB `data/sqlite/_lab01_perf_scratch.db`.

## Synchronization checklist

- [x] Lab 01 files created on `feature/labs-sql-01`
- [x] User verified DBeaver connection and Exercises 1–4 (`SELECT`, `WHERE`, `ORDER BY`, `LIMIT`)
- [ ] User commits `feature/labs-sql-01` and switches to `feature/web3-solidity-lab`
- [ ] Begin Solidity + Testnet + Wallet walkthrough
