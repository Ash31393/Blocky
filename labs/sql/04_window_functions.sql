-- =============================================================================
-- Lab 01 / Script 04 — Window Functions
-- Concepts: OVER(), PARTITION BY, ORDER BY in windows, moving average
--
-- Windows compute a value per row WHILE keeping detail rows (unlike GROUP BY).
-- Future: moving averages are classic chart overlays in Tableau/Power BI and
-- easy follow-ons in Python (rolling) / R (zoo, slider).
-- =============================================================================

-- -----------------------------------------------------------------------------
-- CONCEPT BRIEF
-- -----------------------------------------------------------------------------
-- AVG(close_usd) OVER (...)     : average across a window of rows
-- PARTITION BY symbol           : restart the window for each coin
-- ORDER BY price_date           : define time sequence inside the partition
-- ROWS BETWEEN 2 PRECEDING AND CURRENT ROW : 3-day window ending "today"
-- LAG(close_usd, 1)             : previous row's close (daily change helper)
--
-- SQLite supports window functions in modern versions (3.25+). Your Python
-- 3.11+ builds ship a recent enough SQLite for these labs.


/* =============================================================================
   EXERCISES
   ============================================================================= */

-- Exercise 1 — Row number per coin by date
-- From v_price_trends, add rn = ROW_NUMBER() ordered by price_date ascending
-- partitioned by symbol. Then filter WHERE rn <= 3 (oldest 3 days per coin).
-- Hint: use a subquery or CTE wrapping the window.
-- Expected shape: up to 6 rows (3 ETH + 3 BTC)
-- TODO: your SQL here



-- Exercise 2 — Previous close with LAG
-- For symbol = 'ETH', show price_date, close_usd, prev_close
-- using LAG(close_usd, 1) OVER (ORDER BY price_date).
-- Expected shape: many ETH rows; first prev_close is NULL
-- TODO: your SQL here



-- Exercise 3 — 3-day moving average
-- For each symbol, compute ma3 = AVG(close_usd) OVER (
--   PARTITION BY symbol ORDER BY price_date
--   ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
-- Return symbol, price_date, close_usd, ma3 for the latest 5 dates of BTC only
-- (wrap in CTE / subquery + filter + ORDER BY + LIMIT).
-- Expected shape: 5 rows; ma3 near close_usd
-- TODO: your SQL here



-- Exercise 4 — Verification: window does not collapse rows
-- Count rows in v_price_trends vs count of a window query selecting same base.
-- Expected: both counts equal (window adds columns, does not GROUP)
SELECT COUNT(*) AS view_rows FROM v_price_trends;

SELECT COUNT(*) AS windowed_rows
FROM (
  SELECT
    symbol,
    price_date,
    close_usd,
    AVG(close_usd) OVER (
      PARTITION BY symbol
      ORDER BY price_date
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS ma3
  FROM v_price_trends
) AS w;


/* =============================================================================
   SOLUTIONS
   ============================================================================= */

-- Solution 1
WITH numbered AS (
  SELECT
    symbol,
    price_date,
    close_usd,
    ROW_NUMBER() OVER (
      PARTITION BY symbol
      ORDER BY price_date ASC
    ) AS rn
  FROM v_price_trends
)
SELECT symbol, price_date, close_usd, rn
FROM numbered
WHERE rn <= 3
ORDER BY symbol, price_date;

-- Solution 2
SELECT
  price_date,
  close_usd,
  LAG(close_usd, 1) OVER (ORDER BY price_date) AS prev_close
FROM v_price_trends
WHERE symbol = 'ETH'
ORDER BY price_date;

-- Solution 3
WITH dated AS (
  SELECT
    symbol,
    price_date,
    close_usd,
    AVG(close_usd) OVER (
      PARTITION BY symbol
      ORDER BY price_date
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS ma3
  FROM v_price_trends
)
SELECT symbol, price_date, close_usd, ma3
FROM dated
WHERE symbol = 'BTC'
ORDER BY price_date DESC
LIMIT 5;

-- (Exercise 4 is the verification block above.)
