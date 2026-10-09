# Agent Handoff — Blocky

Last updated: 2026-10-07  
Default mode: Guided learning — the agent teaches; the user types/pastes code and runs commands.  
Canonical live docs (only these three):

```text
agent-workflow/
├── AGENT_INSTRUCTIONS.md   ← reusable teaching rules
├── AGENT_HANDOFF.md        ← this file (project state + next step)
└── CODE_WALKTHROUGH.md     ← taught-code explanations
```

Archived older workflow trees: `oldInstructions/` and `oldInstructions/agent-workflow-archive/` (review only; not live status).

## Mandatory edit boundary

**The agent may create or edit files ONLY inside `agent-workflow/`** unless the user explicitly authorizes a named outside action. General “help / continue / fix / build” means teach, not edit app source. The agent may inspect the repo and Git state read-only. The user runs app commands, installs, tests, and Git.

When migrating workflow docs, the user may authorize moves of old instruction copies into `oldInstructions/`.

## Project purpose

**Blocky** is a hands-on crypto analytics + Web3 learning repo. Near-term goal: pull public CoinGecko daily prices into a local SQLite database and explore them (including Tableau). Parallel curriculum: a Python toy hashed ledger lab (append-only chain, tamper detection) on a separate feature branch.

## Current architecture

| Layer | Choice |
| --- | --- |
| Language | Python 3 (stdlib for ETL: `urllib`, `json`, `sqlite3`, `pathlib`, `datetime`) |
| Tooling | `uv` + `pyproject.toml` / `uv.lock`; Ruff in dev group; Prettier/Ruff in VS Code |
| Database | SQLite file `data/sqlite/blocky_analytics.db` (**gitignored**) |
| Schema | `data/etl/init_schema.py` — tables `assets`, `price_daily`, view `v_price_trends` |
| ETL | `data/etl/fetch_prices.py` — CoinGecko `market_chart` → upsert `price_daily` |
| BI | Tableau workbook `data/tableau/eth_price_trends.twbx` (on `dev`) |
| Lab | `labs/toy-ledger/ledger.py` on `feature/toy-ledger` only (not this branch) |
| Git | feature → PR → `dev` → later release PR → `main` |

## Current verified state

Evidence-based only:

| Item | Status | Evidence |
| --- | --- | --- |
| Branch | `feature/etl-btc` tracking `origin/feature/etl-btc` | `git status` 2026-10-07 |
| Last commit on branch tip before local WIP | `70feb78` compact agent-workflow | `git log` |
| `dev` / analytics on remote | schema init, ETH ETL, Tableau, uv lock | merged PRs #2–#5 |
| BTC seed in `init_schema.py` | **Implemented in working tree** (ETH id 1, BTC id 2) | file read 2026-10-07 |
| Seed run listing both assets | **Previously verified** (user output) | earlier session: assets print with ETH + BTC |
| CoinGecko URL takes slug | **Implemented** (`API_TEMPLATE` + `fetch_prices(coingecko_id)`) | file read |
| ETH fetch/save | **Verified earlier** | user paste: `ETH: wrote 31 rows` |
| `asset_id` parameter used in INSERT | **Implemented** (line 55 = `asset_id`) | user edit + file read 2026-10-07 |
| BTC fetch in `main` | **Not implemented** | `main` still only `ethereum` / id 1 |
| Function rename `save_prices` | **Not done** | still named `save_eth_prices` |
| Toy ledger on this branch | **Absent** | lives on `origin/feature/toy-ledger` / open PR #6 |
| Docs compact commit | **Committed** | `70feb78` |
| New 3-file workflow install | **In progress this session** | this handoff |

Uncommitted (as of migration inspect): modified `agent-workflow/*`, modified `data/etl/fetch_prices.py`, untracked numbered root instruction drops (to be archived).

## Work in progress

**Milestone:** add Bitcoin to the same ETL path as Ethereum.

Done in code (not all re-verified this session):

1. Seed BTC as `assets.id = 2`, slug `bitcoin`.
2. Parameterize CoinGecko URL by slug.
3. Pass `asset_id` into the save function and bind it in the INSERT tuple.

Still open:

1. Call save for Bitcoin (`asset_id` 2, slug `"bitcoin"`) from `main`.
2. Optional rename `save_eth_prices` → `save_prices`.
3. User re-run script and paste **both** ETH and BTC print lines.
4. Then commit / PR when user wants.

## Important decisions

- Guided learning + `agent-workflow/`-only edit boundary (new system, 2026-10-07).
- Live agent docs = exactly the three files listed above; no competing numbered copies in the repo root.
- Git flow: feature → `dev` → release PR → `main`.
- Keep SQLite DB gitignored.
- Toy-ledger step 1 is Python on PR #6; do not restart that lab during the BTC ETL lesson.
- CoinGecko is the price API; asset identity lives in `assets` (id + `coingecko_id` slug).

## Problems / blockers

- None blocking the next step.
- `main` still ETH-only, so BTC rows are not produced by the current script path.
- Working tree has uncommitted ETL + workflow changes; not safely “done” until user commits after verification.
- `CODING_STUDY_GUIDE_HANDOFF.md` at repo root is an older large instruction master; superseded for day-to-day agent ops by `agent-workflow/*` (left in place as study reference unless user asks to archive).

## Learning context

- Python functions: parameters vs literals (why `asset_id` must appear in the SQL tuple, not only the signature).
- HTTP → JSON → relational upsert (`ON CONFLICT`).
- Foreign keys: `price_daily.asset_id` → `assets.id`.
- Git: feature branches vs `dev`; fetch/discover remote branches from another machine.
- Upcoming concepts: generic naming (`save_prices`), multi-asset `main`, later toy-ledger OOP wrap.

## Exact next step

**Open** `data/etl/fetch_prices.py`, function `main` (around lines 69–76).

**Replace** the `try` body so it saves both assets (keep the current function name for now):

```python
        eth_count = save_eth_prices(conn, 1, fetch_prices("ethereum"))
        print(f"ETH: wrote {eth_count} rows")
        btc_count = save_eth_prices(conn, 2, fetch_prices("bitcoin"))
        print(f"BTC: wrote {btc_count} rows")
```

**Then run** (from repo root, PowerShell):

```powershell
.\.venv\Scripts\python.exe data\etl\fetch_prices.py
```

**Expect** two lines similar to `ETH: wrote N rows` and `BTC: wrote N rows`. Paste both. Do not assume success until that output appears.

### Latest learning checkpoint

- Date: 2026-10-07.
- Completed: `asset_id` in INSERT; line-by-line review of `fetch_prices.py`; workflow upgraded to 3-file system.
- Waiting on: user edit to `main` + script output for ETH and BTC.
