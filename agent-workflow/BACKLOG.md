# Backlog — Blocky

Deferred ideas. Not authorized work unless the user picks one up.

## Proposed next (near-term)

- [ ] **Merge PR:** `feature/etl-schema-init` → `dev` (`init_schema.py`, view `v_price_trends`)
- [ ] **Commit:** `pyproject.toml` + `uv.lock` (uv project metadata; dev Ruff group)
- [ ] **Tableau:** line chart on `v_price_trends` (`price_date` vs `close_usd`); save `.twbx`
- [ ] Branch `feature/tableau-analytics` or fold into docs session — optional `init_schema.sql` duplicate for BI users
- [ ] Fix hardcoded path in `data/archive/seed_submissions.py` (or document “do not run”)
- [ ] `uv add --dev pyright` (optional pytest when testable behavior exists)
- [ ] Replace Node placeholder lint/test when JS/TS source exists; or add Python job to CI (`uv sync`, `ruff check`)
- [ ] Release PR: `dev` → `main` after analytics checkpoint
- [ ] Record locked toy-ledger language (ADR); start Web3 step 1

## Done recently (reference)

- [x] `init_schema.py` + `v_price_trends` on `feature/etl-schema-init` (`74ed559`)
- [x] Local **uv** + `[project]` / `[dependency-groups]` in `pyproject.toml` + `uv.lock` (2026-09-23, commit pending)
- [x] Study guide + agent-workflow living docs on `dev` (`7c617bc`, `f0cacdc`, `ed6915e`)
- [x] Runbooks under `oldInstructions/runbooks/`
- [x] Crypto ETL on `dev` (repo-relative DB path, `price_daily` upsert)
- [x] Git hygiene: user practiced `HEAD..origin/dev` / `main..dev`

## Later / curriculum

- Digital signatures lab
- Local chain (Foundry vs Hardhat comparison)
- Simple tested Solidity contract (testnet/local only)
- Read-only explorer module
- Wallet connect (no meaningful funds)
- Hub integration when React mega-API is ready
- BTC (or multi-asset) in ETL

## Explicitly not started

- Deploying experimental contracts with real value
- Public exposure of admin/homelab services from this repo
