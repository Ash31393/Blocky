# ADR-0002: Toy ledger step 1 is Python

- Date: 2026-10-04 (recorded 2026-10-05; missing from the `dev` handoff until then)
- Status: Accepted for the toy-ledger lab

## Context

Curriculum step 1 is an append-only hashed ledger. The language was discussed in chat and implemented, then left unrecorded on `dev`.

## Decision

Step 1 is Python: `labs/toy-ledger/ledger.py` on `origin/feature/toy-ledger` @ `133db34`. Open PR #6 targets `dev` and was not merged as of 2026-10-05.

The file defines `Block`, `sha256_hex`, `make_block`, and `chain_is_valid`, and demonstrates a tamper that fails validation. The branch handoff records `valid: True` and `valid after tamper: False`.

## Alternatives considered

- JavaScript or Solidity for the first ledger — not what was committed
- Starting `labs/toy-ledger/` again on `dev` — would duplicate the open branch

## Consequences

- Later ledger steps continue from PR #6 after the current BTC ETL slice
- Merging PR #6 can conflict with handoff edits made on `dev` after 2026-10-05
