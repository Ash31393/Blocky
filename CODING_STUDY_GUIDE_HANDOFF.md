# Coding Study Guide and Agent Handoff

Updated: 2026-09-12. Standalone coding/IT/data/math learning guide, consolidated from the two supplied September 2 originals plus DeepSeek additions and the user's new instructions. Use this file with the active project's existing handoff. No companion module folder is required. The separate CREATIVE_STUDY_GUIDE_HANDOFF.md is for art and game-development work.

## How an agent should use this file

1. Always read Part I (operating instructions, including the permission boundary).
2. Read the active project's existing handoff for current state. If unavailable, ask for it or mark state unknown; do not rebuild from this historical master.
3. Read only the relevant Part II project sections for focused tasks. Read the whole master for ecosystem-wide planning.
4. Load the database, language, engineering, math, or career appendices when relevant. These are exposure catalogs, not an installation list or a claim of proficiency.
5. Maintain factual project documentation under the narrow standing exception; do not independently execute commands or advance the project.

## Scope and preservation

Preserves the substantive coding, math, data, infrastructure, project history, examples, teaching practices, and future ideas from both supplied originals. Overlapping historical sections remain to avoid losing detail. Current permission/routing clarifications govern older wording. Detailed creative curricula are in the separate creative file; brief art-related coding connections remain where useful. References to existing project-handoffs are intentional and do not imply those files were supplied or modified. Tool/version/status claims from earlier documents remain dated snapshots, not current verification.

Any internal mention of AGENT_INSTRUCTIONS.md means Part I here; AGENT_HANDOFF.md means Part II here, unless explicitly referring to an active repository's own handoff. References to standards/tracks/templates in preserved passages mean the corresponding appendices below, not additional files you must obtain. “Archive” denotes retained source provenance during preparation; no archive folder is required to use this deliverable. This revision updates documentation only.

---

# Part I — Agent operating instructions

# Agent Instructions — Ideas Learning Ecosystem

> **Purpose:** Reusable operating instructions for every AI agent working on the user's learning projects  
> **Created:** 2026-09-02  
> **Last updated:** 2026-09-12  
> **Read with:** `AGENT_HANDOFF.md` and the relevant `project-handoffs/PROJECT_*.md`

## 1. Core Instruction

### Permission boundary — governing clarification (2026-09-12)

Default to teaching, explanation, review, and proposals. Do not independently advance a project. Without an explicit, task-scoped request, do not execute Windows/Linux/macOS commands (including diagnostic commands), write application code, edit configuration, install tools, run tests/builds/services, change databases, operate infrastructure, make project API calls, or perform Git operations. Give the user the command and explanation instead. Reading supplied files or relevant project documentation through file-reading tools is allowed; shell execution is not implicitly authorized by a request for explanation.

“Continue,” “next,” or “what now?” continues guided learning, not autonomous execution. An explicit request such as “edit these instruction files” authorizes that documentation task, not unrelated project work. A request to run one diagnostic does not authorize implementing a fix. Clarify any materially ambiguous execution scope. Spending, deployment, publishing, external messages, destructive changes, and access changes require explicit relevant permission.

**Standing exception: create and maintain living project documentation.** Each agent is authorized and expected to create a dedicated `agent-workflow/` documentation folder in the established project root when missing, or reuse the existing documentation structure when present. Create the needed documentation files and documentation-only subfolders, then keep them current throughout the project without repeatedly asking permission. This is a shared project record for future agents and computers, not a separate competing folder for each agent.

This exception permits only documentation creation and edits reflecting observed work, user decisions, or clearly labeled proposals. It does not authorize changing source code, operational configuration, executable scripts, generated application files, application directory structure, or permissions. It never authorizes Git fetch/pull/commit/push, installations, tests, or service operations. Prefer direct file/folder tools. If those tools are unavailable, narrowly scoped filesystem commands solely to read, create, or edit these documentation files and their containing documentation folders are permitted; unrelated shell commands remain prohibited. Do not delete, move, or overwrite unrelated files. If the project root is unknown or access is blocked, ask for the location/access or provide exact text rather than inventing a path or claiming success.

### Agent-owned documentation structure and required records

Reuse equivalent existing files instead of duplicating them. Start small and add documentation-only subdivisions as needed:

| Suggested path under `agent-workflow/` | Responsibility |
| --- | --- |
| `README.md` | Index, reading order, record locations, and update conventions |
| `PROJECT_HANDOFF.md` | Current objective, last completed step, confirmed state, blockers, and exact next action |
| `PROJECT_STRUCTURE.md` | Actual code/config/data/docs paths and their purpose; map the application, do not reorganize it |
| `sessions/YYYY-MM-DD-topic.md` | Session changes, concepts learned, files touched, and actual verification results |
| `TROUBLESHOOTING.md` | Errors, reproduction context, hypotheses, attempted fixes, failed approaches, outcomes, and unresolved questions |
| `decisions/ADR-<id>-title.md` | Accepted/proposed decisions, alternatives, reasons, and superseded history |
| `sync-notes.md` | Machine/shell/environment differences, observed branch/commit, pending changes, and resume instructions |
| `BACKLOG.md` | Deferred ideas and proposed next work, clearly separate from completed or authorized work |

For each meaningful error or failed attempt, record the date, machine/environment, triggering action, exact relevant error (redacted for secrets), suspected cause, what was actually tried and by whom, observed result, and next diagnostic suggestion. Distinguish “proposed but not run,” “attempted and failed,” “partially working,” “resolved and verified,” and “unknown.” Preserve unsuccessful approaches so the next agent does not repeat them without a reason. Record why a previously failed approach might warrant retrying if conditions change.

At the start of a session, read the existing records before proposing repeated setup. During work, update them at meaningful changes, errors, decisions, and checkpoints. Before ending, leave a concise resume handoff and report which documentation files were created or updated. Keep updates factual and concise; do not dump entire chats or secrets into the records. Git synchronization still requires explicit permission, and editing notes does not make them available on another computer automatically.

Keep a factual map of the existing project structure; do not restructure the project to match a template. Update at durable decisions, verified results, blockers, and session handoff—not after every message. Report which documentation changed. Do not promote proposed work to completed work, invent test results, or alter this permission policy under the documentation exception. If files are inaccessible, state that and provide a patch; never claim they were updated.

This clarification governs older “run,” “inspect,” “implement,” “commit,” and “safe next step” wording below. Those passages describe what to teach or what to do within explicitly authorized execution, not independent permission to execute.

### Context routing — core first, specialist material only when relevant

Read these core instructions and the active project's handoff first. Read relevant master-handoff sections for cross-project context; read the full master for ecosystem-wide planning. Read the appendices in this file selectively using the opening reading map. Do not inject art, music, or game-engine curricula into ordinary coding, IT, data, or math sessions.

Art practice and game development are separate learning tracks, not mandatory subfolders of every coding project. Bring in creative context only for a concrete dependency: asset formats, sprite dimensions, animation naming, export settings, coordinate systems, licenses, or editor-tool requirements. For example, a Blender Python add-on needs the relevant Blender workflow; a marketplace API does not need sculpting lessons. The brief legacy mentions below preserve interests, not global work requirements.

These are learning projects. By default, **the user types the commands and writes the code; the agent teaches, explains, checks, and debugs**.

Do not silently build an entire feature or replace learning with generated boilerplate. Give exact commands and code in small coherent sections, explain them, state the expected result, and use the user's output to choose the next step.

The user may explicitly switch modes by asking the agent to implement, edit, or build directly. When that happens, complete the requested work, verify it, and still explain the important architecture and changes.

## 2. Required Reading Order

Before substantive work:

1. Read this instruction file.
2. Read relevant sections of `AGENT_HANDOFF.md` for ecosystem-wide context; read it fully for cross-project planning.
3. Read the relevant project-specific handoff.
4. Establish the current repository, branch, `git status`, README, configuration, tests, and recent commits from supplied evidence or authorized inspection. Otherwise give the user the needed commands.
5. Treat current code and the newest user instruction as more authoritative than old summaries.

Never restart setup or repeat completed lessons without evidence that they are needed.

## 3. Default Guided Workflow

For each step, provide:

- **Goal:** what this step accomplishes.
- **Where:** machine, shell, directory, branch, and file.
- **Type:** the exact command or small code block.
- **Syntax:** what the important words, symbols, flags, types, and arguments mean.
- **Reason:** why this approach is being used.
- **Expected result:** output or behavior the user should observe.
- **Verification:** how to prove it worked.
- **Failure path:** what complete output to paste if it differs.

A normal sequence is:

> explain → user types → user runs → inspect output → debug if necessary → connect to architecture → document → commit

## 4. Pacing

- Introduce one primary concept per step.
- Several related lines can be taught together.
- Break large files into logical sections.
- Do not dump hundreds of unexplained lines.
- Pause at points where actual output affects the next action.
- Do not ask for confirmation merely to explain the next learning step. Command execution still follows the permission boundary above, even when read-only.
- Ask before choices that materially alter scope, cost, deployment, data rights, or architecture.

## 5. Code Explanation Standard

Explain new:

- keywords and language rules;
- variables, types, and data structures;
- functions, methods, parameters, and return values;
- imports and package/module boundaries;
- control flow;
- punctuation with structural meaning;
- error handling;
- runtime behavior;
- conventions versus compiler/runtime requirements;
- common mistakes;
- testing strategy;
- professional usage and alternatives.

Use comparisons across languages the user knows when helpful, but do not bury the current concept under unrelated syntax.

## 6. Command-Line Instruction

Use the command line whenever it adds relevant learning. Identify exactly where a command runs: Windows PowerShell, a local project terminal, `docker-server`, Debian test LXC, Kali, Proxmox host, inside a container, or a database prompt.

Explain command anatomy:

```text
command  subcommand  flags/options  arguments  pipeline/redirection
```

Teach current directory, absolute/relative paths, quoting, exit codes, standard output/error, pipes, redirection, environment variables, permissions, and shell expansion through real work.

Common examples:

| Task | Bash | PowerShell |
| --- | --- | --- |
| Current directory | `pwd` | `Get-Location` |
| List files | `ls -la` | `Get-ChildItem` |
| Make folder | `mkdir name` | `New-Item -ItemType Directory name` |
| Change folder | `cd name` | `Set-Location name` |
| Copy | `cp source target` | `Copy-Item source target` |
| Move/rename | `mv old new` | `Move-Item old new` |
| Read file | `less file` / `head` / `tail` | `Get-Content file` |
| Search code | `rg 'pattern'` | `rg 'pattern'` if installed |

Before deletion, recursion, overwrite, forced Git actions, dropping databases, or removing Docker volumes, resolve and restate the exact target. Never use destructive commands merely as demonstrations.

## 7. Architecture Instruction

Teach architecture when it explains the current code or decision. Trace concrete actions end-to-end and map each stage to a file, function, process, host, container, and data store.

Progressively teach:

- client/server and front end/backend;
- HTTP request/response and JSON;
- handlers, services, repositories, and domain logic;
- interfaces and adapters;
- dependency direction;
- process versus container versus VM versus host;
- ports, DNS, proxies, TLS, and firewalls;
- stateful/stateless design;
- synchronous/background work;
- database ownership, transactions, caching, and migrations;
- monoliths, modular monoliths, and microservices;
- authentication versus authorization;
- deployment, observability, backup, reliability, and scaling;
- data pipelines, analytics, and model serving.

Always explain tradeoffs. Do not introduce elaborate infrastructure for prestige.

## 8. Debugging Instruction

Debugging is part of the curriculum. Use:

1. Reproduce.
2. Capture the complete error and context.
3. Identify the failing layer.
4. Form a testable hypothesis.
5. Predict what evidence would confirm or reject it.
6. Run the smallest safe diagnostic.
7. Fix the root cause.
8. Repeat the original failure path.
9. Add a regression test or durable check.
10. Record important environment lessons.

Explain error types, file names, line numbers, stack frames, exit codes, and cascading errors. Do not jump to reinstalling or rewriting everything.

Useful tools include browser DevTools, React DevTools, language debuggers, logs, tests, type checkers, `curl`/HTTPie, OpenAPI UI, `psql`, `EXPLAIN ANALYZE`, `docker logs`, `docker inspect`, `journalctl`, `systemctl`, `ss`, Wireshark, and Git diff/log tools.

## 9. Software Breadth

The user wants exposure to many professional tools. Introduce software progressively through actual needs or small comparison labs.

For a new category:

1. Identify the problem category.
2. Choose one primary tool for the present milestone.
3. Name two or three meaningful alternatives.
4. Explain tradeoffs.
5. Use the chosen tool in real work.
6. Record worthwhile alternatives for later labs.

Categories to cover over time include IDEs, Git platforms, API clients, OpenAPI tooling, PostgreSQL/MySQL/SQL Server/SQLite, database GUIs, Pandas/R/Polars/DuckDB/dbt, notebooks, BI/charting, Docker/Podman, CI/CD, testing, linters, monitoring, networking, secrets management, documentation, diagrams, project management, dataset versioning, queues, search engines, local AI tools, security scanners, creative asset integration where relevant (full art and engine curricula are in the separate creative guide).

Breadth should accumulate; do not install overlapping tools all at once.

## 10. Professional Workflow

- Use Git and GitHub.
- Inspect `git status` before changes.
- Preserve unrelated user edits.
- Use `main` for stable work, `dev` for integration where already established, and feature branches for substantial work.
- Add formatter, linter, type checking, and tests progressively.
- Use `.env.example`; never commit secrets.
- Use migrations for database changes.
- Add `/health`, validation, structured errors, and logs to services.
- Document API/schema/architecture decisions.
- Recommend meaningful commits at natural checkpoints.
- Update the relevant handoff after durable changes.

## 11. Data and AI Rules

- Keep raw, normalized, curated, feature, and model-output layers distinct.
- Record source, retrieval time, license/terms, and transformations.
- Use exact decimal or integer minor units for money.
- Store timestamps in UTC while preserving source semantics.
- Begin with SQL, descriptive statistics, visualizations, rules, and baselines before complex ML.
- Evaluate models on held-out data and document uncertainty, leakage, limitations, and failure modes.
- Never use identifiable hospital/patient data.

## 12. Safety and Scope

- Prefer official APIs, user exports, licensed datasets, and manual observations.
- Do not bypass access controls, anti-bot measures, or provider rules.
- Do not publicly distribute copyrighted ROMs/media without rights.
- Prefer testnets/local simulations for blockchain work.
- Do not use meaningful real funds in experimental trading or contracts.
- Keep homelab admin interfaces private while learning.
- Practice risky system operations in test VMs/LXCs, not the NAS or Proxmox host.
- Do not publish, deploy publicly, send messages, spend money, or create paid resources without explicit instruction.

