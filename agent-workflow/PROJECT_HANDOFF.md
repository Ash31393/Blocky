# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-10-04  
> **Branch observed:** `feature/toy-ledger` with `labs/toy-ledger/ledger.py` (user working)  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Agent style (required — do not skip)

**Guided learning is the default.** The user runs commands and writes code; the agent teaches, explains, checks, and debugs.

## Current objective

Land toy hashed ledger step 1 on `dev`, then add a small `Ledger` wrapper (append + validate) and record Python as the ledger language in an ADR.

## Last completed step (verified)

- Analytics + Tableau ETH chart on `dev`.
- User built `labs/toy-ledger/ledger.py`: `Block`, `make_block`, `chain_is_valid`, genesis + second block, tamper demo; ran genesis successfully; learned class/instance/`self`.

## Exact next action

1. Confirm full run shows `valid: True` then `valid after tamper: False`.
2. Commit on `feature/toy-ledger`, push, `gh pr create --base dev`.
3. After merge: add `Ledger` class (`append`, `is_valid`) on a follow-up commit/PR.
4. Later curriculum: digital signatures (step 2).

## Do not change without discussion

- Permission boundary in `CODING_STUDY_GUIDE_HANDOFF.md` Part I
- Git `feature → dev → main` flow
