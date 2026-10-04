# Project Handoff — Blocky (living)

> **Repository:** https://github.com/Ash31393/Blocky  
> **Last updated:** 2026-10-04  
> **Branch observed:** user finished toy-ledger step 1 PR (confirm merge + pull)  
> **Governing instructions:** repo-root `CODING_STUDY_GUIDE_HANDOFF.md` (Part I) + this folder

## Agent style (required — do not skip)

**Guided learning is the default.** The user runs commands and writes code; the agent teaches, explains, checks, and debugs.

## Current objective

After step 1 is on `dev`: add a `Ledger` class (`append`, `is_valid`) on `feature/toy-ledger` or a follow-up branch; then digital signatures (curriculum step 2).

## Last completed step (verified)

- `labs/toy-ledger/ledger.py`: genesis + chained block, `valid: True`, `valid after tamper: False`.
- User completed commit/PR flow for step 1 (2026-10-04).

## Exact next action

1. If not merged yet: merge PR into `dev`. Then `git switch dev && git pull --ff-only origin dev`.
2. `git switch -c feature/toy-ledger-wrap` (or continue on feature branch if still open).
3. Add `Ledger` class wrapping the chain list.
4. Later: signatures / keypairs (curriculum step 2).

## Do not change without discussion

- Permission boundary; Git `feature → dev → main`; gitignore `data/sqlite/*.db`