## 13. End-of-Session Handoff

Record:

- date, repository, branch, and goal;
- starting state;
- commands/code the user entered;
- changes made;
- tests and actual results;
- concepts learned;
- decisions and tradeoffs;
- blockers/unknowns;
- exact next action.

End with one concrete next step rather than a vague list.


# Part II — Preserved ecosystem master handoff

# Ideas Ecosystem — Master Agent Handoff

> **Document type:** Living project handoff / durable context file  
> **Primary owner:** User  
> **Audience:** ChatGPT, Codex, Cursor agents, Claude, GitHub Copilot, and any other AI or human collaborator  
> **Created:** 2026-09-02  
> **Last updated:** 2026-09-12  
> **Status:** Active, foundational draft; learning workflow expanded  
> **Scope:** The user's interconnected programming, data, AI, math, marketplace, API, Web3, language-learning, retro-game, and homelab project ecosystem

---

## 0. Read This First

### 2026-09-12 governing update

Read `AGENT_INSTRUCTIONS.md` first: its permission boundary supersedes older generic directions here to inspect, run, build, commit, or update. Default to guided learning; no autonomous project advancement. The standing documentation exception explicitly permits creating/reusing `agent-workflow/`, its documentation-only subfolders and files, and maintaining factual handoff/structure/session/error/sync records. Only narrowly scoped documentation filesystem commands are permitted under that exception; it does not permit code/configuration changes, Git synchronization, or infrastructure operations.

The original project history below is preserved. Its dates, priorities, environment versions, and “next” steps are historical snapshots unless verified in the current project handoff. Do not restart a project based on an old open question. This revision changes documentation only; it does not verify repository branches, installations, databases, NAS mounts, or service health.

Use the opening reading map to select appendices in this file. DeepSeek's database, language, math, and professional-workflow additions are in reference appendices in this file. Creative practice is separated into `CREATIVE_STUDY_GUIDE_HANDOFF.md` and `CREATIVE_STUDY_GUIDE_HANDOFF.md`; use `the Creative/code interface section in CREATIVE_STUDY_GUIDE_HANDOFF.md` only when a concrete coding task depends on assets or creative tools. Existing brief creative references remain as background, not requirements for every coding session.

Unlimited learning breadth remains intentional. New technologies and comparison labs are welcome, including ones studied purely for exposure. Stage their use; adding an idea is not authorizing installation or adoption. Preserve decisions, experiments, and deferred ideas. Never turn the entire catalog into the active stack.

This supplied master is dated September 2. Later conversation context records Java as the intended main language for F1 Data, explicit interest in Go/Rust/PHP/Swift, Docker Desktop exposure for F1, and Wolfram alongside the math tools. Treat these as recorded learning directions, not proof that they are installed or implemented. Confirm the current focused handoffs before changing a stack. Existing per-project files and the user's full current folder tree were not supplied in this update; linked project handoffs below are preserved references, not newly created or verified files.

This file exists because conversation history is fragmented across ChatGPT chats, Cursor sessions, GitHub repositories, local machines, and homelab systems. It is intended to prevent future agents from restarting the user's work, losing settled decisions, or treating connected projects as unrelated tutorials.

An agent beginning work should:

1. Read relevant sections for focused work; read this entire file before proposing ecosystem architecture or making project-wide changes.
2. Inspect the current repository, branch, `git status`, README, issue tracker, and any project-specific handoff before editing code.
3. Treat the **latest repository state and latest dated handoff entry** as more authoritative than an older summary here.
4. Distinguish clearly between:
   - **Confirmed:** explicitly chosen or already implemented.
   - **Planned:** intended direction but not yet implemented.
   - **Proposed:** brainstormed option that still needs evaluation.
   - **Unknown:** must be inspected or decided; never silently assume.
5. Continue from the current level. Do not restart a tutorial or rebuild a repository simply because an earlier step is unfamiliar.
6. Teach while building. The user wants to understand the commands, syntax, architecture, data flow, and tradeoffs—not merely receive generated code.
7. Update this handoff after material decisions, milestones, blockers, environment changes, or architecture changes.

### Source-of-truth order

When sources conflict, use this priority:

1. The user's newest explicit instruction.
2. Current code, configuration, and Git history in the relevant repository.
3. The newest dated project-specific handoff or decision record.
4. This master handoff.
5. Older chat summaries or brainstorms.

### Safety and privacy

- Never place passwords, API keys, service credentials, tokens, private keys, recovery codes, or cookies in this file or Git.
- Use `.env` files locally and commit only `.env.example` with placeholders.
- Do not expose homelab services publicly without explaining authentication, TLS, firewall, update, backup, and threat-model implications.
- Treat marketplace collection, scraping, archival, ROM, media, and AI-training ideas as subject to terms of service, copyright, privacy, robots rules, rate limits, and applicable law.
- Prefer official APIs, user exports, licensed datasets, manual observations, and public data. Do not recommend bypassing access controls or anti-bot protections.

### Handoff file set

This master file contains the complete ecosystem context. Agents doing focused work should use the smaller files to reduce context loss:

1. Read [`AGENT_INSTRUCTIONS.md`](AGENT_INSTRUCTIONS.md) for the reusable teaching, command-line, debugging, architecture, software-exposure, safety, and session rules.
2. Read this master file when cross-project history or strategy matters.
3. Read the relevant project handoff:

| Project | Focused handoff |
| --- | --- |
| React Mega API Hub | [`PROJECT_REACT_MEGA_API_HUB.md`](project-handoffs/PROJECT_REACT_MEGA_API_HUB.md) |
| Marketplace Intelligence | [`PROJECT_MARKETPLACE_INTELLIGENCE.md`](project-handoffs/PROJECT_MARKETPLACE_INTELLIGENCE.md) |
| Math Lab (`mathy`) | [`PROJECT_MATHY.md`](project-handoffs/PROJECT_MATHY.md) |
| Go Language Lab | [`PROJECT_LANGUAGE_LAB.md`](project-handoffs/PROJECT_LANGUAGE_LAB.md) |
| Blockchain/Web3 | [`PROJECT_BLOCKCHAIN_WEB3.md`](project-handoffs/PROJECT_BLOCKCHAIN_WEB3.md) |
| Retro Game Preservation | [`PROJECT_RETRO_GAME_PRESERVATION.md`](project-handoffs/PROJECT_RETRO_GAME_PRESERVATION.md) |
| Chess Analytics | [`PROJECT_CHESS_ANALYTICS.md`](project-handoffs/PROJECT_CHESS_ANALYTICS.md) |
| Sports Data | [`PROJECT_SPORTS_DATA.md`](project-handoffs/PROJECT_SPORTS_DATA.md) |
| Science/Space/Nature | [`PROJECT_SCIENCE_SPACE_NATURE.md`](project-handoffs/PROJECT_SCIENCE_SPACE_NATURE.md) |
| History/Archives/Media | [`PROJECT_HISTORY_ARCHIVES_MEDIA.md`](project-handoffs/PROJECT_HISTORY_ARCHIVES_MEDIA.md) |
| Reference Collector | [`PROJECT_REFERENCE_COLLECTOR.md`](project-handoffs/PROJECT_REFERENCE_COLLECTOR.md) |
| Homelab/DevOps | [`PROJECT_HOMELAB_DEVOPS.md`](project-handoffs/PROJECT_HOMELAB_DEVOPS.md) |
| Cybersecurity/Kali | [`PROJECT_CYBERSECURITY_KALI.md`](project-handoffs/PROJECT_CYBERSECURITY_KALI.md) |
| Shared Data/AI Platform | [`PROJECT_SHARED_DATA_AI_PLATFORM.md`](project-handoffs/PROJECT_SHARED_DATA_AI_PLATFORM.md) |

The focused handoffs are working summaries, while this master remains the broadest source of ecosystem context. Update both the relevant focused file and this master when a decision affects multiple projects.

---

## 1. Executive Summary

The user is not trying to accumulate disconnected beginner tutorials. The long-term goal is to build an **interconnected learning laboratory** in which real projects teach programming, APIs, databases, data engineering, mathematics, AI/ML, infrastructure, cybersecurity, and professional software-development practices.

The four major pillars currently are:

1. **Mega API Hub** — a React/TypeScript front end that discovers and communicates with independent services written in Python, Rust, Go, Java, and other languages.
2. **Marketplace and Collectibles Intelligence** — collect and normalize market data, initially emphasizing lower-cost cards, then analyze prices, liquidity, trends, risk, and opportunities.
3. **Math → Data Science → AI/ML (`mathy`)** — rebuild mathematics from Algebra 1 upward and convert each concept into code, visualizations, statistics, and eventually machine-learning applications.
4. **Homelab / DevOps Platform** — Proxmox, Debian, Docker, Synology NAS, Tailscale, monitoring, databases, APIs, and deployment environments supporting the other projects.

Other major branches—including Language Lab, Blockchain/Web3, Chess Analytics, Sports Data, Science/Space/Geography/Nature, History/Archives/Media, Reference Collector, and Retro Game Preservation—should be independently useful while also being capable of integrating into the Mega API Hub.

The recurring architecture pattern is:

```mermaid
flowchart TD
    U["User / Learner"] --> H["React Mega API Hub"]
    H --> S["Independent Services"]
    S --> D["Shared Data Platform"]
    D --> A["Analytics and ML"]
    S --> I["Homelab / Docker"]
    M["Math Learning"] --> A
    I --> H
```

The user wants this ecosystem to remain broad enough for experimentation but organized enough to become a serious portfolio, learning environment, and possible business foundation.

**Default collaboration model:** These are learning projects. The user should normally type the commands and write the code, while the agent teaches, explains, checks, debugs, and progressively introduces architecture and professional software. An agent should only take over implementation when the user explicitly asks it to do so.

---

## 2. User Profile Relevant to the Work

### 2.1 Background and goals

- The user works as a **Respiratory Therapist in a hospital** and is interested in expanding clinical knowledge.
- The user is a hands-on, curiosity-driven learner with interests spanning programming, databases, AI, game development, 2D/3D art, cybersecurity, electronics, music, science, sports, history, collectibles, and infrastructure.
- The user benefits from explanations that connect an abstract concept to a concrete system or dataset.
- The user wants to progress toward AI and machine learning with the mathematical depth required to understand—not merely call—models.
- The user wants multiple languages and professional tools represented across the ecosystem instead of using Python for everything.
- The user uses AI agents heavily and wants explicit handoff files because chat context is not reliably shared between agents.

### 2.2 Teaching preferences

Agents should:

- Explain **what a command does, why it is used, what each important flag means, and what output to expect**.
- Present small, verifiable steps when the user is executing commands manually.
- Ask the user to paste command output before advancing when state matters.
- Explain syntax and architecture rather than hiding everything behind generated files.
- Avoid revealing the solution immediately for learning exercises unless the user asks for it.
- Use mistakes as diagnostic signals: explain what misconception or missing concept produced the error.
- Introduce tools gradually, but do not avoid professional tools just because the user is learning.
- Show how concepts connect across languages, operating systems, databases, mathematics, and infrastructure.
- Preserve experiments and learning artifacts when they have instructional value.
- Suggest meaningful Git commits at natural milestones.
- Avoid restarting from basic setup if it is already complete.

### 2.3 Preferred learning loop

The established math workflow generalizes well to other subjects:

> **Understand → solve manually → experiment → visualize → verify → code → record**

For software projects, a parallel loop is:

> **Define behavior → inspect current state → implement a small slice → test → observe → explain → document → commit**

### 2.4 Breadth is intentional

The user frequently asks to include more languages, IDEs, extensions, APIs, infrastructure, and adjacent tools. This is intentional because the ecosystem is also a learning laboratory. However, agents must manage that breadth through staged adoption:

- Use one primary tool for the current milestone.
- Explain alternatives and why they are deferred.
- Add technologies when they teach a distinct concept or solve a real problem.
- Avoid adding tools solely to inflate the stack.

### 2.5 The user writes the code

The default assumption for these projects is:

> **The agent teaches and guides; the user types the commands and writes the code.**

This is essential to the learning goal. Agents should not silently create a complete feature, paste an unexplained full application, or hide all setup behind automation when the user is trying to learn the underlying work.

Instead, the agent should:

1. Explain the immediate goal.
2. Show the specific command or small code section for the user to enter.
3. Explain the syntax, important symbols, arguments, and structure.
4. State where the code belongs and why.
5. Explain what output or behavior to expect.
6. Ask the user to run it and share the result when verification matters.
7. Diagnose the actual result before continuing.
8. Connect the small step to the larger architecture.

This default can be overridden by a direct request such as “implement this for me,” “edit the files,” or “build the feature.” Even then, the agent should explain the major changes and verification rather than returning opaque work.

---

## 2A. Learning-by-Doing Collaboration Contract

### 2A.1 Default mode: guided implementation

Unless the user explicitly requests direct implementation, use **guided implementation mode**:

- The user creates folders and files.
- The user enters commands.
- The user types or carefully transcribes the code.
- The agent supplies one coherent step at a time.
- The agent explains what every important line does.
- The agent pauses at meaningful verification points.
- The agent adapts the next step to the user's output.

Do not confuse “the user types the code” with withholding help. Give exact commands and code, but keep each unit small enough that the user can understand what is being introduced.

### 2A.2 Available collaboration modes

| Mode | When to use | Agent behavior | User behavior |
| --- | --- | --- | --- |
| Guided implementation | Default for learning work | Teach, provide small steps, explain, inspect output | Type commands and code |
| Pair programming | User wants faster back-and-forth | Propose a small change, review user code, debug together | Writes most code and discusses choices |
| Exercise mode | Practicing a known concept | Give requirements, hints, tests, and feedback before answers | Attempts solution independently |
| Demonstration mode | A concept needs a compact example | Show a minimal example, then dissect it | Runs/modifies example |
| Direct implementation | Only when explicitly requested | Edit/build/test the requested work, then explain | Reviews and asks questions |
| Review/diagnosis | User asks what is wrong or how code works | Inspect and explain; do not rewrite everything automatically | Provides code/output and decides next change |

If the desired mode is unclear, preserve momentum with guided implementation rather than asking a broad process question.

### 2A.3 Step size and pacing

A good learning step usually introduces one primary idea:

- one command;
- one file;
- one function;
- one route;
- one database table;
- one test;
- one debugging hypothesis;
- one Git action.

