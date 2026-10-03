# Backlog — Blocky

Deferred ideas. Not authorized work unless the user picks one up.

## Proposed next (near-term)

- [ ] **Recommended:** Record toy-ledger language (Python) as ADR; start `feature/toy-ledger` + `labs/toy-ledger/`
- [ ] Optional: BTC (or multi-asset) in ETL + Tableau
- [ ] Release PR: `dev` → `main` (analytics + Tableau checkpoint)
- [ ] Fix hardcoded path in `data/archive/seed_submissions.py` (or document “do not run”)
- [ ] `uv add --dev pyright` (optional pytest when testable behavior exists)
- [ ] Replace Node placeholder lint/test when JS/TS source exists; or add Python job to CI (`uv sync`, `ruff check`)

## Done recently (reference)

- [x] Tableau ETH chart + `data/tableau/eth_price_trends.twbx` on `dev` (2026-10-02)
- [x] `init_schema.py` + `v_price_trends` (PR #4)
- [x] **uv** + `pyproject.toml` + `uv.lock` on `dev`
- [x] Study guide + agent-workflow living docs on `dev`
- [x] Crypto ETL on `dev` (repo-relative DB path, `price_daily` upsert)
- [x] Git hygiene: feature → PR → `dev`; `gh pr create`

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
