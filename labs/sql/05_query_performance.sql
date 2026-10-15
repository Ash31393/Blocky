-- =============================================================================
-- Lab 01 / Script 05 — Query Plans and Indexing (SAFE)
-- Concepts: EXPLAIN QUERY PLAN, what indexes do, why not index casually
--
-- SAFETY RULES
--   * You MAY run EXPLAIN QUERY PLAN on the live blocky_analytics.db
--   * Do NOT CREATE INDEX / DROP INDEX on the live analytics DB in this lab
--   * Index experiments use an ATTACH'ed disposable file (or :memory:)
--
-- Future: BI tools and Python still benefit when the warehouse is indexed
-- thoughtfully — but analytics learning DBs stay small; measure before adding.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- CONCEPT BRIEF
-- -----------------------------------------------------------------------------
-- EXPLAIN QUERY PLAN: shows how SQLite intends to read data (scan vs search).
-- Table scan: read many/most rows (fine for tiny tables).
-- Index search: jump to matching keys (helps large filters/sorts/joins).
-- Primary keys and UNIQUE columns already have implicit indexes in SQLite.
-- price_daily PRIMARY KEY (asset_id, price_date) already helps lookups by asset+date.


/* =============================================================================
   PART A — EXERCISES on the LIVE DB (read-only plans; no DDL)
   ============================================================================= */

-- Exercise 1 — Plan for filtered prices
-- Run and read the plan output (DBeaver shows it as a result grid).
EXPLAIN QUERY PLAN
SELECT price_date, close_usd
FROM price_daily
WHERE asset_id = 2
ORDER BY price_date DESC
LIMIT 5;

-- Expected shape: a few plan rows mentioning SCAN or SEARCH on price_daily
-- Ask: does it use the primary key index?


-- Exercise 2 — Plan for the view
EXPLAIN QUERY PLAN
SELECT symbol, price_date, close_usd
FROM v_price_trends
WHERE symbol = 'ETH'
ORDER BY price_date DESC
LIMIT 10;

-- Expected: plan may SCAN/SEARCH base tables behind the view


-- Exercise 3 — Verification counts (live DB, SELECT only)
SELECT COUNT(*) AS assets_n FROM assets;
SELECT COUNT(*) AS prices_n FROM price_daily;


/* =============================================================================
   PART B — DISPOSABLE INDEX DEMO (does NOT touch live tables)
   Uses ATTACH to a temporary file next to the DB, copies a SAMPLE, indexes THERE.
   After you finish, you may delete the temp file from disk.
   ============================================================================= */

-- Step B1 — Attach a disposable database file (creates empty file if needed)
ATTACH DATABASE 'data/sqlite/_lab01_perf_scratch.db' AS scratch;

-- Step B2 — Build a small copy of price_daily inside scratch (sample only)
DROP TABLE IF EXISTS scratch.price_daily_sample;
CREATE TABLE scratch.price_daily_sample (
  asset_id INTEGER NOT NULL,
  price_date TEXT NOT NULL,
  close_usd REAL NOT NULL,
  PRIMARY KEY (asset_id, price_date)
);

INSERT INTO scratch.price_daily_sample (asset_id, price_date, close_usd)
SELECT asset_id, price_date, close_usd
FROM main.price_daily;

-- Step B3 — Plan BEFORE an extra index on close_usd (scratch only)
EXPLAIN QUERY PLAN
SELECT asset_id, price_date, close_usd
FROM scratch.price_daily_sample
WHERE close_usd > 1000
ORDER BY close_usd DESC
LIMIT 20;

-- Step B4 — Create an index ONLY on the scratch copy
CREATE INDEX IF NOT EXISTS scratch.idx_sample_close
ON price_daily_sample (close_usd);

-- Step B5 — Plan AFTER the index
EXPLAIN QUERY PLAN
SELECT asset_id, price_date, close_usd
FROM scratch.price_daily_sample
WHERE close_usd > 1000
ORDER BY close_usd DESC
LIMIT 20;

-- Compare B3 vs B5: look for SEARCH using idx_sample_close vs SCAN.

-- Step B6 — Cleanup detach (temp file can remain; delete manually if you want)
DETACH DATABASE scratch;

-- Optional (PowerShell, outside SQLite), after DETACH:
--   Remove-Item data\sqlite\_lab01_perf_scratch.db -ErrorAction SilentlyContinue


/* =============================================================================
   SOLUTIONS / NOTES (Part A is self-running EXPLAIN; no separate “answers”)
   ============================================================================= */

-- Takeaways:
-- 1. Live DB: explain plans freely; do not add indexes without a measured need.
-- 2. Existing PK (asset_id, price_date) already supports common ETL/BI access.
-- 3. Extra indexes speed some filters but slow writes and use disk — tradeoffs.
-- 4. Scratch DB keeps experiments from polluting analytics data used by Tableau.