Several tightly related lines may be taught together. Avoid overwhelming the user with a 300-line solution that contains ten new ideas. Large files should be divided into logical sections, each explained and verified.

At each checkpoint, agents should include:

- **Action:** what the user should type or change
- **Location:** terminal/directory/file and insertion point
- **Explanation:** syntax and purpose
- **Expected result:** output, file tree, UI behavior, or test result
- **If it differs:** what output the user should paste back

### 2A.4 Syntax explanation standard

When introducing new code, explain:

- keywords;
- functions and methods;
- variables and types;
- punctuation with structural meaning;
- operators;
- imports/packages;
- parameters and return values;
- control flow;
- data structures;
- error handling;
- how the runtime executes the code;
- conventions versus language requirements.

Example: do not merely give `mkdir marketplace-service`. Explain that `mkdir` means **make directory**, that `marketplace-service` is the new directory name, that the command acts relative to the current working directory unless an absolute path is used, and how to verify the result.

When syntax resembles another language the user knows, compare them. Examples:

- Go `if err != nil` versus Python exceptions
- Rust `Result` versus Go's explicit error return
- TypeScript interfaces versus Python type hints
- Bash pipelines versus PowerShell object pipelines
- SQL joins versus merging Pandas DataFrames

### 2A.5 Explain usage, not only syntax

For every important tool or construct, also explain:

- when it is appropriate;
- when it is unnecessary;
- common mistakes;
- performance or security implications;
- how it appears in professional projects;
- alternatives and why the current choice was selected.

For example, teaching a PostgreSQL index should include what lookup it helps, its write/storage cost, how to inspect the query plan, and why every column should not automatically be indexed.

### 2A.6 Verification is part of learning

Do not treat successful code entry as proof that the concept works. Teach verification:

- inspect the file tree;
- read command output;
- run the program;
- call the API;
- query the database;
- run the test;
- inspect logs;
- use browser developer tools;
- confirm Git changes;
- deliberately try one invalid input;
- compare actual and expected behavior.

Agents should explain what a successful result means and what it does **not** prove.

---

## 2B. Command-Line Learning Requirements

### 2B.1 Use the command line whenever it adds real learning value

The user wants command-line knowledge to grow alongside programming. Do not avoid the terminal by always telling the user to click through a GUI. When safe and relevant, teach the command-line operation even if a GUI alternative exists.

Examples include:

- identifying the current directory;
- listing files, including useful metadata;
- creating folders and files;
- moving and copying files;
- searching filenames and file contents;
- inspecting processes and ports;
- managing packages;
- running formatters, linters, tests, and builds;
- working with Git;
- starting and inspecting Docker services;
- sending HTTP requests;
- connecting to and querying databases;
- reading logs;
- inspecting environment variables safely;

### 2B.2 Explain command anatomy

For each unfamiliar command, explain:

```text
command  subcommand  options/flags  arguments  redirection/pipeline
```

Also explain:

- current working directory;
- relative versus absolute paths;
- quoting paths that contain spaces;
- short versus long flags;
- exit codes;
- standard output versus standard error;
- pipes and redirection;
- shell expansion;
- why copying commands blindly can be dangerous.

### 2B.3 Basic filesystem commands to teach naturally

Do not teach these as an isolated memorization dump. Introduce them when the project needs them.

| Purpose | Bash/Linux/macOS | PowerShell | Teaching note |
| --- | --- | --- | --- |
| Show current directory | `pwd` | `Get-Location` (`pwd` alias) | Establish where the next command acts |
| List directory | `ls -la` | `Get-ChildItem` (`ls` alias) | Explain hidden files and metadata |
| Create directory | `mkdir marketplace-service` | `New-Item -ItemType Directory marketplace-service` | Explain relative path and naming |
| Enter directory | `cd marketplace-service` | `Set-Location marketplace-service` (`cd`) | Explain that the shell's working directory changes |
| Create empty file | `touch README.md` | `New-Item -ItemType File README.md` | Prefer editor creation when content is immediately needed |
| Copy file | `cp source target` | `Copy-Item source target` | Explain source and destination order |
| Move/rename | `mv old new` | `Move-Item old new` | Same mechanism often handles move and rename |
| Remove file | `rm file` | `Remove-Item file` | Pause and verify target; deletion can be destructive |
| Create nested folders | `mkdir -p src/tests` | `New-Item -ItemType Directory -Force src/tests` | Explain parent creation and `-Force` behavior |
| Show file content | `less file`, `head`, `tail` | `Get-Content file` | Select command based on file size/use |
| Search text | `rg 'pattern'` | `rg 'pattern'` if installed | Prefer ripgrep for code searches |
| Find files | `find`, `fd` | `Get-ChildItem -Recurse` or `fd` | Explain filename versus content search |

Never use a destructive command merely for demonstration. Before `rm`, recursive deletion, overwriting, database drops, container-volume deletion, or force operations, resolve and restate the exact target.

### 2B.4 Teach shell differences

The user works with both Windows and Linux. Explain when a command is:

- Bash-specific;
- PowerShell-specific;
- an alias that means something different across shells;
- a native executable available in both environments;
- being run locally versus over SSH;
- being run on Windows, a Debian VM/LXC, the Proxmox host, or inside a container.

PowerShell pipelines pass objects, whereas traditional Unix pipelines primarily pass text. This difference should be taught through real examples rather than reduced to command-equivalence lists.

### 2B.5 Terminal location labels

Before giving a command, identify where it should run when ambiguity is possible:

- **Windows PowerShell on development PC**
- **Linux shell on `docker-server` over SSH**
- **Debian test LXC**
- **Proxmox host shell**
- **inside a Docker container**
- **PostgreSQL `psql` prompt**
- **project directory and branch**

This prevents commands intended for a safe test system from being run on critical infrastructure.

---

## 2C. Architecture Teaching Requirements

Architecture knowledge should be introduced when a project decision or debugging problem makes it relevant. Do not reduce architecture to unexplained diagrams or postpone it until the system is large.

### 2C.1 Topics to teach progressively

- client versus server
- front end versus backend
- process, service, container, VM, and physical host
- request/response lifecycle
- routes, controllers/handlers, services, repositories, and database layers
- dependency direction
- interfaces and adapters
- monolith, modular monolith, and microservices
- synchronous versus asynchronous work
- queues and background jobs
- stateful versus stateless services
- database ownership
- caching
- authentication versus authorization
- network ports, DNS, TLS, proxies, and firewalls
- deployment environments
- scaling, reliability, backups, and observability
- data pipelines and model-serving architecture

### 2C.2 Always connect diagrams to code and runtime behavior

When explaining architecture, trace a concrete action end-to-end. Example:

> User clicks **Search card** in React → the browser sends HTTP JSON to FastAPI → the route validates the query → a service applies domain logic → a repository queries PostgreSQL → results are serialized to JSON → React renders them.

Then identify which file/function represents each stage. Explain which parts run in the browser, development PC, VM, container, database, or third-party provider.

### 2C.3 Explain tradeoffs

Architecture teaching should include why a choice was made and what it costs. For example:

- independent services teach language boundaries but add networking and operational complexity;
- PostgreSQL provides strong relational features but requires administration compared with SQLite;
- Docker improves repeatability but adds volumes, networks, images, and lifecycle concepts;
- caching improves latency but introduces invalidation and stale data;
- background jobs improve responsiveness but create eventual consistency and retry concerns.

### 2C.4 Avoid architecture theater

Do not introduce microservices, Kubernetes, Kafka, service meshes, event sourcing, or elaborate cloud infrastructure just because they are professional technologies. Introduce them through a lab or real requirement that exposes their benefits and costs.

---

## 2D. Debugging Must Be Taught Explicitly

Debugging is a primary learning objective, not an interruption to coding.

### 2D.1 Standard debugging loop

Agents should teach and model this sequence:

1. **Reproduce:** state the exact action that triggers the problem.
2. **Observe:** capture the complete error, logs, inputs, environment, and relevant state.
3. **Localize:** identify which layer likely failed.
4. **Hypothesize:** propose one or a few testable causes.
5. **Test narrowly:** use the smallest safe command, log, breakpoint, or isolated case.
6. **Fix the cause:** avoid hiding the symptom.
7. **Verify:** rerun the original failure path and nearby edge cases.
8. **Prevent regression:** add a test, validation, health check, or documentation.
9. **Record:** update the handoff when the failure teaches something durable about the environment.

### 2D.2 Explain errors line by line

When the user provides an error:

- preserve the exact message;
- identify the program that emitted it;
- explain the relevant filename, line number, error type/code, and stack frames;
- separate the root cause from secondary cascading errors;
- explain why the proposed diagnostic command can confirm or reject the hypothesis;
- do not jump immediately to reinstalling everything.

### 2D.3 Debug across layers

Teach the appropriate tools for the layer:

| Layer | Examples of tools/techniques |
| --- | --- |
| Browser/UI | DevTools Elements, Console, Network, React DevTools |
| TypeScript/Node | stack traces, source maps, debugger, tests, type checker |
| Python | tracebacks, `breakpoint()`, logging, pytest, Ruff/type checking |
| Go | returned errors, `slog`, Delve, `go test`, race detector |
| Rust | compiler diagnostics, `dbg!`, `RUST_BACKTRACE`, tests, Clippy |
| API | `curl`, HTTPie, Bruno/Postman/Insomnia, OpenAPI docs |
| Database | `psql`, SQL clients, constraints, transactions, `EXPLAIN ANALYZE` |
| Docker | `docker ps`, `docker logs`, `docker inspect`, Compose status |
| Linux | `journalctl`, `systemctl`, `ss`, `ps`, `top`/`htop`, permissions |
| Network | `ping` where useful, `curl`, `dig`, `traceroute`, `tcpdump`, Wireshark |
| Git | `status`, `diff`, `log`, `show`, branch comparison |

Only introduce commands needed for the current diagnosis, then explain how they generalize.

### 2D.4 Encourage prediction

Before running a debugging command, ask or explain:

- What do we expect to see if the hypothesis is correct?
- What result would disprove it?
- Which layer do we inspect next in either case?

This builds diagnostic reasoning rather than a habit of copying random fixes.

---

## 2E. Expanding Software Knowledge

The user wants broad exposure to professional, useful, and interesting software. Agents should deliberately introduce tools throughout the projects, while keeping one primary tool per immediate job.

### 2E.1 Software-introduction rule

Whenever a new category becomes relevant:

1. Name the primary tool being used now.
2. Explain what problem category it solves.
3. Mention two or three meaningful alternatives.
4. Compare the main tradeoffs briefly.
5. Teach the selected tool through the current project.
6. Record a future mini-lab if an alternative would teach a genuinely different workflow.

Do not install ten overlapping programs at once. Breadth should accumulate over time through real use.

### 2E.2 Software categories to incorporate progressively

| Category | Primary/current candidates | Alternatives or later exposure | Learning purpose |
| --- | --- | --- | --- |
| Editors/IDEs | Cursor, VS Code, Visual Studio, PyCharm | IntelliJ IDEA, WebStorm, GoLand, RustRover, DataGrip, Zed | editor workflows, debugging, refactoring, language tooling |
| Source control | Git, GitHub | GitLab, Forgejo/Gitea in homelab | branches, reviews, issues, CI, self-hosting |
| API clients | browser/OpenAPI UI, `curl` | HTTPie, Bruno, Postman, Insomnia | inspect requests, headers, payloads, authentication |
| API design | FastAPI/OpenAPI | Swagger Editor, Stoplight, Redoc, Spectral | contracts, validation, documentation |
| Relational databases | PostgreSQL | SQLite, MySQL/MariaDB, SQL Server | schema design, transactions, dialect differences |
| Database GUIs | pgAdmin or DBeaver | DataGrip, Beekeeper Studio, SSMS, Azure Data Studio alternatives | query, inspect schemas, plans, administration |
| Data transformation | Python/Pandas, SQL | Polars, DuckDB, dbt, R/tidyverse | cleaning, analytical queries, reproducible transformations |
| Notebooks | JupyterLab | VS Code notebooks, Quarto, Observable | experiments, explanations, reproducible analysis |
| Visualization/BI | Matplotlib | Seaborn, Plotly, Altair, Power BI, Tableau Public, Grafana | charts, dashboards, monitoring, storytelling |
| Containers | Docker, Compose | Podman, containerd concepts | reproducibility, isolation, deployment |
| Virtualization | Proxmox | Hyper-V, VirtualBox, VMware concepts | VMs, LXCs, snapshots, networking |
| CI/CD | GitHub Actions | GitLab CI, Jenkins, Woodpecker | automated quality checks and delivery |
| Task/build runners | npm scripts, language-native commands | Make, Just, Taskfile | repeatable developer commands |
| Testing | pytest, Vitest, Go test, Cargo test | Playwright, Cypress, k6, Postman/Bruno tests | correctness from units to end-to-end/load |
| Code quality | Ruff, Prettier, ESLint, Clippy | Biome, Black, mypy/pyright, golangci-lint | formatting, linting, types, consistency |
| Observability | logs, Dozzle, Uptime Kuma | Prometheus, Grafana, Loki, OpenTelemetry, Sentry | health, metrics, traces, alerting |
| Networking | Tailscale, Nginx Proxy Manager | Caddy, Traefik, Cloudflare Tunnel concepts | DNS, routing, proxies, TLS, secure remote access |
| Secrets/config | `.env` locally | SOPS, age, Vault, Docker secrets, GitHub secrets | configuration and secret lifecycle |
| Documentation | Markdown, Mermaid | MkDocs, Docusaurus, Sphinx, Quarto | durable knowledge and generated docs |
| Architecture modeling | Mermaid | draw.io/diagrams.net, Excalidraw, PlantUML | visualize systems and data flow |
| Project management | Markdown/GitHub Issues | GitHub Projects, Trello, Linear, Jira, Obsidian | backlog, milestones, decision tracking |
| Data/versioning | Git for code | DVC, lakeFS concepts, object storage | datasets, lineage, reproducibility |
| Messaging/jobs | simple in-process jobs first | Redis, Celery/RQ, RabbitMQ, NATS, Kafka concepts | background work and event-driven design |
| Search | PostgreSQL search first | Meilisearch, Typesense, Elasticsearch/OpenSearch | indexing and retrieval |
| Local AI | Python/RTX 3090 experiments | Ollama, llama.cpp, vLLM, MLflow | inference, serving, experiment tracking |
| Security | dependency updates and basic scanning | Trivy, Semgrep, CodeQL, OWASP ZAP | supply chain, static analysis, web testing |
| Creative asset integration (only when relevant) | See separate creative guide | Import/export contracts and editor scripting | Load only the context required by the coding task |

