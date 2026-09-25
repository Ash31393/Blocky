"""Create blocky_analytics.db schema and seed Ethereum."""

from __future__ import annotations

import sqlite3
from pathlib import Path

DB_PATH = (
    Path(__file__).resolve().parents[2] / "data" / "sqlite" / "blocky_analytics.db"
)

SCHEMA_SQL = """
CREATE TABLE IF NOT EXISTS assets (
  id INTEGER PRIMARY KEY,
  symbol TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  coingecko_id TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS price_daily (
  asset_id INTEGER NOT NULL REFERENCES assets(id),
  price_date TEXT NOT NULL,
  close_usd REAL NOT NULL,
  volume_usd REAL,
  market_cap_usd REAL,
  fetched_at TEXT NOT NULL,
  PRIMARY KEY (asset_id, price_date)
);

CREATE VIEW IF NOT EXISTS v_price_trends AS
SELECT
  a.symbol,
  a.name,
  p.price_date,
  p.close_usd,
  p.volume_usd,
  p.market_cap_usd
FROM price_daily AS p
JOIN assets AS a ON a.id = p.asset_id
ORDER BY p.price_date;
"""

SEED_SQL = """
INSERT OR IGNORE INTO assets (id, symbol, name, coingecko_id)
VALUES (1, 'ETH', 'Ethereum', 'ethereum');
"""


def main() -> None:
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    try:
        conn.executescript(SCHEMA_SQL)
        conn.execute(SEED_SQL)
        conn.commit()
        assets = conn.execute("SELECT id, symbol, name FROM assets").fetchall()
        print(f"DB ready: {DB_PATH}")
        print(f"assets: {assets}")
    finally:
        conn.close()


if __name__ == "__main__":
    main()
