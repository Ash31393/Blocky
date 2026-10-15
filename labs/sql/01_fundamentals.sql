-- =============================================================================
-- Lab 01 / Script 01 — SQL Fundamentals
-- Database: data/sqlite/blocky_analytics.db  (SQLite)
-- Concepts: SELECT, column lists, WHERE, ORDER BY, LIMIT, DISTINCT
--
-- How to use in DBeaver:
--   1. Connect to blocky_analytics.db
--   2. Run ONE exercise statement at a time (highlight + Ctrl+Enter)
--   3. Compare to the "Expected shape" comment
--   4. Only then scroll to SOLUTIONS
--
-- Future tools: the same SELECT shapes feed Python/R data frames and BI charts.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- CONCEPT BRIEF
-- -----------------------------------------------------------------------------
-- SELECT     : which columns (or expressions) to return
-- FROM       : which table or view
-- WHERE      : keep only rows that match a condition (filter)
-- ORDER BY   : sort the result (ASC default, DESC for newest/highest first)
-- LIMIT      : cap how many rows you see (handy for sampling)
-- DISTINCT   : unique values only (no duplicate rows in the result set)
--
-- SQLite notes:
--   * Text dates like '2026-10-11' sort correctly as ISO strings (YYYY-MM-DD).
--   * String literals use single quotes: 'ETH'
--   * Double quotes are for identifiers if needed; prefer unquoted names here.


/* =============================================================================
   EXERCISES — try these first (no peeking below)
   ============================================================================= */

-- Exercise 1 — List every asset
-- Goal: see the dimension table that price_daily references.
-- Write a query that returns all columns from assets.
-- Expected shape: 2 rows (ETH, BTC); columns include id, symbol, name, coingecko_id
-- TODO: your SQL here



-- Exercise 2 — Project specific columns
-- Goal: SELECT is not "always *". Choose only what you need.
-- Return symbol and name from assets, ordered by symbol ascending.
-- Expected shape: 2 rows × 2 columns (BTC then ETH if alphabetical)
-- TODO: your SQL here



-- Exercise 3 — Filter with WHERE
-- Goal: boolean conditions on rows.
-- Return all columns from price_daily where asset_id = 1 (Ethereum).
-- Expected shape: many rows (tens); only asset_id 1; includes price_date, close_usd
-- TODO: your SQL here



-- Exercise 4 — Filter + sort + limit
-- Goal: combine WHERE, ORDER BY, LIMIT — common “latest prices” pattern.
-- For asset_id = 2 (Bitcoin), return price_date and close_usd,
-- newest dates first, only the 5 most recent rows.
-- Expected shape: 5 rows × 2 columns; first row is the latest BTC date in your DB
-- TODO: your SQL here



-- Exercise 5 — DISTINCT dates
-- Goal: uniqueness.
-- Return the distinct price_date values from price_daily, oldest first, limit 10.
-- Expected shape: up to 10 rows × 1 column
-- TODO: your SQL here



-- Exercise 6 — Verification query (run anytime)
-- Goal: confirm both coins still have prices (hygiene check).
-- Expected shape: 2 rows — (1, …) and (2, …) with positive counts
SELECT asset_id, COUNT(*) AS n_rows, MIN(price_date) AS first_day, MAX(price_date) AS last_day
FROM price_daily
GROUP BY asset_id
ORDER BY asset_id;


/* =============================================================================
   SOLUTIONS — check only after you try the exercises
   ============================================================================= */

-- Solution 1
SELECT *
FROM assets;

-- Solution 2
SELECT symbol, name
FROM assets
ORDER BY symbol ASC;

-- Solution 3
SELECT *
FROM price_daily
WHERE asset_id = 1;

-- Solution 4
SELECT price_date, close_usd
FROM price_daily
WHERE asset_id = 2
ORDER BY price_date DESC
LIMIT 5;

-- Solution 5
SELECT DISTINCT price_date
FROM price_daily
ORDER BY price_date ASC
LIMIT 10;

-- (Exercise 6 is already a runnable verification query above.)