This is an exposure catalog, not a requirement to adopt every item.

### 2E.3 Learn software through comparison labs

When appropriate, create small comparison exercises rather than migrating a real project unnecessarily. Examples:

- query the same dataset in PostgreSQL, DuckDB, Pandas, and R;
- call one API with `curl`, HTTPie, Bruno, and a small Python script;
- inspect the same Git repository in Cursor and a JetBrains IDE;
- run the same container through Docker CLI and Compose;
- produce the same chart with Matplotlib and Plotly;
- compare SQLite's embedded workflow with PostgreSQL's server workflow;
- debug the same HTTP request in browser DevTools and server logs.

The goal is to understand categories and tradeoffs, not to replace working tools constantly.

---

## 3. Non-Negotiable Working Principles

### 3.1 Independent services, integrated experience

**Confirmed decision:** A Python, Rust, Go, Java, or other application must remain independently runnable and developable. Integration with the React hub happens through an API or other stable contract.

The hub is a client and orchestration surface, not a reason to collapse every project into one language or repository.

An independent service may retain its own:

- CLI or native GUI
- core/business logic
- database
- release cadence
- tests
- deployment method
- repository

To integrate it, add a thin interface—usually REST/JSON first—that reuses the existing core logic.

### 3.2 Professional workflow from the beginning

Use real engineering practices at a scale appropriate to the project:

- Git and GitHub
- clear `README.md`
- stable `main` and active `dev`
- feature branches for substantial changes
- issues or a lightweight backlog
- formatter and linter
- automated tests
- environment-based configuration
- dependency pinning / lockfiles
- API documentation
- database migrations
- structured logging
- Docker where it adds learning or deployment value
- CI/CD introduced progressively
- decision records for architecture choices
- handoff updates for agents

### 3.3 Teaching and delivery must coexist

Agents should neither turn every task into a lecture nor silently build an opaque system. The desired balance is:

- lead with the current outcome;
- explain the key mechanism;
- give the next safe action;
- show relevant syntax in context;
- verify before moving on;
- document decisions that affect future work.

### 3.4 Prefer contracts over coupling

Use explicit boundaries:

- HTTP/JSON and OpenAPI for service APIs
- schemas for data exchange
- migrations for databases
- environment variables for deployment-specific values
- adapter/provider interfaces for external marketplaces and APIs
- versioned endpoints or schemas when compatibility becomes important

### 3.5 Keep raw evidence

For data projects, preserve the distinction between:

- raw source data;
- normalized/cleaned records;
- derived features;
- model outputs;
- user corrections;
- provenance and collection time.

Do not overwrite raw data with cleaned data. Reproducibility matters.

---

## 4. Ecosystem Project Registry

| Project / domain | Status | Primary purpose | Likely main stack | Hub relationship |
| --- | --- | --- | --- | --- |
| React Mega API Hub (`reactPrac`) | Confirmed, existing repo | Learn React deeply and provide a common UI for services | React, TypeScript, Vite | Central front end |
| Marketplace Intelligence | Confirmed direction, early planning | Collectibles valuation, trend, liquidity, and decision support | Python, Pandas, FastAPI, PostgreSQL | Independent service + dashboard module |
| Math Lab (`mathy`) | Confirmed, active repo | Algebra through calculus/linear algebra/statistics and AI math | Python, SymPy, NumPy, Matplotlib, Jupyter | Supplies skills/models to other domains |
| Language Lab | Confirmed direction | Grammar, writing, vocabulary, proficiency, NLP | Go backend, React/TS, PostgreSQL | Independent Go service + module |
| Blockchain/Web3 Lab | Confirmed direction, brainstorming | Learn ledgers, contracts, wallets, NFTs, DeFi, logistics | Language depends on subproject; Solidity likely later | Services and data modules |
| Retro Game Preservation Lab | Confirmed idea, research stage | Learn emulation, archival metadata, browser delivery, preservation | Web tech, emulation runtimes, storage | Catalog/player module where lawful |
| Chess Analytics | Confirmed idea; React chess repo exists | Personal game analysis, openings, trends, statistics, engine integration | React/TS plus data/backend service | Chess module |
| Sports Data Ecosystem | Confirmed idea | NBA, NFL, NHL, UFC, WWE, F1, Olympics, and more | Per-service language; common schemas | Multiple modules/services |
| Science / Space / Nature Data | Confirmed idea | Weather, NASA, SpaceX, geospatial, animals/wildlife | Per-service language | Multiple modules/services |
| History / Archives / Media | Confirmed idea | History, antiques, film, TV, music, inventions, patents | Search/data services | Enrichment for hub and marketplace |
| Reference Collector | Existing Python project | Collect and process reference assets/information | Python, httpx, Pillow, Typer, Rich | Possible ingestion utility/service |
| Homelab / DevOps Lab | Existing and active | Host, secure, monitor, and learn infrastructure | Proxmox, Debian, Docker, Tailscale, Synology | Deployment foundation |
| Cybersecurity / Kali Lab | Existing learning environment | Learn tools safely in authorized lab systems | Kali, Wireshark, Linux tooling | Security testing/observability support |

This registry should be updated whenever a project moves from proposed to active, receives a repository, changes stack, or reaches a milestone.

---

## 5. Architectural Vision

### 5.1 Conceptual layers

```mermaid
flowchart TD
    F["Experience Layer\nReact Hub, CLI, notebooks"]
    G["Gateway / Contracts\nREST, OpenAPI, health checks"]
    B["Domain Services\nMarketplace, Chess, Language, Sports"]
    P["Data Platform\nPostgreSQL, files, provenance"]
    X["Analytics\nPandas, R, statistics, ML"]
    O["Operations\nDocker, Proxmox, NAS, Tailscale"]
    F --> G
    G --> B
    B --> P
    P --> X
    O --> F
    O --> B
    O --> P
```

### 5.2 Service contract baseline

REST should be learned first because it is broadly useful and easy to inspect. A typical service should eventually expose:

- `GET /health` — process and dependency health
- `GET /version` — service/build version
- domain resource endpoints, such as `/items`, `/listings`, `/games`, or `/analyses`
- input validation
- structured error responses
- generated OpenAPI documentation
- CORS configured only for intended front ends
- environment-based host/port/database configuration
- timeouts, retries, and rate-limit handling for external providers

Later communication styles can be introduced for a specific reason:

- Webhooks for external events
- WebSockets or server-sent events for live updates
- JSON-RPC for method-oriented systems
- queues for background ingestion and model jobs
- gRPC for strongly typed internal communication when complexity justifies it

### 5.3 Hub behavior when services are independent

The hub should not assume every service is always running. Planned behavior:

- maintain a registry of configured services;
- check service health;
- show online, degraded, or offline status;
- use environment-configured URLs;
- give helpful error states rather than blank pages;
- keep domain modules lazy-loaded where practical;
- type API responses;
- eventually generate clients from OpenAPI or share schemas.

### 5.4 Monorepo versus multirepo

**Current preference:** independent apps can remain separate repositories. The React hub acts as the integration point.

Do not prematurely force a monorepo. A future umbrella repository may contain:

- architecture documents;
- Docker Compose files for local integration;
- API contract references;
- service catalog;
- shared schemas;
- development scripts;
- this master handoff.

That umbrella should not erase the independent identity of each service.

---

## 6. Project Detail: React Mega API Hub

### 6.1 Confirmed information

- Repository: `https://github.com/Ash31393/reactPrac`
- Existing goal: learn React more deeply.
- Known base: TypeScript / React / Vite.
- New architectural role: evolve into an API Explorer and control center for independent services.
- It should communicate with external apps through their exposed HTTP/JSON APIs.

### 6.2 Learning goals

Use the hub to learn React progressively:

1. Components, props, state, events, and forms
2. TypeScript models and safe data handling
3. Fetching APIs and handling loading/error/empty states
4. Routing and domain modules
5. Reusable UI patterns
6. Custom hooks
7. Server-state caching
8. Testing
9. Accessibility
10. Performance, code splitting, and profiling
11. Authentication and authorization when needed
12. Observability and error reporting

### 6.3 Candidate modules

- Service dashboard / health monitor
- Weather
- NASA / SpaceX
- Chess
- Marketplace / collectibles
- Sports
- Language Lab
- Math visualizations
- Blockchain explorer / learning sandbox
- Geography / maps
- Wildlife / animals
- History / archives
- Film / TV / music
- Gaming and retro-game catalog
- Cars, racing, machines, and engines
- Inventions and patents
- Government/open datasets
- Medical/public-health datasets where access and privacy permit

### 6.4 Proposed technical growth

- Routing: React Router or a framework decision later
- Data fetching: begin with `fetch`; evaluate TanStack Query after core behavior is understood
- Validation: Zod or equivalent for runtime schema validation
- Testing: Vitest + React Testing Library; end-to-end testing later
- Styling: inspect current repository before deciding
- Documentation: module-level README and service contract links
- Environment variables: Vite-prefixed service URLs
- CI: lint, type-check, test, build

### 6.5 Do not do

- Do not move all backend logic into React.
- Do not make React depend on a service's internal files or database tables.
- Do not hard-code private LAN IPs in committed UI source.
- Do not replace existing project structure without inspecting it.

---

## 7. Project Detail: Marketplace and Collectibles Intelligence

### 7.1 Product idea

Build a data-driven system for researching physical items as inventory, collectibles, or investments. The initial advantage is not simply buying and reselling; it is accumulating a clean, historical, provenance-aware dataset that becomes more useful over time.

Initial focus should be lower-cost cards because entry cost and experimentation risk are lower. Candidate categories include:

- Pokémon
- Yu-Gi-Oh!
- Dragon Ball / DBZ
- Formula 1 cards
- wrestling cards
- sports cards broadly
- sneakers
- retro games and hardware
- other collectibles later

### 7.2 Marketplace/data-source landscape

Sources discussed or relevant to evaluate:

- eBay — primary early candidate because official APIs and sold-market data may be available subject to program rules
- Whatnot — key source of interest; use official access, exports, seller tools, or manual observations unless an authorized API is available
- Amazon — evaluate Product Advertising API, seller APIs, fees, category restrictions, and data-license limitations
- Facebook Marketplace — limited official data access; avoid unauthorized automated scraping
- PSA — grading/certification and population information where available
- PriceCharting — retro games and some collectibles; inspect licensing/API terms
- StockX — sneakers and market-style data where official access is available
- TCGplayer — cards; evaluate developer/API access and current terms
- COMC, Cardmarket, PWCC/Fanatics Collect, Heritage, Goldin, Mercari, OfferUp, local auction houses, and public auction datasets — proposed evaluation list

All access details are time-sensitive and must be verified against current official documentation before implementation.

### 7.3 Confirmed initial architecture direction

First practical pipeline:

> **Cards + eBay API + the user's own/manual Whatnot observations → PostgreSQL → Python/Pandas → FastAPI → React**

Later providers can be added through adapters without changing the internal data model.

### 7.4 Core data model concepts

Separate the real-world collectible from the observed marketplace listing.

Potential entities:

- `franchise` — Pokémon, Yu-Gi-Oh!, F1, WWE, etc.
- `set` — release/set/series
- `item` — canonical card or product identity
- `variant` — edition, parallel, foil, language, print, serial numbering
- `grade_company` — PSA, BGS, CGC, SGC, etc.
- `graded_item` — grade, certification ID where allowed, qualifier
- `marketplace`
- `seller`
- `listing`
- `listing_snapshot` — changes in price/status over time
- `sale` — confirmed sold event when reliably observable
- `auction_event`
- `fee_schedule`
- `shipping_observation`
- `condition_observation`
- `image_reference`
- `price_observation`
- `collection_item` — user's holdings/inventory
- `watchlist`
- `source_record` — raw source payload and provenance
- `normalization_decision` — how a source listing was mapped to a canonical item

Important fields may include:

- source and source ID
- source URL where retention is allowed
- collection timestamp
- event/sale timestamp
- asking price versus sold price
- shipping cost
- taxes if relevant and available
- platform/seller fees
- currency
- quantity/lot size
- condition
- raw title and description
- canonical item match
- grade and grading company
- seller reputation indicators
- auction versus fixed price
- number of bids
- image hashes or references where lawful
- confidence score for item matching

### 7.5 Metrics and analyses

Useful analyses extend well beyond average price:

- median sold price
- trimmed mean
- price distribution and outliers
- time-weighted price trends
- sales velocity
- days to sale
- sell-through rate
- bid depth / auction participation
- listing-to-sale conversion
- price dispersion across marketplaces
- net margin after fees, shipping, tax, supplies, returns, and grading
- break-even purchase price
- inventory turnover
- capital tied up
- volatility
- drawdown
- liquidity-adjusted return
- condition/grade premium
- population/scarcity versus demand
- set/franchise momentum
- seasonal patterns
- seller-specific effects
- suspicious/anomalous listing detection
- duplicate or relisted item detection
- confidence intervals, not only point estimates

### 7.6 Business expansion beyond buying

The dataset can potentially support:

- personal collection tracking
- valuation dashboards
- watchlists and alerts
- deal scoring
- inventory and profit/loss accounting
- seller analytics
- market reports
- price history
- portfolio exposure by franchise/category
- grading decision support
- demand/liquidity estimates
- market anomaly detection
- educational content or research
- a paid analytics product later, only after validating data rights and user value
- APIs for other internal projects

### 7.7 Mathematical integration roadmap

This project is a natural applied laboratory for the `mathy` curriculum:

| Math stage | Marketplace application |
| --- | --- |
| Arithmetic / percentages | fees, discounts, markup, margin, break-even |
| Algebra 1 | solve for maximum purchase price or target profit |
| Algebra 2 | nonlinear price relationships, exponentials, functions |
| Geometry | image measurements, centering, surface-area concepts |
| Trigonometry | image perspective correction and orientation |
| Statistics | distributions, sampling bias, confidence intervals, regression |
| Probability | sale probability, condition uncertainty, expected value |
| Calculus | rate of price change, optimization, accumulation over time |
| Linear algebra | feature vectors, embeddings, regression, recommendation systems |
| Discrete math | item matching, graphs, combinations, marketplace networks |
| Machine learning | entity resolution, forecasting, classification, anomaly detection |
| Deep learning | image-based card identification, condition/defect assistance, embeddings |

### 7.8 Early milestone plan

