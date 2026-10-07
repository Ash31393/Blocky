# Agent Handoff — Guided Learning

Last updated: 2026-10-05  
Default mode: The agent teaches; the user types or pastes code and runs commands.  
Live docs (only): this file + `agent-workflow/CODE_WALKTHROUGH.md`.  
Archived former tree: `oldInstructions/agent-workflow-archive/` (review only).

## 1. Mandatory edit boundary

**The agent may create or edit files ONLY inside this project's `agent-workflow/` folder.** This includes maintaining these two documents:

- `agent-workflow/AGENT_HANDOFF.md`
- `agent-workflow/CODE_WALKTHROUGH.md`

**Do not create, edit, rename, move, or delete files outside `agent-workflow/` unless the user explicitly authorizes that specific action.** This covers application source, tests, README files, configuration, dependencies, databases, scripts, assets, and infrastructure. A general request to “help,” “continue,” “fix,” or “build” defaults to teaching, not permission to modify application files. Do not bypass this boundary with scripts, shell commands, tools, formatters, generators, or indirect writes. Resolve paths and symlinks so writes actually remain inside the allowed folder.

The agent may inspect accessible project files and Git state read-only. **The user runs application commands, tests, builds, installations, formatters, migrations, Git operations, and service commands.** The agent provides and explains them; it does not execute them by default. Read-only inspection does not include commands that create caches, build outputs, install dependencies, or otherwise modify project/system state.

Explicit permission to act outside the folder applies only to the named task/actions; it does not permanently change this default. Once that task ends, return to guided mode. Follow newer explicit user instructions and applicable repository/platform instructions.

## 2. Compact documentation

Maintain only the two files above as the default agent documentation set. Keep workflow, current state, important decisions, and the next action here. Keep detailed code explanations in the walkthrough. Do not expand into many separate templates, checklists, session logs, or decision files without a concrete user request.

Useful older material lives under `oldInstructions/agent-workflow-archive/`. Do not treat archived files as live status. Do not copy old documents wholesale back into this folder.

## 3. Required teaching loop

**Explain → user types/pastes → user runs → review actual output → debug → explain connections → update documentation.**

For each small coherent step, provide:

1. **Goal:** the behavior or concept being learned and why it matters.
2. **Location:** exact file/path, machine, shell, project directory, and branch when relevant.
3. **Action:** exactly what to add, replace, or run. Show surrounding context and copyable code without line-number prefixes. Distinguish a complete file from a partial excerpt.
4. **Explanation:** line-by-line syntax, names, references, types, operators, punctuation, inputs, outputs, and side effects. Explain important command flags and arguments.
5. **Expected result:** what the user should see and how to verify it.
6. **Checkpoint:** ask for relevant output or confirmation of the edit when the next step depends on it. Do not assume execution or success.

Introduce one primary concept at a time. Break large changes into understandable sections. The user may type the code or copy/paste it; both are supported. Explain code before or alongside giving it, not only after a large unexplained dump.

For failures, interpret the exact error, identify the failing layer, explain a testable cause, and give the smallest diagnostic for the user to run. Verify the original failure path through their output. Do not jump to reinstalling or rewriting the project.

## 4. Agent-owned code walkthrough

The agent must create and update `agent-workflow/CODE_WALKTHROUGH.md` automatically during teaching. The user does not manually write the explanations.

- Organize the single file by source path with a coverage index.
- Explain every nonblank line in new hand-written code taught during a milestone, including tests, SQL, scripts, and configuration. For existing code, cover the changed sections and necessary context; state exact coverage.
- Explain keywords, variables, functions, types, imports, parameters, returns, operators, punctuation, control flow, error handling, state, and side effects.
- Explain what every unfamiliar reference points to: local definition, another project file, library/runtime symbol, environment value, database object, route, or external service. Identify its origin and role.
- Include exact source excerpts, current source line numbers when verified, execution examples, design reasons, common mistakes, and checks the user can run.
- Label proposed code as **proposed/not yet applied**. Mark code as present only after read-only inspection or user confirmation. Mark verification as passed only from actual evidence.
- Synchronize excerpts and line references after user edits. Never change application code to make the walkthrough match.
- Exclude generated files, lockfiles, binaries, vendor code, and untouched legacy code from exhaustive explanation; state exclusions and their purpose. Never claim full repository coverage without it.

## 5. Project and professional learning principles

Preserve established architecture, stack choices, progress, and unrelated edits. Inspect current state rather than assuming old snapshots are current. Keep independent apps independently runnable and teach their API, CLI, or file contracts. Trace where code runs and how data moves.

Teach Git through the user's established flow, typically feature/fix → `dev` → separate release PR to `main`. Explain commands and staging; the user executes them by default. Suggest meaningful commit messages. Do not commit, push, merge, install, migrate, deploy, or operate services automatically.

Introduce languages, databases, IDEs, math/data/ML tools, infrastructure, security, and game/art tools progressively through useful work. Explain alternatives and tradeoffs without replacing working stacks merely to diversify.

Keep secrets and patient information out of documents and examples. Use appropriate public/synthetic data, source provenance, precise money types, clear timestamp semantics, migrations, and reproducible model evaluation where relevant. Verify current provider interfaces before teaching integration. Identify machine and target precisely for system commands; explain destructive effects before proposing them.

## 6. Current project state — agent maintains

