# Lab 01 — SQL Fundamentals and Cryptocurrency Analytics

Educational SQL lab against Blocky’s shared analytics database.

## What you will learn

| Script | Focus |
| --- | --- |
| `01_fundamentals.sql` | `SELECT`, `WHERE`, `ORDER BY`, `LIMIT` |
| `02_joins.sql` | Foreign keys, `JOIN`, using `v_price_trends` |
| `03_aggregations.sql` | `COUNT` / `AVG` / `MIN` / `MAX`, `GROUP BY`, CTEs |
| `04_window_functions.sql` | Window functions, moving averages |
| `05_query_performance.sql` | `EXPLAIN QUERY PLAN` (safe indexing demo on a **temp** DB) |

## Database

- File (gitignored): `data/sqlite/blocky_analytics.db`
- Tables: `assets`, `price_daily`
- View: `v_price_trends` (join of prices + asset names)

**Do not** run DDL that changes the live lab DB (no `CREATE INDEX` / `DROP` / `DELETE` on production tables here). Performance indexing practice uses a disposable copy described in `05_query_performance.sql`.

## Open in DBeaver

1. Database → New Database Connection → **SQLite**.
2. Path: browse to your clone, then  
   `data/sqlite/blocky_analytics.db`  
   Example: `C:\Users\User\Desktop\Blocky\data\sqlite\blocky_analytics.db`
3. Test connection → Finish.
4. Open a SQL editor on that connection.
5. File → Open the lab `.sql` file (or copy one exercise at a time).
6. Highlight **one** statement (or one exercise block) → Execute (`Ctrl+Enter`).

Tips:

- Run **Exercises** yourself before peeking at **Solutions**.
- Expected shapes are comments under each exercise — compare columns and rough row counts, not exact USD prices (prices change when ETL re-runs).
- Prefer the view `v_price_trends` for “chart-ready” rows (same idea Tableau / Power BI will use later).

## How this connects later

| Tool | How this lab helps |
| --- | --- |
| **Python** | Same SQL via `sqlite3` / later `pandas.read_sql` |
| **R** | Same SQL via `DBI` + `RSQLite` |
| **Tableau / Power BI** | Connect to this DB; start from `v_price_trends` |
| **DBeaver** | Your interactive SQL IDE for these scripts |

## Order

Start with **`01_fundamentals.sql` → Exercise 1**. Work top to bottom. Do not skip to window functions until joins and aggregates feel comfortable.

## Agent / Git note

Work happens on branch `feature/labs-sql-01`. Do not commit/push until the user asks. Live agent docs: `agent-workflow/AGENT_HANDOFF.md` and `CODE_WALKTHROUGH.md`.