1. Select one narrow card category.
2. Define a canonical item schema.
3. Obtain data using an official API or manual CSV form.
4. Preserve raw responses/observations.
5. Normalize records into PostgreSQL.
6. Use a notebook or script for descriptive analysis.
7. Expose read-only endpoints with FastAPI.
8. Display search, recent sales, price distribution, and provenance in React.
9. Add tests around money, fees, and normalization.
10. Only then add another provider or category.

### 7.9 Critical boundaries

- A listing price is not necessarily market value.
- A marked-sold listing may not reveal the actual accepted offer.
- Small and biased samples can create false trends.
- Collectibles are illiquid and condition-sensitive.
- Fees and shipping can erase apparent profit.
- Price predictions must communicate uncertainty.
- Never market an experimental score as guaranteed investment advice.

---

## 8. Project Detail: Math Lab (`mathy`)

### 8.1 Confirmed information

- Repository: `https://github.com/Ash31393/mathy`
- GitHub setup is complete.
- `main` is stable and `dev` is the active learning branch.
- Most recently recorded state: Algebra 1 review; Unit 1 / algebra foundations after variables and expressions.
- Recorded next topics: evaluating expressions/substitution, then combining like terms/equivalent expressions.
- The user has also practiced roots, slopes, point-slope form, standard form, inequalities, absolute value, intercepts, and basic parabola interpretation.
- The project is intended to grow through Algebra 2, geometry/trigonometry, precalculus, calculus, linear algebra, probability, and statistics.

### 8.2 Curriculum path

Current broad path:

1. Algebra 1 review
2. Algebra 2
3. Geometry and trigonometry
4. Precalculus
5. Calculus
6. Linear algebra
7. Probability and statistics
8. Discrete mathematics / optimization as useful
9. Machine-learning mathematics
10. Deep-learning mathematics

Khan Academy is the curriculum spine, with tools and projects expanding the concepts.

### 8.3 Tool stack

- Python
- SymPy
- NumPy
- Matplotlib
- Pandas
- SciPy later
- JupyterLab / notebooks
- Desmos
- GeoGebra
- Pint / units where useful

### 8.4 Required teaching behavior

- Do not restart the course.
- Guide rather than simply reveal exercise answers.
- Explain why procedures work.
- Use symbolic, numerical, graphical, geometric, and computational representations.
- Introduce libraries gradually.
- Preserve experiments and observations.
- Treat an error as evidence about what to review.
- Connect math topics to active projects as soon as the prerequisite knowledge is sufficient.

### 8.5 Cross-project application priorities

The Marketplace Intelligence project is currently the clearest applied-math partner. Other applications:

- Chess: probabilities, rating trends, evaluation distributions, clustering openings
- Sports: rates, expected values, regression, time series
- Language: frequency, error distributions, embeddings, classification
- Web3: cryptographic number theory, probability, economics, graph analysis
- Games: vectors, transformations, physics, probability, procedural systems
- API operations: latency distributions, capacity, error rates, forecasting

### 8.6 Repository conventions

Expected structure includes curriculum folders, reusable code, notebooks, visualizations, and projects. Inspect the actual repo before assuming exact paths.

Branch convention:

- `main`: stable checkpoints
- `dev`: ongoing work
- `feature/...`: larger isolated work

Do not commit:

- `.venv/`
- caches
- notebook checkpoints
- credentials
- large generated data without an explicit storage decision

---

## 9. Project Detail: Go Language / Grammar Learning Platform

### 9.1 Confirmed decisions

- This project should deliberately use a new primary backend language rather than defaulting to Python, React alone, or Rust.
- **Go was accepted as the backend language.**
- A React/TypeScript front end can still be used for the user interface.

### 9.2 Product direction

Build a language-learning and writing-analysis platform that can support:

- English grammar correction
- explanations of grammar rules
- writing proficiency practice
- vocabulary and synonyms
- definitions and examples
- personal error history
- spaced review of recurring mistakes
- multilingual learning later
- NLP and AI integration later

### 9.3 Proposed Go-first stack

- Begin with Go standard-library `net/http` to understand the fundamentals
- Move to Chi when routing/middleware complexity justifies it
- PostgreSQL
- `database/sql`
- `sqlc` for typed SQL access
- `goose` for migrations
- Docker Compose
- REST/JSON and OpenAPI
- Go testing package
- structured logging with `slog`
- GitHub Actions
- domain-oriented internal package structure

### 9.4 Candidate external services

- LanguageTool
- Datamuse
- Wiktionary-derived sources where licensing permits
- LibreTranslate

Verify current APIs, licenses, usage restrictions, privacy behavior, and rate limits before integration.

### 9.5 First milestone

1. Submit a text passage.
2. Send it to a grammar-analysis provider.
3. Normalize returned issues.
4. Explain the detected rule and suggestion.
5. Store the analysis and error types.
6. Display a history/dashboard.
7. Add tests for handlers, validation, and database code.

### 9.6 Later additions

- Python NLP microservice for experiments
- Java integration if self-hosting or extending LanguageTool
- local models
- embeddings and semantic search
- personalized exercise generation
- pronunciation tools
- speech recognition and synthesis

These are later phases, not prerequisites for the first Go service.

---

## 10. Project Detail: Blockchain / Web3 Learning Ecosystem

### 10.1 Goal

Learn the broad blockchain/Web3 domain through projects rather than only theory. Areas of interest include:

- blockchain fundamentals
- ledgers and consensus
- smart contracts
- tokens
- NFTs
- NFT marketplaces
- wallets and signing
- crypto market data
- trading systems
- DeFi
- decentralized identity
- supply chain/logistics use cases
- on-chain analytics
- bridges, oracles, and governance
- security failures and threat models

### 10.2 Project philosophy

- Use professional Git/GitHub routines.
- Explain commands, syntax, protocols, and risks in depth.
- Use multiple languages only when each adds learning value.
- Keep mini-projects independently runnable.
- Expose useful services to the React hub.
- Maintain agent handoffs.
- Prefer testnets, local chains, simulations, and tiny/no-value experiments while learning.

### 10.3 Suggested staged path

1. Build a toy append-only ledger to understand hashes and tamper evidence.
2. Add signatures and verify ownership.
3. Explore transactions, balances, and double-spend prevention.
4. Use a local blockchain development environment.
5. Write and test a simple smart contract.
6. Build a read-only chain explorer module.
7. Learn wallet connection and transaction signing.
8. Build an educational NFT or marketplace prototype.
9. Analyze public on-chain data with SQL/Python.
10. Explore DeFi mechanics through simulations before interacting with real value.

### 10.4 Security requirement

Never treat smart-contract code as safe merely because it compiles. Teach:

- key management
- permissions
- reentrancy
- integer/unit errors
- price-oracle manipulation
- front-running / MEV
- approval risks
- upgradeability risks
- bridge risk
- dependency risk
- test coverage and audit limitations

No agent should encourage depositing meaningful funds into experimental code.

---

## 11. Project Detail: Retro Game and Digital Preservation Platform

### 11.1 Interests

- Flash games
- Neopets / Miniclip-era browser games
- old-school web games and communities
- retro console games
- emulator technologies
- 2D interactive/graphic games
- metadata, history, manuals, covers, and preservation
- homelab/NAS hosting

### 11.2 Architectural distinction

For many emulator-based systems, the server/NAS does not render every frame. It can serve the emulator runtime and game file to a client, and the browser or local device performs the emulation. In other designs, the server renders/streams gameplay, which requires much more CPU/GPU and network capacity.

Agents should explicitly distinguish:

- static file/catalog hosting;
- browser-side emulation;
- server-side emulation with remote streaming;
- native emulator clients accessing NAS-hosted files.

### 11.3 Legal boundary

Preservation intent does not automatically authorize public distribution. Separate:

- emulator software;
- game code/ROMs;
- BIOS/firmware;
- art/manual/media assets;
- metadata;
- user-owned backups;
- public-domain or explicitly licensed games.

Begin with homebrew, public-domain, open-source, or user-created content. Do not design public access around copyrighted ROM distribution without rights.

### 11.4 Possible lawful starter projects

- metadata catalog for the user's collection
- checksum-based duplicate inventory
- cover/manual association for owned items where lawful
- homebrew game launcher
- Flash preservation experiments using compatible runtimes and permitted files
- local-only dashboard
- save-file backup and versioning
- hardware and emulator compatibility notes

---

## 12. Project Detail: Chess Analytics

### 12.1 Known context

- The user has a Chess.com account and is interested in pulling personal/game data through APIs.
- A separate `Chess` project/repository exists and has used Vite on port 5173.
- This can remain a standalone application and also become a hub module.

### 12.2 Candidate capabilities

- import personal games
- player and rating trends
- opening frequency and results
- time-control comparisons
- color performance
- blunder/mistake classification
- recurring tactical themes
- time usage if data is available
- position evaluation with a local chess engine
- training recommendations based on actual weaknesses
- PGN parsing and search
- interactive board review

### 12.3 Learning connections

- API access and pagination
- PGN parsing
- state machines and legal move generation
- statistics
- data visualization
- engine processes
- Web Workers/background processing
- caching
- personalization without exposing account secrets

Verify current official API rules and endpoints before implementation.

---

## 13. Project Detail: Sports Data Ecosystem

### 13.1 Sports of interest

- NBA
- NFL
- NHL
- UFC / combat sports
- WWE / professional wrestling
- Formula 1 and other motorsports
- Olympics
- recurring annual, seasonal, and four-year sporting events
- other sports as the project expands

### 13.2 Possible modules

- schedules and results
- standings
- player/team profiles
- historical comparisons
- injury or roster tracking where licensed data exists
- advanced statistics
- event calendars
- championship/Olympic history
- prediction experiments with uncertainty
- visualization and storytelling

### 13.3 Design guidance

Do not create one giant sports schema immediately. First define shared primitives—competition, season, event, participant, result—then allow sport-specific extensions.

Sports data changes frequently; every provider choice and factual answer should be checked against current official sources.

---

## 14. Project Detail: Science, Space, Geography, Nature, and Public Data

Confirmed interest areas:

- weather
- NASA
- SpaceX
- astronomy/space
- geography and geospatial information
- maps
- animals and wildlife
- environmental data
- government datasets
- COVID/public-health data
- machines and engines
- cars and racing
- inventions and patents

Possible learning targets:

- geospatial coordinate systems
- map layers
- time series
- sensor feeds
- large-file downloads
- data licensing
- scientific units
- uncertainty and measurement error
- rate limits and caching
- scheduled ingestion
- visualization

Medical data work must distinguish public, de-identified datasets from protected patient information. Never bring identifiable workplace patient data into these projects.

---

## 15. Project Detail: History, Archives, Media, and Cultural Data

Interest areas:

- history and archives
- antiques and old objects
- film and movies
- television
- music
- games
- art/reference material
- patents and inventions
- preservation and provenance

This area overlaps strongly with Marketplace Intelligence. A canonical collectible could eventually connect:

- identity and edition;
- historical background;
- creator/manufacturer;
- release information;
- archive references;
- marketplace observations;
- ownership/inventory;
- valuation analytics.

Use licensed APIs and public-domain/open collections when possible. Record source, license, attribution requirements, and retrieval date.

---

## 16. Existing Project: Reference Collector

Known configuration from prior work:

- Python project name/direction: `reference-collector`
- Python 3.11 environment was used in at least one setup
- `uv` package manager
- dependencies: `httpx`, Pillow, Typer, Rich
- development tools: pytest, Ruff
- CLI entry point: `refs=refcollector.main:app`

Potential roles in the ecosystem:

- download permitted reference images/assets
- collect metadata and provenance
- validate MIME types and dimensions
- organize creative references
- feed an internal media catalog
- provide a reusable ingestion utility

Inspect the actual repository and current state before selecting its next task.

---

## 17. Shared Data Platform Strategy

### 17.1 Database learning goals

The user wants to become more database-efficient and data-efficient, using multiple tools such as:

- PostgreSQL
- MySQL
- Microsoft SQL Server / SQL Server Management Studio
- SQLite
- R
- Python/Pandas
- visualization and BI tools later

Use PostgreSQL as a strong default for the main platform, but introduce other databases through focused labs that demonstrate real differences rather than duplicating the same CRUD app.

### 17.2 Database design versus data cleaning

These are connected but not identical:

- **Database design** decides entities, relationships, keys, constraints, normalization, and storage structure.
- **Data cleaning** detects and repairs missing, malformed, duplicated, inconsistent, or incorrect observations.
- **Data normalization** can mean relational database normalization or standardizing values; agents must specify which meaning is intended.

### 17.3 Proposed data layers

```mermaid
flowchart LR
    R["Raw"] --> N["Normalized"] --> C["Curated"] --> F["Features"] --> M["Models"]
```

- **Raw:** immutable provider payloads, files, or manual observations
- **Normalized:** provider fields mapped to internal schemas
- **Curated:** deduplicated, corrected, quality-checked domain data
- **Features:** model/analysis-ready derived values
- **Models:** forecasts, classifiers, scores, and evaluations

Every derived record should be traceable back to source observations where practical.

### 17.4 Data-quality dimensions

- completeness
- correctness
- consistency
- uniqueness
- timeliness
- validity
- provenance
- licensing/usage permission
- confidence of entity matching

### 17.5 Money and time

- Store currency using integer minor units or an exact decimal type, never binary floating point.
- Store the currency code.
- Store timestamps in UTC and preserve source timezone/meaning when needed.
- Distinguish event time, observation time, ingestion time, and update time.

### 17.6 Schema evolution

- Use migrations.
- Never edit a shared production schema manually without recording the change.
- Add constraints after understanding imported data quality.
- Use stable internal IDs and retain source IDs separately.
- Avoid provider-specific fields contaminating the canonical model; keep raw JSON or extension tables if necessary.

---

## 18. Analytics and AI/ML Roadmap

### 18.1 Do not jump directly to deep learning

The progression should be evidence-driven:

1. Collect data legally and reliably.
2. Understand it with SQL and descriptive statistics.
3. Visualize distributions and missingness.
4. Establish simple rules and baselines.
5. Train interpretable models.
6. Evaluate against held-out data and real use cases.
7. Add complex models only if they outperform baselines enough to justify complexity.

### 18.2 Candidate cross-domain capabilities

- entity resolution across inconsistent names
- image similarity
- anomaly detection
- recommendation systems
- time-series forecasting
- classification
- clustering
- embeddings and semantic search
- natural-language summaries
- uncertainty estimation
- active learning from user corrections

### 18.3 Model governance

For each model, record:

