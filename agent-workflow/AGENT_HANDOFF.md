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
| BTC fetch in `main` | **Verified** | user output 2026-10-08: `ETH: wrote 31 rows` / `BTC: wrote 31 rows` |
| Function rename `save_prices` | **Not done** (optional cleanup) | still named `save_eth_prices` |
| Toy ledger on this branch | **Absent** | lives on `origin/feature/toy-ledger` / open PR #6 |
| Docs compact commit | **Committed** | `70feb78` |
| New 3-file workflow install | **Present in working tree** | `AGENT_INSTRUCTIONS` / `HANDOFF` / `WALKTHROUGH` |

Uncommitted until you commit: ETL (`fetch_prices.py`, likely `init_schema.py`) + `agent-workflow/` + archive moves.

## Work in progress

**Milestone:** add Bitcoin to the same ETL path as Ethereum — **verified 2026-10-08.**

Done and verified:

1. Seed BTC as `assets.id = 2`, slug `bitcoin`.
2. Parameterize CoinGecko URL by slug.
3. Pass `asset_id` into save and bind it in the INSERT.
4. `main` fetches/saves ETH (1) and BTC (2); output `ETH: wrote 31 rows` / `BTC: wrote 31 rows`.

Still open (optional / next):

1. Optional rename `save_eth_prices` → `save_prices` (body already generic).
2. Commit ETL + workflow docs on `feature/etl-btc`, then PR → `dev` when user wants.
3. Later: merge toy-ledger PR #6; Tableau for BTC; release `dev` → `main`.

## Important decisions

- Guided learning + `agent-workflow/`-only edit boundary (new system, 2026-10-07).
- Live agent docs = exactly the three files listed above; no competing numbered copies in the repo root.
- Git flow: feature → `dev` → release PR → `main`.
- Keep SQLite DB gitignored.
- Toy-ledger step 1 is Python on PR #6; do not restart that lab during the BTC ETL lesson.
- CoinGecko is the price API; asset identity lives in `assets` (id + `coingecko_id` slug).

## Problems / blockers

- None for the BTC fetch path (verified).
- Changes still local until you commit/push.
- `CODING_STUDY_GUIDE_HANDOFF.md` at repo root is an older large instruction master; day-to-day ops use `agent-workflow/*` (left as study reference unless you ask to archive).

## Learning context

- Python functions: parameters vs literals (why `asset_id` must appear in the SQL tuple, not only the signature).
- HTTP → JSON → relational upsert (`ON CONFLICT`).
- Foreign keys: `price_daily.asset_id` → `assets.id`.
- Git: feature branches vs `dev`; fetch/discover remote branches from another machine.
- Upcoming concepts: generic naming (`save_prices`), multi-asset `main`, later toy-ledger OOP wrap.

## Exact next step

**Optional cleanup:** rename `save_eth_prices` → `save_prices` in the `def` line and both call sites in `main` (same body). Or skip and **commit** the BTC ETL + agent-workflow docs now.

Suggested commit when ready (you run it):

```powershell
git status
git add data/etl/fetch_prices.py data/etl/init_schema.py agent-workflow/ oldInstructions/agent-workflow-archive/
git commit -m "feat(etl): fetch and upsert BTC alongside ETH; compact agent-workflow"
git push
```

Adjust `git add` after you inspect `git status` — include only what belongs in this checkpoint.

### Latest learning checkpoint

- Date: 2026-10-08.
- Verified: `.\.venv\Scripts\python.exe data\etl\fetch_prices.py` → `ETH: wrote 31 rows` and `BTC: wrote 31 rows`.
- Concepts: parameter vs literal; try/finally scope; multi-asset `(slug, asset_id)` pairing.
- Next: optional rename, then commit/push/PR when you want.
