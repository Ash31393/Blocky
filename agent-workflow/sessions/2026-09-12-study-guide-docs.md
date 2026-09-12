# Session: 2026-09-12 — Study guide intake + agent-workflow living records

- Repository: Blocky
- Branch: `dev` (docs updates local/uncommitted)
- Goal: Read `CODING_STUDY_GUIDE_HANDOFF.md` and execute agent documentation duties

## Starting state

- PR #1 and #2 already merged into `origin/dev`
- Crypto ETL working locally; Ruff clean; uv `.venv` present
- Leftover uncommitted move of runbooks/requirements into `oldInstructions/`
- New file at repo root: `CODING_STUDY_GUIDE_HANDOFF.md`

## Changes made (documentation only)

- Updated `agent-workflow/README.md` reading order and structure
- Created living records: `PROJECT_HANDOFF.md`, `PROJECT_STRUCTURE.md`, `sync-notes.md`, `TROUBLESHOOTING.md`, `BACKLOG.md`
- Created `sessions/2026-09-12-study-guide-docs.md`, `decisions/ADR-0001-git-feature-dev-main.md`
- Updated `PROJECT_BLOCKCHAIN_WEB3.md` verified state / next action / read-first paths

## Verification

- File tools used to create/update docs under `agent-workflow/`
- No Git commit/push performed (requires explicit user permission)
- No application source changes in this documentation pass

## Concepts / process

- Standing documentation exception vs no autonomous command execution
- Map structure; do not restructure the app
- Source of truth: study guide Part I + living PROJECT_HANDOFF

## Exact next action

User authorizes a `docs/...` branch commit/PR for: study guide, living agent-workflow files, and oldInstructions archival leftover.