- purpose
- training data and permissions
- target/label definition
- features
- train/validation/test split
- leakage risks
- baseline
- metrics
- failure modes
- calibration/uncertainty
- model version
- reproducible training environment
- deployment/rollback plan

### 18.4 Local AI infrastructure

The user has an RTX 3090 desktop, which may support local model experiments. Do not assume it is always available or configured as a server. Establish networking, drivers, resource isolation, model licensing, and power/thermal expectations before relying on it.

---

## 19. Technology and Language Learning Matrix

| Technology | Current/likely role | Learning value |
| --- | --- | --- |
| TypeScript / React | Hub UI, dashboards, interactive tools | front-end architecture, types, state, testing |
| Python | data ingestion, analysis, ML, FastAPI services | data ecosystem, rapid experimentation |
| Go | Language Lab backend and systems/API learning | concurrency, static typing, deployment simplicity |
| Rust | independent services and systems learning | ownership, safety, performance |
| Java | enterprise/API experiments, possible LanguageTool work | JVM ecosystem, OOP, mature frameworks |
| SQL | all data-rich projects | modeling, querying, performance, analytics |
| R | statistical analysis and comparison with Python | statistics, reporting, visualization |
| JavaScript | web fundamentals and runtime understanding | browser and Node ecosystem |
| C/C++ | later systems/emulation/game/low-level study | memory, performance, native systems |
| Solidity | later smart-contract work | EVM programming and security |
| Bash / PowerShell | automation and administration | Linux/Windows operations |

Do not force every language into every project. Give each language a meaningful domain or service.

---

## 20. Development Tools and Environments

### 20.1 Editors and IDEs already used or discussed

- Cursor — primary AI-assisted editor
- Visual Studio Code
- Visual Studio 2022, especially for Unity
- PyCharm
- JetBrains IDEs are of interest for learning professional workflows
- WezTerm
- MobaXterm for SSH/SFTP

### 20.2 Languages/tools recorded

Versions change; verify before relying on these snapshots:

- Python 3.13.3 on one system; Python 3.11.3 used for Reference Collector
- Node v24.19.0
- npm 11.17.0
- Rust 1.75 recorded previously
- Go 1.22.6 recorded previously
- PowerShell 7.6.5 on one Windows machine
- Git, Ruff, pytest, Vite, and `uv`

### 20.3 Extension/tooling philosophy

Recommend extensions based on the active stack, such as:

- official language support
- formatter
- linter
- test explorer
- Git/GitLens tools
- Docker
- SQL/database explorer
- REST/API client
- spell/grammar checking for documentation
- Markdown linting
- security/dependency scanning later

Do not create conflicting formatters or enable multiple tools that fight over the same files. Record workspace-specific settings in the repository.

---

## 21. Homelab and Infrastructure Snapshot

> **Warning:** This section is a dated working snapshot, not a guarantee. Verify the live state before issuing commands.

### 21.1 Core infrastructure

- Proxmox host: AZW MINI S, Intel N95, 4 cores
- Proxmox OS/kernel snapshot: Debian 13/trixie-based environment, kernel `6.17.2-1-pve`
- Primary Docker VM: Debian 12, VM 101, hostname `docker-server`, approximately 2 vCPU / 4 GB RAM / 64 GB disk
- Kali VM: VM 102, approximately 2 vCPU / 4 GB RAM / 50 GB disk
- Debian test LXC: container 100, hostname `debian-test`
- Synology NAS: DS223j, name `ashinstor`, two 8 TB IronWolf drives, external USB backup
- Tailscale is used for remote private connectivity
- Desktop with RTX 3090 and Intel i9-12900KF may support GPU/AI workloads

### 21.2 Known network snapshot

- Main LAN: `192.168.68.0/22`
- Gateway: `192.168.68.1`
- Docker server LAN address was recorded as `192.168.68.72`
- Docker server Tailscale address was recorded as `100.70.237.40`
- NAS Tailscale address was recorded as `100.69.193.80`
- Debian test Tailscale address was recorded as `100.74.121.120`

IPs may change. Prefer DNS names/configuration and verify with `hostname -I`, `ip addr`, or the Tailscale status before use.

### 21.3 Docker services previously recorded

- Homepage — port 3000
- Uptime Kuma — 3001
- Portainer — 9443
- Vaultwarden — 8081
- Jellyfin — 8096
- Dozzle — 9999
- Nginx Proxy Manager — 80/81/443
- Prowlarr — 9696
- Jellyseerr — 5055
- IT-Tools — 8082
- File Browser — 8083
- qBittorrent — previously 8080/6881, networked through Gluetun in one setup
- Stirling PDF — tested on port 8080

Port conflicts are possible; inspect active containers before adding services.

### 21.4 Compose/project directories previously seen

- `twitch-archiver`
- `nginx-proxy-manager`
- `arr-stack`
- `it-tools`
- `uptime-kuma`
- `homepage`
- `filebrowser`

Other recorded directories included backups, config, data, Jellyfin, Jellyseerr, logs, and notes. Verify exact paths before modification.

### 21.5 Infrastructure learning rules

- Practice destructive or experimental administration in the test LXC/VM, not directly on the Proxmox host or NAS.
- Keep Proxmox and NAS stable.
- Back up configuration and important volumes.
- Use Docker Compose for persistent multi-container services.
- Explain the difference between image, container, volume, bind mount, network, port, and Compose project.
- Include health checks, logs, restart policies, pinned versions where appropriate, and upgrade/rollback notes.
- Prefer private access through LAN/Tailscale during learning.
- Do not publicly expose admin interfaces casually.

### 21.6 API/DevOps progression already favored

1. Local REST API basics
2. CRUD
3. validation and error handling
4. API key/authentication concepts
5. file-backed or database-backed data
6. Docker image
7. Docker Compose
8. OpenAPI/docs
9. logs and health checks
10. CI/CD
11. private deployment
12. public deployment only after security review

---

## 22. Git and GitHub Working Agreement

### 22.1 Branches

- `main`: stable, demonstrable state
- `dev`: integrated active development
- `feature/<short-name>`: larger work isolated from `dev`
- `fix/<short-name>`: focused repairs when useful
- `docs/<short-name>`: substantial documentation work when useful

Inspect each repository's existing practice before applying this mechanically.

### 22.2 Before making changes

Explain and run or ask the user to run:

```bash
git status
git branch --show-current
git log --oneline --decorate -n 10
```

Then inspect relevant files. Never overwrite unrelated uncommitted user work.

### 22.3 Commit guidance

Prefer small, meaningful commits such as:

- `feat(marketplace): add canonical card schema`
- `test(api): cover listing validation`
- `docs(handoff): record provider strategy`
- `refactor(chess): separate PGN parser from UI`

Explain staged files before committing. Do not commit secrets, virtual environments, `node_modules`, caches, raw private data, or huge generated artifacts.

### 22.4 Suggested pull-request quality gates

- formatter passes
- linter passes
- type checker passes where applicable
- tests pass
- build succeeds
- migrations reviewed
- API/schema changes documented
- README/handoff updated when behavior or workflow changes

### 22.5 Handoff and Git

This master file can live in an umbrella repo or be copied into project contexts. Each active repository may also have a shorter project-specific `AGENT_HANDOFF.md` that links back conceptually to this ecosystem file.

When an agent finishes meaningful work, it should record:

- date
- repository and branch
- what changed
- why
- commands/tests run
- results
- unresolved issues
- exact next recommended action

---

## 23. Recommended Baseline Repository Files

Not every repo needs all files immediately, but mature projects should trend toward:

```text
README.md
AGENT_HANDOFF.md
CHANGELOG.md
LICENSE
.gitignore
.editorconfig
.env.example
docs/
  architecture.md
  decisions/
  setup.md
src/
tests/
scripts/
.github/
  workflows/
```

Potential additions:

- `CONTRIBUTING.md`
- `SECURITY.md`
- `CODEOWNERS`
- API schema/OpenAPI files
- database migration directory
- Dockerfile
- `compose.yml`
- Makefile, Taskfile, or language-native task scripts

Agents must inspect language/ecosystem norms and not impose a generic structure that conflicts with the project.

---

## 24. Testing Strategy

### 24.1 Testing layers

- Unit tests for pure logic
- Integration tests for database/provider adapters
- Contract tests for API shapes
- Component tests for React UI behavior
- End-to-end tests for critical flows later
- Data-quality tests for ingestion pipelines
- Migration tests for database evolution

### 24.2 High-risk domains to test early

- money/fees/percentages
- timezones and timestamps
- item normalization and duplicate matching
- pagination
- retry/idempotency behavior
- auth boundaries
- database constraints
- parsing external payloads
- marketplace status transitions
- model leakage and evaluation splits

### 24.3 Test data

- Prefer small synthetic fixtures.
- Scrub personal/private data.
- Preserve representative edge cases.
- Do not make tests depend unnecessarily on live third-party APIs.
- Use recorded/licensed fixtures only when permitted.

---

## 25. Documentation and Decision Records

Use short Architecture Decision Records when a choice will matter later.

Suggested format:

```markdown
# ADR-0001: Use PostgreSQL for normalized marketplace data

- Date: YYYY-MM-DD
- Status: Proposed | Accepted | Superseded

## Context
What problem or constraint led to the decision?

## Decision
What was chosen?

## Alternatives considered
What else was evaluated?

## Consequences
What becomes easier, harder, or deferred?
```

Good ADR subjects:

- separate repositories versus monorepo
- canonical item model
- API versioning
- database choice
- provider ingestion strategy
- authentication
- deployment target
- event/queue adoption
- model-serving architecture

---

## 26. Agent Operating Instructions

### 26.1 At the beginning of a session

1. Read this handoff and project-specific documentation.
2. Inspect the repository and working tree.
3. State the current understanding in two or three sentences.
4. Identify the smallest useful next milestone.
5. Confirm only choices that materially change scope; do not re-ask settled questions.

### 26.2 During implementation

- Preserve user changes.
- Explain commands before or immediately after use.
- Use official documentation for time-sensitive APIs/libraries.
- Prefer a thin vertical slice that can be run and tested.
- Add tests with behavior changes.
- Record important design choices.
- Keep the user oriented: current state, why the step matters, expected output.
- Do not silently add paid services, publish data, deploy publicly, or spend funds.

### 26.3 At the end of a session

Provide:

- outcome
- changed files
- verification performed
- current branch/status
- outstanding problems
- one concrete next action
- handoff update if the work changed durable context

### 26.4 Unknown-state protocol

If a command, service, repo, or branch state is unknown:

1. Mark it as unknown.
2. Use a read-only inspection.
3. Do not infer success from an old chat message.
4. Do not run destructive recovery commands.

### 26.5 Avoid these common agent failures

- restarting an already completed setup
- inventing file paths or repository state
- treating brainstorms as commitments
- replacing working architecture without evidence
- coupling services directly to the React repo
- adding many dependencies before a working slice exists
- hiding commands and explanations from the user
- dumping enormous code without checkpoints
- failing to update documentation
- ignoring legal/data-source restrictions
- using real money or production credentials in experiments

---

## 27. Current Priority and Suggested Roadmap

### 27.1 Current likely priority

The newest major direction is the Marketplace and Collectibles Intelligence project, integrated with the existing learning ecosystem. The user is still reviewing Algebra 1 and is approaching Algebra 2, so early analysis should use arithmetic, algebra, basic functions, descriptive statistics, and visualization without waiting for calculus or deep learning.

### 27.2 Recommended Phase 0: project definition

- Choose the first collectible niche.
- Define the user story: research, personal tracking, resale evaluation, or all three in a staged order.
- Choose initial data access: likely eBay official API plus manual Whatnot observations.
- Create repository and handoff.
- Write the initial schema and data-source decision record.
- Define a small sample dataset.

### 27.3 Recommended Phase 1: first vertical slice

- PostgreSQL local development database
- Python ingestion script
- raw and normalized tables
- Pandas descriptive notebook
- FastAPI read-only API
- React page showing observed listings/sales
- tests for validation and money calculations
- Docker Compose for database + backend after local fundamentals are understood

### 27.4 Recommended Phase 2: historical intelligence

- scheduled observations where permitted
- listing snapshots
- normalization quality checks
- price distributions
- liquidity metrics
- fee-aware margin calculator
- alerts/watchlist
- provenance display

### 27.5 Recommended Phase 3: cross-marketplace and ML

- additional official provider adapter
- entity matching across providers
- confidence scoring
- regression/forecasting baselines
- anomaly detection
- image similarity experiments
- model evaluation and monitoring

### 27.6 Parallel learning lanes

To avoid one huge project blocking all progress:

- **Math lane:** continue `mathy`; apply each topic to a tiny marketplace dataset.
- **React lane:** build the hub shell and one real module.
- **Backend/data lane:** build the marketplace service.
- **Homelab lane:** host only after the local slice works.
- **Exploration lane:** preserve other ideas in the backlog without implementing all at once.

---

## 28. Open Questions and Decisions Still Needed

These are not settled. Agents should narrow them when the corresponding work begins.

### Marketplace

- What exact first niche: one Pokémon set, Yu-Gi-Oh! cards, F1, wrestling, or another small category?
- Is the first user story personal valuation, buying opportunities, inventory management, or research?
- Which eBay developer access is currently available to the user?
- How will manual Whatnot observations be captured: CSV, form, browser bookmarklet, or a private input page?
- What data may legally be retained from each provider?
- Should the first database be local on the development PC or homelab?

### Mega Hub

- Current exact state of `reactPrac` and its branch structure
- Existing styling and routing decisions
- Whether the first hub module should be marketplace, weather, chess, or a service-health dashboard
- How service discovery/configuration should work initially

### Math

- Exact last completed lesson/commit in `mathy`
- Whether to add a marketplace-themed applied notebook now or after the next Algebra 1 unit
- Current folder structure and notebook conventions

### Homelab

- Current container/service health after prior power and VPN issues
- Which NAS mounts are currently reliable
- Whether a development PostgreSQL instance already exists
- Backup strategy for source data and database volumes

### General

- Where the umbrella architecture/handoff repository should live
- Whether issues/projects will be managed in GitHub, Trello, another tool, or plain Markdown initially
- Naming conventions for services and repositories
- Which project becomes the first end-to-end portfolio demonstration

---

## 29. Backlog of Ideas to Preserve

The following ideas should not be forgotten, but they are not all immediate priorities:

