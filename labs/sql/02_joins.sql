-- =============================================================================
-- Lab 01 / Script 02 — Joins and Foreign Keys
-- Concepts: why asset_id exists, INNER JOIN, LEFT JOIN, using v_price_trends
--
-- Data model reminder:
--   assets.id  <──  price_daily.asset_id   (many prices per one asset)
--   v_price_trends already performs the useful INNER JOIN for BI tools.
--
-- Future: Tableau/Power BI often start from v_price_trends so charts show
-- "BTC" / "ETH" instead of opaque asset_id integers. Python/R can JOIN too.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- CONCEPT BRIEF
-- -----------------------------------------------------------------------------
-- Foreign key (logical): price_daily.asset_id should match assets.id.
-- INNER JOIN: keep rows only when BOTH sides match.
-- LEFT JOIN: keep all rows from the left table; right side may be NULL.
-- Table aliases (a, p): short names so columns stay readable.
--
-- Orphan risk (what we repaired earlier): prices with asset_id not in assets
-- disappear from INNER JOIN / v_price_trends until the parent row exists.


/* =============================================================================
   EXERCISES
   ============================================================================= */

-- Exercise 1 — See both tables’ keys
-- Return assets.id, assets.symbol and a count of matching price_daily rows
-- using a JOIN + GROUP BY (or two queries if you prefer).
-- Hint: JOIN price_daily p ON p.asset_id = a.id
-- Expected shape: 2 rows (ETH count, BTC count)
-- TODO: your SQL here



-- Exercise 2 — Inner join for labeled prices
-- Return symbol, price_date, close_usd for all prices (both coins),
-- newest dates first, limit 10.
-- Expected shape: 10 rows; symbol is 'ETH' or 'BTC' (not just an id)
-- TODO: your SQL here



-- Exercise 3 — Use the view
-- Query v_price_trends for symbol = 'BTC', order by price_date DESC, limit 5.
-- Expected shape: 5 rows; columns include symbol, name, price_date, close_usd
-- TODO: your SQL here



-- Exercise 4 — Same-day comparison (self-style join via two aliases)
-- On dates that exist for BOTH assets, show
--   price_date, eth_close, btc_close
-- Hint: join price_daily to itself on price_date with different asset_id filters,
--       or join two subqueries. Start simple.
-- Expected shape: several rows × 3 columns; only dates present for both coins
-- TODO: your SQL here



-- Exercise 5 — Verification: orphans must be zero
-- Expected shape: one row, orphan_count = 0
SELECT COUNT(*) AS orphan_count
FROM price_daily AS p
LEFT JOIN assets AS a ON a.id = p.asset_id
WHERE a.id IS NULL;


/* =============================================================================
   SOLUTIONS
   ============================================================================= */

-- Solution 1
SELECT a.id, a.symbol, COUNT(p.price_date) AS n_prices
FROM assets AS a
INNER JOIN price_daily AS p ON p.asset_id = a.id
GROUP BY a.id, a.symbol
ORDER BY a.id;

-- Solution 2
SELECT a.symbol, p.price_date, p.close_usd
FROM assets AS a
INNER JOIN price_daily AS p ON p.asset_id = a.id
ORDER BY p.price_date DESC
LIMIT 10;

-- Solution 3
SELECT symbol, name, price_date, close_usd, volume_usd, market_cap_usd
FROM v_price_trends
WHERE symbol = 'BTC'
ORDER BY price_date DESC
LIMIT 5;

-- Solution 4
SELECT
  e.price_date,
  e.close_usd AS eth_close,
  b.close_usd AS btc_close
FROM price_daily AS e
INNER JOIN price_daily AS b
  ON b.price_date = e.price_date
WHERE e.asset_id = 1
  AND b.asset_id = 2
ORDER BY e.price_date DESC;

-- (Exercise 5 is the verification query above.)