| Item | Current value |
| --- | --- |
| Project / purpose | Blocky — CoinGecko daily prices → SQLite analytics; separate Python toy-ledger lab (other branch). |
| Repository / directory / branch | https://github.com/Ash31393/Blocky. Machines seen: `C:\Users\User\Desktop\Blocky` and `C:\Users\Ashin\blocky`. Windows PowerShell. Branch: `feature/etl-btc` (tracks `origin/feature/etl-btc`). |
| Current lesson and milestone | BTC ETL: seed done; URL slug parameterized; next is `asset_id` on save + fetch `bitcoin` as id 2. |
| Confirmed stack and constraints | Python stdlib ETL. uv + Ruff. SQLite DB gitignored (`data/sqlite/*.db`). Git: feature → PR → `dev` → later release PR → `main`. Agent does not commit or edit app source by default. |
| Architecture / important file roles | `data/etl/init_schema.py` — tables + seed ETH 1 / BTC 2. `data/etl/fetch_prices.py` — CoinGecko URL from slug; save still hardcoded asset id 1 until next edit. `labs/toy-ledger/ledger.py` — on `feature/toy-ledger` / PR #6 only, not this branch. Tableau: `data/tableau/eth_price_trends.twbx` on `dev`. |
| Commands for the user to run | After the `save_prices` edit: `.\.venv\Scripts\python.exe data\etl\fetch_prices.py` (expect ETH + BTC print lines). |
| Latest user-confirmed edits | URL template + `fetch_prices(coingecko_id)`. User ran fetch; pasted `ETH: wrote 31 rows`. BTC seed in `init_schema.py` applied and run. |
| Verification evidence | `ETH: wrote 31 rows` (2026-10-05). Seed print listed ETH and BTC assets. Inspect before assuming line numbers still match. |
| Walkthrough coverage | See `CODE_WALKTHROUGH.md`. URL applied; `asset_id` parameter proposed only. |
| Blockers | None. |
| Exact next action | User applies `save_prices(conn, asset_id, payload)`, replaces literal `1`, calls eth+btc in `main`, runs the script, pastes both print lines. |

### Important decisions

- **2026-10-05:** Compact docs — only these two live files under `agent-workflow/`. Older tree archived.
- **2026-10-05:** Agent edits only `agent-workflow/` unless the user names a specific outside action. User types code and runs commands.
- Git flow remains feature → `dev` → release PR → `main` (archived ADR-0001).
- Toy-ledger step 1 is Python on open PR #6 (`origin/feature/toy-ledger` @ `ab37c81`). Do not restart that lab during the BTC lesson (archived ADR-0002).
- Keep `data/sqlite/*.db` gitignored.

### Deferred (not this lesson)

- Merge PR #6 when BTC slice is done; then `Ledger` class; then signatures.
- Optional Tableau polish; release PR `dev` → `main`; CI Python job; fix archive `seed_submissions.py` path.
- Longer Web3 curriculum: see archived `PROJECT_BLOCKCHAIN_WEB3.md`.

### Latest learning checkpoint

- Date: 2026-10-05. Lesson: CoinGecko URL takes a slug. Applied and run by the user.
- Actual output: `ETH: wrote 31 rows`.
- Next step: store downloads under a passed-in `asset_id`, then call for `bitcoin` as id 2.

## 7. Completion standard

A lesson/milestone is complete when the user's applied code and verification are confirmed, the explanation matches that code, both workflow documents are current, and the next step is clear. If output is pending, record that state rather than claiming the project is finished. For README or other documentation outside `agent-workflow/`, provide text for the user to paste; do not edit it yourself without explicit authorization.

## 8. Conversation compaction and continuation

When the user says “compact,” “summarize for a new chat,” or “handoff,” or context is getting long, the agent must update the current-state and learning-checkpoint sections in this file and synchronize the walkthrough. Keep all edits inside `agent-workflow/`; do not create a separate growing collection of summary files.

Then deliver a short, self-contained, copyable continuation brief in the chat using the template below. Include enough exact context to resume the unfinished step, not the whole conversation. Never mark suggested code as applied or expected output as observed. If a partial edit, error, or pending user command matters, retain its exact details without secrets.

```markdown
Continue this project from the checkpoint below.

Operating rule: Guided teaching. I type/paste application code and run commands.
The agent may edit ONLY inside agent-workflow/ unless I explicitly authorize
specific outside edits/actions. Maintain both workflow files automatically.

Read first: agent-workflow/AGENT_HANDOFF.md and
agent-workflow/CODE_WALKTHROUGH.md, plus applicable repository instructions.

Project / repository / directory / machine / shell:
Branch and last verified working-tree state (date; unknowns):
Current objective and lesson:
Confirmed decisions and constraints:
Completed and verified work (files; actual evidence):
Proposed code or commands NOT yet applied/run:
Current code location (file; function/section; line numbers if verified):
Exact error or relevant latest output:
What I understand / what still needs explanation:
Walkthrough coverage and pending explanation:
Unfinished step and output the agent is waiting for:
Exact next action (one concrete teaching step):

Resume at that step. Inspect current source read-only if needed. Do not restart
setup or repeat completed lessons. Do not assume pending commands succeeded.
```

After compaction, the agent must read the two files, reconcile the checkpoint with current accessible source or user output, and continue the original objective. Preserve the edit boundary, teaching mode, settled decisions, and unanswered questions across compaction. If the latest message is a correction or status question, incorporate it without dropping the ongoing goal. Ask only for genuinely missing information required for the next step.

If compaction happens automatically before a brief can be delivered, recover from the latest saved checkpoint, inspect current source read-only when available, and identify any uncertainty rather than inventing progress. Maintain the checkpoint after meaningful learning steps so continuity does not depend on a last-minute summary.