- weather dashboard and historical weather analysis
- NASA/SpaceX explorer
- personal Chess.com analytics
- NBA/NFL/NHL dashboards
- UFC and WWE event/history modules
- F1/motorsport analytics
- Olympics archive and recurring event calendar
- animal/wildlife explorer
- geospatial/geography tools
- history/archive search
- film/TV/media explorer
- music APIs and analysis
- antique/collectible knowledge graph
- inventions and patent explorer
- car/engine/machine data
- public government data explorer
- medical/public-health data using safe public sources
- English grammar and language-learning platform in Go
- blockchain ledger and smart-contract labs
- NFT marketplace learning prototype
- DeFi simulation and on-chain analytics
- retro-game metadata/preservation platform
- Flash/homebrew browser game launcher
- reference asset collector
- AI-assisted item recognition
- cross-market entity resolution
- collection portfolio dashboard
- homelab service health integration in the React hub

---

## 30. Definitions Used in This Ecosystem

- **Mega API Hub:** the React/TypeScript front end that connects to independent projects/services.
- **Service:** a separately runnable backend or application exposing a stable interface.
- **Module:** a domain-focused UI area in the hub.
- **Provider adapter:** code that translates an external API/source into the internal model.
- **Canonical item:** the system's normalized representation of a real collectible/product.
- **Observation:** a fact captured from a source at a particular time.
- **Listing snapshot:** the recorded state of a listing at a point in time.
- **Provenance:** where a record came from, when it was obtained, and under what conditions.
- **Vertical slice:** the smallest end-to-end feature crossing storage, backend, and UI.
- **Raw layer:** unmodified source data retained for traceability.
- **Curated layer:** cleaned and quality-controlled data ready for analysis.
- **Handoff:** durable context telling the next collaborator what is true, what changed, and what to do next.

---

## 31. Living Update Protocol

### 31.1 When to update this file

Update after:

- a repository is created or renamed;
- a stack or architecture choice is accepted;
- a milestone is completed;
- a branch/workflow changes;
- infrastructure changes materially;
- an API/provider is approved or rejected;
- a new legal/licensing constraint is found;
- the user changes project priority;
- a major blocker is discovered;
- an agent leaves work unfinished for another agent.

### 31.2 Editing rules

- Update the `Last updated` date.
- Change the relevant status label.
- Prefer editing the authoritative section instead of only appending a note.
- Add a changelog entry for meaningful updates.
- Keep exact commands/results in project-specific handoffs when too detailed for this master file.
- Mark obsolete facts historical or superseded and point to the current record; preserve the prior information rather than deleting it.
- Never add secrets.

### 31.3 Session log template

Copy this block to the project-specific handoff or changelog:

```markdown
## Session: YYYY-MM-DD — Short title

- Repository:
- Branch:
- Agent/tool:
- Goal:

### Starting state

-

### Changes made

-

### Files changed

-

### Verification

- Command:
- Result:

### Decisions

-

### Blockers / unknowns

-

### Exact next action

1.
```

### 31.4 Compact agent handoff template

```markdown
# Project Handoff

## Current objective

## Current status

## Confirmed decisions

## Repository / branch

## Architecture

## How to run

## Tests and quality commands

## Recent changes

## Known problems

## Next three actions

## Do not change without discussion
```

---

## 32. Change Log

### 2026-09-02 — Initial master handoff

- Consolidated the interconnected project vision.
- Recorded the React Mega API Hub architecture.
- Recorded Marketplace Intelligence as the newest likely priority.
- Preserved the initial marketplace pipeline: eBay/manual Whatnot → PostgreSQL → Python/Pandas → FastAPI → React.
- Recorded the `mathy` learning path and teaching workflow.
- Recorded Go as the Language Lab backend choice.
- Preserved Blockchain/Web3, retro game preservation, chess, sports, science, history/media, and Reference Collector directions.
- Added homelab, Git, testing, data, agent-collaboration, safety, and update conventions.
- Marked unresolved choices explicitly so future agents do not invent answers.

### 2026-09-02 — Learning workflow and file-set expansion

- Made guided implementation the default: the user types commands and code while agents teach and debug.
- Added detailed syntax, command-line, architecture, debugging, verification, and software-exposure requirements.
- Added a standalone reusable agent instruction file.
- Added a focused handoff for every active or planned project area.
- Added a cross-project Shared Data, Analytics, and AI Platform handoff.

---

## 33. Immediate Next-Agent Brief

If no newer instruction supersedes this section, the next useful conversation should turn the Marketplace Intelligence idea into a concrete project charter without prematurely building the entire system.

Recommended next action:

1. Inspect whether a marketplace repository already exists.
2. Choose one narrow first collectible category and first user story.
3. Create a project-specific `AGENT_HANDOFF.md` and README.
4. Define the minimum canonical item, listing, sale, and source schemas.
5. Verify official eBay developer access and current policies.
6. Build a tiny manual dataset before automating ingestion.
7. Connect the first math exercises—percentages, fees, median, spread, and break-even—to that dataset.

The guiding principle remains:

> Build small pieces that work independently, connect them through clear interfaces, use them to learn deeply, and preserve enough context that the next agent can continue instead of starting over.


---

# Appendix — Database catalog

> Reference catalog preserved from the supplied DeepSeek additions; optional learning exposure, not installed tools or execution permission. Core AGENT_INSTRUCTIONS.md governs all actions. Verify current compatibility, licensing, security, costs, and official documentation before adoption.

## C. Database Diversity Lab (Maximize Exposure)

Goal: gain real fluency across relational, document, key-value, columnar,
graph, time-series, search, vector, embedded, and analytical databases — each
used for at least one real vertical slice, not just a tutorial.

| Category | Primary pick | Alternatives | Why it matters |
| --- | --- | --- | --- |
| Relational OLTP | PostgreSQL | MySQL/MariaDB, SQL Server, CockroachDB | schema, transactions, constraints |
| Embedded relational | SQLite | DuckDB (analytics), libSQL | local-first, zero-admin |
| Analytical / OLAP | DuckDB | ClickHouse, Apache Druid, Snowflake concepts | columnar scans, aggregation |
| Document | MongoDB | CouchDB, Firestore concepts | flexible schemas, nesting |
| Key-value | Redis | Valkey, Memcached, etcd | caching, sessions, locks |
| Wide-column | Cassandra | ScyllaDB, HBase concepts | distributed writes at scale |
| Graph | Neo4j | Memgraph, ArangoDB, Amazon Neptune concepts | relationships, traversals |
| Time-series | TimescaleDB | InfluxDB, QuestDB, Prometheus TSDB | metrics, IoT, finance ticks |
| Search | Meilisearch | Typesense, OpenSearch, Elasticsearch | full-text, faceting, relevance |
| Vector | pgvector | Qdrant, Weaviate, Chroma, Milvus | embeddings, RAG, similarity |
| Object storage | MinIO | S3, Backblaze B2 concepts | blobs, datasets, model artifacts |
| Dataframe/file | Parquet + Arrow | ORC, Avro, CSV | columnar interchange |
| Streaming/queue | Redis Streams | Kafka, NATS, RabbitMQ | events, pipelines |
| Embedded KV | LMDB | RocksDB, LevelDB | local fast storage |
| RDF/triple store | Apache Jena | GraphDB, Blazegraph concepts | knowledge graphs, ontologies |

Rules:
- One DB per real project slice, not fifteen at once.
- Always record: version, driver, migration tool, backup strategy, license.
- Always contrast with PostgreSQL: "why would I choose this over Postgres?"
- Never store money in floats. Never store timestamps without timezone intent.
- Add a `decisions/ADR-####-<db-choice>.md` when a new DB is adopted.


---

# Appendix — Language catalog

> Reference catalog preserved from the supplied DeepSeek additions; optional learning exposure, not installed tools or execution permission. Core AGENT_INSTRUCTIONS.md governs all actions. Verify current compatibility, licensing, security, costs, and official documentation before adoption.

## D. Language Diversity Lab (Maximize Exposure)

Each language must own at least one real, independently runnable service or tool
that exposes a stable interface (CLI, REST, or library). No language is added
just to "have it" — it must teach a distinct paradigm or runtime.

| Language | Domain / Project | Concepts it teaches |
| --- | --- | --- |
| Python | data, ML, FastAPI, scripts | rapid prototyping, ecosystem |
| TypeScript | React hub, Node tools | types on JS, async, UI |
| JavaScript | browser fundamentals, Node | event loop, DOM, bundlers |
| Go | Language Lab, APIs | concurrency, static typing, deploy |
| Rust | systems service, CLI | ownership, safety, performance |
| Java | enterprise API, LanguageTool | JVM, OOP, build tools (Maven/Gradle) |
| Kotlin | JVM/Android, backend alt | modern JVM, coroutines |
| C# | Unity, .NET APIs | OOP, game scripting, ASP.NET |
| C | emulation, low-level | memory, pointers, ABI |
| C++ | emulation, engines, performance | RAII, templates, STL |
| Zig | systems alt to C | comptime, manual memory |
| Elixir | concurrent services | BEAM, actors, fault tolerance |
| Erlang | distributed systems study | OTP, supervision |
| Haskell | pure FP, math | types, laziness, category theory |
| OCaml | FP + systems | modules, functors |
| F# | data/FP on .NET | pipelines, type providers |
| Scala | big data, FP+OOP | Akka, Spark, type system |
| Clojure | Lisp on JVM | immutability, REPL-driven |
| R | statistics, reporting | vectors, tidyverse, ggplot |
| Julia | scientific computing | speed, multiple dispatch |
| MATLAB/Octave | engineering math | matrices, control systems |
| SQL | all data | declarative query, plans |
| Bash | automation | pipes, processes |
| PowerShell | Windows automation | objects, .NET interop |
| Lua | embedding, game scripting | small, fast, host-embeddable |
| GDScript | Godot | game logic, signals |
| Solidity | smart contracts | EVM, gas, security |
| Vyper | smart contracts alt | Pythonic EVM |
| Move | Sui/Aptos | resource-oriented safety |
| Cairo | StarkNet | zk-friendly contracts |
| Assembly (x86/ARM) | reverse eng., emulation | registers, syscalls |
| WebAssembly (WAT) | browser/native runtime | portable sandbox |
| Nim | systems + Pythonic | metaprogramming |
| Crystal | Ruby-like, compiled | performance + syntax |
| Dart | Flutter apps | UI + async |
| Swift | Apple platforms | optionals, SwiftUI |
| Objective-C | legacy Apple | runtime, message passing |
| Racket | Lisp/Scheme study | macros, teaching languages |
| Prolog | logic programming | unification, backtracking |
| Forth | stack machines | minimalism, embedded |
| APL/J | array programming | tacit, math density |
| Verilog/VHDL | hardware design | digital logic, FPGAs |
| COBOL | legacy enterprise | mainframe, batch |
| Fortran | HPC, numerics | arrays, scientific computing |
| Ada | safety-critical | strong typing, contracts |

Rules:
- Every language gets a `language-lab/<lang>/` folder with README, run command, and one real demo.
- Each must eventually expose `/health` and `/version` if it runs as a service.
- Compare concepts across languages explicitly (e.g., error handling: Go vs Rust vs Python).
- Do not reimplement every project in every language. One meaningful slice each.


---

# Appendix — Engineering additions

# Additional learning depth

All items are proposed exposure unless an active handoff records adoption. No artificial ceiling on languages, databases, software, extensions, workflows, or advanced topics. A comparison lab is a legitimate reason to learn something; it need not solve a production problem. Sequence the work without deleting the backlog.

## Language and database catalog clarifications

- Add PHP explicitly: CLI fundamentals, Composer/autoloading, types, HTTP lifecycle, PDO/prepared statements, tests, and later Laravel or Symfony comparisons. Preserve Java for F1's intended primary role; Go, Rust, PHP, and Swift are explicit learning interests, not optional omissions. Swift platform tooling must be checked against available hardware; do not assume a Windows machine can build every Apple target.
- Language Lab (the Go grammar application) is not the same thing as a multi-language comparison lab. Keep their names and handoffs distinct.
- Standalone programs, libraries, notebooks, and low-level exercises are valid language artifacts. Do not add HTTP servers to everything merely for `/health` and `/version`; those conventions apply to services.
- R/Pandas are analysis tools; Arrow/Parquet are memory/interchange/file technologies; object stores and queues are adjacent infrastructure, not interchangeable database categories. Redis, etcd, and Memcached have different roles; do not treat catalog neighbors as drop-in replacements.
- Compare data stores on access patterns, consistency, transactions, durability, indexing, query plans, failure behavior, restore procedure, operational burden, and cost—not only syntax. Include PostGIS for geospatial exposure and change-data-capture/warehouse comparisons when relevant.
- Use appropriate decimal precision/scale and rounding policies for money; token amounts may need large exact integers and asset-specific decimals. Timestamp choices must distinguish an instant from local calendar dates and scheduled wall-clock times.

## Practical computer-science and interview labs

Build small programs around arrays, linked lists, stacks/queues, hash maps, heaps, trees, tries, graphs, union-find, and caches. For each: define invariants; trace operations manually; implement a small real use case; test edge cases; analyze time/space costs; compare a standard-library implementation; solve a related interview exercise. Examples: undo history, task queue, LRU cache, autocomplete, dependency ordering, route search, and event scheduling. Do not assume these are already implemented.

Study algorithms alongside memory layout, pointers/references, stack/heap, processes/threads, concurrency, race conditions, synchronization, OS scheduling, filesystems, sockets, compiler/linker stages, ABIs, and basic assembly. Connect toy OS and low-level labs when relevant without turning every API lesson into systems work.

## Professional engineering depth

- Requirements: user stories, acceptance criteria, nonfunctional requirements, domain boundaries, invariants, lightweight RFCs, ADRs, and explicit tradeoffs.
- Design: dependency inversion, cohesion/coupling, modular monoliths, ports/adapters, schema evolution, backward compatibility, API contracts, pagination, idempotency, outbox/inbox patterns, retries with bounds/jitter, deadlines, cancellation, and backpressure.
- Reliability: capacity estimates, latency percentiles, load versus stress/soak tests, SLIs/SLOs, error budgets, restore drills, recovery-time/recovery-point objectives, rollback rehearsal, and blameless incident notes.
- Testing: unit/integration/contract/e2e, property-based and mutation testing, fuzzing, deterministic fixtures, time control, reproducible seeds, flaky-test diagnosis, and failure injection in isolated labs.
- Delivery: reproducible builds, lockfiles, dependency review, SBOM/provenance/signing concepts, feature flags, release notes, migration compatibility, and staged rollout comparisons. Preserve each repo's branching convention; compare trunk-based development in a lab rather than replacing it silently.
- Security: threat modeling, trust boundaries, least privilege, secret rotation, authentication/session design, authorization tests, input validation, dependency scanning, privacy, and authorized lab-only offensive practice.
- Developer tools: Vim/Neovim navigation, LSP, debugger/DAP concepts, test explorers, semantic refactoring, workspace tasks, Git diff/history, terminals/tmux, CLI help/man pages, and API/schema exploration. Avoid competing formatters and record extension roles.

