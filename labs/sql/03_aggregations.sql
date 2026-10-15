-- =============================================================================
-- Lab 01 / Script 03 — Aggregations and CTEs
-- Concepts: COUNT, AVG, MIN, MAX, SUM, GROUP BY, HAVING, WITH (CTE)
--
-- Future: these aggregates are what pandas groupby / R dplyr summarise /
-- Tableau LOD or Power BI measures often recreate. Learn them in SQL first.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- CONCEPT BRIEF
-- -----------------------------------------------------------------------------
-- Aggregate functions collapse many rows into a summary.
-- GROUP BY: one output row per group key (e.g. per symbol).
-- HAVING: filter GROUPS (WHERE filters rows before grouping).
-- CTE (WITH name AS (...)): name a subquery for readability; can chain steps.
--
-- SQLite AVG/SUM ignore NULLs. COUNT(*) counts rows; COUNT(col) skips NULL col.


/* =============================================================================
   EXERCISES
   ============================================================================= */

-- Exercise 1 — Per-asset summary
-- For each asset_id: count rows, avg close_usd, min close, max close.
-- Expected shape: 2 rows × several summary columns
-- TODO: your SQL here



-- Exercise 2 — Labeled summary via JOIN
-- Same as Exercise 1 but show symbol instead of (or with) asset_id.
-- Expected shape: 2 rows with BTC and ETH labels
-- TODO: your SQL here



-- Exercise 3 — HAVING
-- Using v_price_trends, group by symbol and keep only symbols whose
-- AVG(close_usd) is greater than 1000 (both coins should pass today).
-- Expected shape: 1–2 rows
-- TODO: your SQL here



-- Exercise 4 — CTE for clarity
-- WITH latest AS (the max price_date overall),
-- select all v_price_trends rows on that latest date.
-- Expected shape: up to 2 rows (one per coin that has that date)
-- TODO: your SQL here



-- Exercise 5 — Verification
-- Expected: two symbols, positive averages
SELECT symbol, COUNT(*) AS n, ROUND(AVG(close_usd), 2) AS avg_close
FROM v_price_trends
GROUP BY symbol
ORDER BY symbol;


/* =============================================================================
   SOLUTIONS
   ============================================================================= */

-- Solution 1
SELECT
  asset_id,
  COUNT(*) AS n_rows,
  AVG(close_usd) AS avg_close,
  MIN(close_usd) AS min_close,
  MAX(close_usd) AS max_close
FROM price_daily
GROUP BY asset_id
ORDER BY asset_id;

-- Solution 2
SELECT
  a.symbol,
  COUNT(*) AS n_rows,
  AVG(p.close_usd) AS avg_close,
  MIN(p.close_usd) AS min_close,
  MAX(p.close_usd) AS max_close
FROM assets AS a
INNER JOIN price_daily AS p ON p.asset_id = a.id
GROUP BY a.symbol
ORDER BY a.symbol;

-- Solution 3
SELECT symbol, AVG(close_usd) AS avg_close
FROM v_price_trends
GROUP BY symbol
HAVING AVG(close_usd) > 1000
ORDER BY symbol;

-- Solution 4
WITH latest AS (
  SELECT MAX(price_date) AS max_day
  FROM v_price_trends
)
SELECT v.*
FROM v_price_trends AS v
INNER JOIN latest AS l ON v.price_date = l.max_day
ORDER BY v.symbol;

-- (Exercise 5 is the verification query above.)
