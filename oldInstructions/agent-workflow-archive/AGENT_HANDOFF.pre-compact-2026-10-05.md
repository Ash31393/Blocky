# Agent Handoff — Guided Learning

Last updated: 2026-10-05  
Default mode: The agent teaches; the user types or pastes code and runs commands.  
Source of these rules: the user's updated repo-root `AGENT_HANDOFF.md` (same date). This copy is the one the agent maintains. The repo-root file is left as the user placed it.

## 1. Mandatory edit boundary

**The agent may create or edit files ONLY inside this project's `agent-workflow/` folder.** This includes maintaining these two documents:

- `agent-workflow/AGENT_HANDOFF.md`
- `agent-workflow/CODE_WALKTHROUGH.md`

**Do not create, edit, rename, move, or delete files outside `agent-workflow/` unless the user explicitly authorizes that specific action.** This covers application source, tests, README files, configuration, dependencies, databases, scripts, assets, and infrastructure. A general request to "help," "continue," "fix," or "build" defaults to teaching, not permission to modify application files. Do not bypass this boundary with scripts, shell commands, tools, formatters, generators, or indirect writes.

The agent may inspect accessible project files and Git state read-only. **The user runs application commands, tests, builds, installations, formatters, migrations, Git operations, and service commands.**

## 2. Compact documentation

Keep workflow, current state, important decisions, and the next action in this file. Keep detailed code explanations in `CODE_WALKTHROUGH.md`. The older files in this folder stay. This file is the current status. Do not treat `PROJECT_HANDOFF.md` as a second live status.

## 6. Current project state — agent maintains

| Item | Current value |
| --- | --- |
| Project / purpose | Blocky. CoinGecko daily prices in SQLite, plus a Python toy-ledger lab that is not on this branch. |
| Repository / directory / branch | https://github.com/Ash31393/Blocky — `C:\Users\Ashin\blocky`. Windows PowerShell. Read-only check 2026-10-05: local branch `feature/etl-btc` at `845da7e` (same commit as `origin/dev`). ETL scripts are not modified. Uncommitted notes are under `agent-workflow/` plus untracked repo-root `AGENT_HANDOFF.md` and `CODE_WALKTHROUGH.md`. |
| Current lesson and milestone | Seed BTC in `data/etl/init_schema.py`. Fetching BTC prices is the following lesson, not this one. |
| Confirmed stack and constraints | Python stdlib ETL. uv + Ruff. SQLite file gitignored. Git flow: feature → PR → `dev` → later release PR → `main`. Agent does not commit or edit source. |
| Architecture / important file roles | `init_schema.py` seeds ETH id 1 and BTC id 2. `fetch_prices.py` builds the CoinGecko URL from a slug (lines 11–21, 72) and still writes `asset_id` 1 (line 55). |
| Commands for the user to run | Next: pass `asset_id` into `save_prices` and fetch `bitcoin` as id 2, then run `.\.venv\Scripts\python.exe data\etl\fetch_prices.py`. |
| Latest user-confirmed edits | URL template saved. User ran `fetch_prices.py` and pasted `ETH: wrote 31 rows`. |
| Verification evidence | That printout, 2026-10-05. File inspection confirms `fetch_prices("ethereum")` on line 72 and literal `1` on line 55. |
| Walkthrough coverage | URL step applied. Asset-id parameter is proposed only. |
| Blockers | None. |
| Exact next action | User applies the `save_prices(conn, asset_id, payload)` edit and the two calls in `main`. Paste both print lines. |

### Important decisions

- 2026-10-05: User's updated instructions. Agent edits only `agent-workflow/` unless the user names a specific outside edit. User types code and runs commands.
- Toy-ledger step 1 is Python on open PR #6. Older note: `agent-workflow/decisions/ADR-0002-toy-ledger-python.md`. Do not restart that lab during the BTC lesson.
- Git flow remains feature → `dev` → release PR → `main`.

### Latest learning checkpoint

- Date: 2026-10-05. Lesson: CoinGecko URL takes a slug. Applied and run by the user.
- Actual output: `ETH: wrote 31 rows`.
- Next step: store that download under a passed-in `asset_id`, then call it for `bitcoin` as id 2.

## 7. Completion standard

This lesson is complete only after the user pastes the script output and the walkthrough is updated to match the file they saved. Expected output is not observed output.