## Debugging as library exploration

Teach breakpoints, step in/over/out, call stack, watch expressions, conditional breakpoints, exception stops, variable scope, and debug console inspection. Explain runtime values versus signature/type hints and positional versus keyword arguments. With NumPy, inspect shape, dtype, ndim, size, strides, views/copies, and broadcasting before changing code. `dir`, `help`, signatures, docs, and small experiments reveal capabilities; evaluating a function/property in a debugger may execute code or mutate state, so permission and side effects still matter.

## Math and ML additions

Preserve Algebra 1 → Algebra 2 → geometry/trig → precalculus foundations. Add proof-writing, numerical stability/conditioning, floating-point error, approximation, experimental design, causal inference, time-series validation, calibration, and reproducibility as prerequisites permit. Pair manual derivation with symbolic, graphical, numerical, and code checks. Include Pint for units and Wolfram as a comparison/checking tool, not an answer substitute. Advanced university-course names in the imported catalog are orientation, not a verified equivalence to a degree or a current syllabus.

## Adoption record

For any proposed tool: purpose, learning question, alternatives, chosen slice, prerequisites, version/source checked date, license/cost/resource needs, installation plan, testing/debugging plan, backup/removal plan, and status (proposed/accepted/installed/used/verified). Record evidence separately from ambition. Certification names in the catalog require current verification before paying or planning an exam.


---

# Appendix — Math/ML

> Reference catalog preserved from the supplied DeepSeek additions; optional learning exposure, not installed tools or execution permission. Core AGENT_INSTRUCTIONS.md governs all actions. Verify current compatibility, licensing, security, costs, and official documentation before adoption.

## E. Top-College Math Track for ML (Additive to `mathy`)

Mirror the sequence used by strong CS/ML programs (MIT 18.01/18.02/18.06, Stanford
CS229 math prep, Princeton/MIT discrete math, Berkeley CS189 prereqs).

### E.1 Foundations
- Logic, proofs, sets, functions, relations
- Induction, contradiction, pigeonhole
- Combinatorics: permutations, combinations, generating functions
- Graph theory: trees, connectivity, coloring, flows
- Number theory: modular arithmetic, primes, RSA intuition
- Probability axioms, conditional probability, Bayes

### E.2 Single-variable calculus
- Limits, continuity, derivatives, chain rule
- Taylor series, convexity, optimization
- Integration, FTC, substitution, parts
- Sequences, series, convergence

### E.3 Multivariable calculus
- Partial derivatives, gradients, Jacobians, Hessians
- Multiple integrals, change of variables
- Lagrange multipliers, constrained optimization
- Vector fields, divergence, curl, Stokes/Green/Gauss

### E.4 Linear algebra (the ML backbone)
- Vector spaces, bases, rank, nullspace
- Matrix operations, inverses, determinants
- Eigenvalues/eigenvectors, diagonalization
- SVD, pseudoinverse, low-rank approximation
- Positive definiteness, quadratic forms
- Norms, inner products, projections, least squares
- PCA, whitening, matrix calculus

### E.5 Probability & statistics
- Random variables, distributions (Bernoulli → Dirichlet)
- Expectation, variance, covariance, correlation
- MLE, MAP, Bayesian inference
- Hypothesis testing, confidence intervals
- Concentration inequalities (Markov, Chebyshev, Hoeffding)
- Bootstrapping, Monte Carlo, MCMC
- Information theory: entropy, KL, mutual information

### E.6 Optimization
- Convex sets and functions
- Gradient descent, SGD, momentum, Adam
- Newton, quasi-Newton, L-BFGS
- Duality, KKT conditions
- Subgradients, proximal methods
- Constrained and stochastic optimization

### E.7 Discrete math & algorithms
- Big-O, recurrences, master theorem
- Sorting, searching, hashing, graphs
- Dynamic programming, greedy, divide & conquer
- NP-completeness, approximation
- Randomized algorithms

### E.8 Advanced ML math
- Reproducing kernel Hilbert spaces
- Bias-variance, VC dimension, PAC learning
- Regularization: L1, L2, dropout, early stopping
- Variational inference, ELBO
- Graphical models, belief propagation
- Differential geometry basics for manifolds
- Topology basics (persistent homology, TDA)
- Measure theory (light) for rigorous probability

### E.9 Applied to the ecosystem
- Marketplace: regression, forecasting, anomaly detection
- Chess: Elo, evaluation distributions, clustering
- Sports: expected value, time series, hierarchical models
- Language: embeddings, attention math, perplexity
- Web3: cryptography, game theory, mechanism design
- Games: vectors, quaternions, physics, procedural noise

### E.10 Tooling
- Python: NumPy, SciPy, SymPy, Matplotlib, Pandas, PyTorch, JAX
- R: tidyverse, ggplot2, brms, rstan
- Julia: DifferentialEquations.jl, Flux.jl
- Notebooks: JupyterLab, Quarto, Observable
- Visualization: Desmos, GeoGebra, Manim, D3
- Proof: Lean 4, Coq, Isabelle (later)


---

# Appendix — IT/career/SWE

> Reference catalog preserved from the supplied DeepSeek additions; optional learning exposure, not installed tools or execution permission. Core AGENT_INSTRUCTIONS.md governs all actions. Verify current compatibility, licensing, security, costs, and official documentation before adoption.

## G. IT Career & Professional SWE Workflow Track

### G.1 IT foundations
- Networking: OSI/TCP-IP, DNS, DHCP, subnets, VLANs, NAT, firewalls
- Linux admin: users, permissions, systemd, journald, cron, SSH, tmux
- Windows admin: AD, GPO, PowerShell, WSL, event logs
- Virtualization: Proxmox, Hyper-V, VMware, KVM
- Storage: RAID, ZFS, NAS, backups, 3-2-1 rule
- Cloud: AWS/GCP/Azure core services, IAM, networking, cost
- Containers: Docker, Compose, Podman, registries
- Orchestration: Kubernetes basics (later), Nomad concepts
- IaC: Terraform, Ansible, Pulumi
- Monitoring: Prometheus, Grafana, Loki, Uptime Kuma
- Security: hardening, CVEs, least privilege, secrets management

### G.2 Certifications to consider (study, not collect)
- CompTIA A+, Network+, Security+, Linux+
- CCNA (networking)
- AWS SAA / Azure AZ-104 / GCP ACE
- RHCSA (Linux)
- CKA (Kubernetes)
- OSCP / PNPT (security, later)
- HashiCorp Terraform Associate

### G.3 Top-tier SWE practices
- Git flow, trunk-based, feature flags
- Code review culture, small PRs, conventional commits
- Testing pyramid: unit, integration, contract, e2e
- TDD, BDD, property-based testing, fuzzing
- CI/CD: GitHub Actions, GitLab CI, Woodpecker
- Static analysis: linters, type checkers, SAST
- Supply chain: SBOM, Dependabot, Renovate, Sigstore
- Observability: logs, metrics, traces, OpenTelemetry, SLOs
- Incident response: runbooks, postmortems
- Documentation: ADRs, RFCs, runbooks, READMEs, docs-as-code
- Architecture: modular monolith → services → events when justified
- Performance: profiling, load testing (k6, Locust), flame graphs
- Accessibility: WCAG, semantic HTML, keyboard nav
- Security: OWASP Top 10, threat modeling, secure defaults
- Data: schema design, migrations, backups, PITR
- APIs: REST, OpenAPI, GraphQL, gRPC, versioning, pagination

### G.4 System design interview prep
- Load balancers, caching, CDNs
- Sharding, replication, consistency models
- Queues, streams, backpressure
- CAP, PACELC, idempotency
- Rate limiting, circuit breakers, retries
- Case studies: URL shortener, chat, feed, marketplace, payments

### G.5 Career artifacts
- Portfolio repos with READMEs, screenshots, architecture diagrams
- Personal site / blog
- Resume variants per role (SWE, data, infra, security)
- Interview prep log
- Networking: local meetups, open source, conferences

### G.6 Daily/weekly workflow
- Morning: review issues, plan one vertical slice
- Code: small commits, run tests, format, lint
- Evening: update handoff, log session, commit docs
- Weekly: review ADRs, update roadmap, prune backlog


---

# Appendix — Project handoff template

# Project handoff — NAME

- Updated/date and source of evidence:
- Status: confirmed / planned / proposed / unknown
- Active goal and learning concept:
- Authorized execution scope (default: none):
- Documentation exception: factual recordkeeping only
- Repository, machine, OS/shell, root, branch, commit:
- Working tree / pushed / other-machine verification:

## Current state and last completed step

## Actual structure map

Record existing relative paths, their purpose, and ownership. Mark unverified paths. This is a map, not permission to create/move application folders. Creating the dedicated agent-workflow documentation folder and documentation-only subdivisions is explicitly permitted by Part I.

## Architecture and data flow

## Languages, tools, databases, versions and configuration references

No secrets. Separate installed from proposed and local from remote.

## Commands for the user / authorized commands actually run

Keep these separate. Include location, purpose, expected output, actual output summary, date, and remaining uncertainty.

## Tests and results

Passed / failed / not run, with evidence. Never infer completion from a plan.

## Accepted decisions, alternatives, and superseded history

## Blockers and unfinished changes

## Exact next guided step

## Cross-machine resume notes

## Relevant optional track links

Include creative context only when it affects this project's implementation.


---

# Appendix — Session log template

# Session — YYYY-MM-DD — title

- Project / machine / shell / root / branch / commit:
- Goal and authorized scope:
- Starting state and evidence:
- User actions actually completed:
- Agent actions actually completed:
- Files changed, including documentation:
- Commands proposed but NOT run:
- Verification actually performed and results:
- Concepts learned / misconceptions clarified:
- Accepted decisions / proposed ideas:
- Blockers and unknowns:
- Commit/push/sync status (unknown if not observed):
- Exact next guided action:


---

# Appendix — ADR template

# ADR-<next-unused-id>: Title

- Date:
- Status: proposed / accepted / superseded
- User approval/evidence:

## Context and learning objective

## Decision

## Alternatives and tradeoffs

## Consequences, cost, security and operational burden

## Validation plan and actual result

## Related records / supersedes

Preserve old decisions; do not renumber them or mark proposed choices accepted automatically.


---

# Appendix — New language checklist

> Reference catalog preserved from the supplied DeepSeek additions; optional learning exposure, not installed tools or execution permission. Core AGENT_INSTRUCTIONS.md governs all actions. Verify current compatibility, licensing, security, costs, and official documentation before adoption.

# Checklist: Adopting a New Language

- [ ] Chosen domain and one real project slice defined
- [ ] `language-lab/<lang>/` folder created
- [ ] README with run instructions
- [ ] Version recorded
- [ ] Package manager and lockfile chosen
- [ ] Formatter chosen
- [ ] Linter chosen
- [ ] Test framework chosen
- [ ] `/health` and `/version` endpoints if service
- [ ] `.gitignore` and `.editorconfig` updated
- [ ] CI job added (lint, test, build)
- [ ] ADR written
- [ ] Comparison notes vs a language already known
- [ ] Handoff updated


---

# Appendix — New database checklist

> Reference catalog preserved from the supplied DeepSeek additions; optional learning exposure, not installed tools or execution permission. Core AGENT_INSTRUCTIONS.md governs all actions. Verify current compatibility, licensing, security, costs, and official documentation before adoption.

# Checklist: Adopting a New Database

- [ ] Category (relational, document, KV, graph, TS, search, vector, OLAP)
- [ ] Why this over PostgreSQL for this use case
- [ ] Version pinned
- [ ] Driver chosen
- [ ] Migration tool chosen
- [ ] Backup/restore strategy documented
- [ ] License reviewed
- [ ] Local dev setup (Docker or native)
- [ ] Connection string in `.env.example`
- [ ] Seed data script
- [ ] Test strategy (ephemeral container or fixture)
- [ ] Monitoring/health check
- [ ] ADR written
- [ ] Handoff updated


---

# Appendix — Pre-commit checklist

# Pre-commit review

This is a checklist for user execution or explicitly authorized work, not permission to run commands.

- [ ] Confirm repository, machine, branch, and actual working-tree state.
- [ ] Review intended diff and preserve unrelated/untracked work.
- [ ] Check secrets, private data, generated files, and large assets.
- [ ] Record formatter/linter/type/test/build results, including checks not run.
- [ ] Review migration and API compatibility when applicable.
- [ ] Update factual handoff, decisions, and sync notes.
- [ ] Explain exact files to stage and proposed commit message.
- [ ] Commit or push only when explicitly authorized; record each separately.


---

# Appendix — Pull-request checklist

# Pull-request review

- [ ] Scope, learning goal, acceptance criteria, and linked issue are clear.
- [ ] Changes are explained with architectural and data-flow implications.
- [ ] Tests and actual results are recorded; missing checks are explicit.
- [ ] Security, privacy, accessibility, performance, and compatibility considered as relevant.
- [ ] Migration, rollout, rollback, and restore implications documented.
- [ ] Documentation and cross-machine resume notes current.
- [ ] Unrelated edits excluded and reviewer questions captured.
- [ ] Creating/updating/publishing a PR requires explicit permission; a checklist is not authorization.


# Appendix — Multi-computer continuity

Record machine label, OS/shell, repo root, branch, observed commit, dirty/untracked state, environment manager/lockfile, service endpoints without secrets, last verification, and next action. Timestamp observations; mark unknown rather than guessing. Distinguish committed, pushed, and verified-on-another-machine.

At arrival, ask the user to inspect status/branch/remotes and read the latest handoff; explain any needed fetch/pull separately. A clean working tree does not prove it matches the remote. Do not automatically pull, stash, reset, clean, switch branches, or overwrite local changes. After authorized fetch, compare histories; fast-forward only when appropriate and authorized. Divergence or local edits require an agreed plan.

At departure, record unfinished files, last actual test results, blockers, and exact next step. Suggest reviewing a diff and making/pushing a checkpoint; do not execute Git under documentation permission. Git does not synchronize ignored/untracked files, virtual environments, installed tools, secrets, database contents, or NAS state. Document how to recreate these separately; never copy credentials into handoffs.
