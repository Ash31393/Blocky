# Backlog — Blocky

Deferred ideas. Not authorized work unless the user picks one up.

## Proposed next (near-term)

- [ ] **Next session:** `feature/tableau-analytics` — `v_price_trends`, `init_schema.sql`, Tableau line chart, PR → `dev`
- [ ] Fix hardcoded path in `data/archive/seed_submissions.py` (or document “do not run”)
- [ ] Install Pyright in `.venv`; optional pytest once there is behavior to test
- [ ] Replace Node placeholder lint/test with real checks when JS/TS source exists; or add Python CI jobs
- [ ] Release PR: `dev` → `main` after analytics checkpoint
- [ ] Record locked toy-ledger language; start step 1 of Web3 sequence

## Done recently (reference)

- [x] Study guide + agent-workflow living docs on `dev` (`7c617bc`, `f0cacdc`)
- [x] Runbooks moved to `oldInstructions/runbooks/` (committed)
- [x] Crypto ETL on `dev` (repo-relative DB path, save to `price_daily`)
- [x] Git hygiene: `dev` synced; user understands `HEAD..origin/dev` / `main..dev`

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
