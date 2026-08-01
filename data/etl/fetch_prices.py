
import json
import sqlite3
import urllib.request
from datetime import datetime, timezone

DB_PATH = r"C:\Users\Ashin\blocky\data\sqlite\blocky_analytics.db"
API_URL = (
    "https://api.coingecko.com/api/v3/coins/ethereum/market_chart"
    "?vs_currency=usd&days=30&interval=daily"
)


def fetch_prices():
    with urllib.request.urlopen(API_URL) as response:
        data = json.loads(response.read())
        return data


def connect():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


def save_eth_prices(conn, payload):
    prices = payload["prices"]
    volumes = {ms: v for ms, v in payload.get("total_volumes", [])}
    market_caps = {ms: m for ms, m in payload.get("market_caps", [])}
    fetched_at = datetime.now(timezone.utc).isoformat()

    cur = conn.cursor()
    rows_written = 0

    for ms, close_usd in prices:
        price_date = datetime.fromtimestamp(
            ms / 1000, tz=timezone.utc
        ).strftime("%Y-%m-%d")

        cur.execute(
            """
            INSERT INTO price_daily (
              asset_id, price_date, close_usd, volume_usd, market_cap_usd, fetched_at
            ) VALUES (?, ?, ?, ?, ?, ?)
            ON CONFLICT(asset_id, price_date) DO UPDATE SET
              close_usd = excluded.close_usd,
              volume_usd = excluded.volume_usd,
              market_cap_usd = excluded.market_cap_usd,
              fetched_at = excluded.fetched_at
            """,
            (1, price_date, close_usd, volumes.get(
                ms), market_caps.get(ms), fetched_at),
        )
        rows_written += 1

    conn.commit()
    return rows_written


def main():
    conn = connect()
    try:
        payload = fetch_prices()
        count = save_eth_prices(conn, payload)
        print(f"ETH: wrote {count} rows")
    finally:
        conn.close()


if __name__ == "__main__":
    main()
