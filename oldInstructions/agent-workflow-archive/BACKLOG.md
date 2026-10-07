# Backlog — Blocky

Deferred ideas. Not authorized work unless the user picks one up.

## Authorized now (2026-10-05)

- [ ] BTC in the ETL on `feature/etl-btc`: seed asset id 2 in `init_schema.py`, then fetch CoinGecko `bitcoin` into `price_daily`

## Proposed next (near-term)

- [ ] Merge PR #6 `feature/toy-ledger` → `dev` when the BTC slice is done (Python step 1 is on that branch only)
- [ ] After that merge: `Ledger` class (`append`, `is_valid`), then signatures (recorded on the toy-ledger branch handoff, 2026-10-04)
- [ ] Optional Tableau polish: continuous **Date** axis, **Symbol** on Color
- [ ] Optional `init_schema.sql` duplicate for BI users
- [ ] Fix hardcoded path in `data/archive/seed_submissions.py` (or document “do not run”)
- [ ] `uv add --dev pyright` (optional pytest when testable behavior exists)
- [ ] Replace Node placeholder lint/test when JS/TS source exists; or add Python job to CI (`uv sync`, `ruff check`)
- [ ] Release PR: `dev` → `main` after analytics checkpoint

## Done recently (reference)

- [x] Local `dev` fast-forwarded to `845da7e` (= `origin/dev`) on 2026-10-05
- [x] PR #5: `data/tableau/eth_price_trends.twbx` on `dev` (`845da7e`)
- [x] PR #4: `init_schema.py`, `pyproject.toml`, `uv.lock` on `dev` (`f598113`)
- [x] `init_schema.py` + `v_price_trends` (`74ed559`)
- [x] **uv** metadata in `pyproject.toml` + `uv.lock`, committed on `dev` (`ce70649`)
- [x] Study guide + agent-workflow living docs on `dev` (`7c617bc`, `f0cacdc`, `ed6915e`)
- [x] Runbooks under `oldInstructions/runbooks/`
- [x] Crypto ETL on `dev` (repo-relative DB path, `price_daily` upsert)
- [x] Git hygiene: user practiced `HEAD..origin/dev` / `main..dev`
- [x] Toy hashed ledger step 1 in Python on `origin/feature/toy-ledger` (`133db34`, `labs/toy-ledger/ledger.py`). PR #6 open as of 2026-10-05. Not on local `dev`.

## Later / curriculum

- Digital signatures lab
- Local chain (Foundry vs Hardhat comparison)
- Simple tested Solidity contract (testnet/local only)
- Read-only explorer module
- Wallet connect (no meaningful funds)
- Hub integration when React mega-API is ready

## Explicitly not started

- Deploying experimental contracts with real value
- Public exposure of admin/homelab services from this repo
