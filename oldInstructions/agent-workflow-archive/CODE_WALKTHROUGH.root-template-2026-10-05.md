# Code Walkthrough

Status: Template — no project code has been inspected or explained yet.  
Location: `agent-workflow/CODE_WALKTHROUGH.md`.  
Companion: `agent-workflow/AGENT_HANDOFF.md`.

## Agent responsibility

The teaching agent must populate and maintain this file inside `agent-workflow/`. The user types or pastes application code and runs commands. The agent does not edit any files outside `agent-workflow/` or execute application commands without explicit authorization for those actions.

Explain taught code line by line and update explanations after user edits. Label proposed code as proposed/not yet applied. Confirm actual code through read-only inspection or user confirmation; record test/build results only from evidence. Never modify source to match this document.

## Coverage index

Replace the example row below. Add every source, test, SQL, script, and hand-written configuration file introduced or materially changed by the milestone. Identify generated and unchanged files excluded from exhaustive coverage.

| File | Snapshot | Coverage | Explanation section | Status |
| --- | --- | --- | --- | --- |
| `<repo-relative path>` | `<date; commit or uncommitted state>` | `<complete file or current line ranges>` | `<section link>` | Pending |

Keep the detailed explanations in this single file, organized by source file. Use section links for navigation. Do not leave the template marked complete.

## Feature and runtime overview

Describe the proposed or user-confirmed behavior, labeling its state,, where each part executes, the entry point, external dependencies, and the data flow. Give one concrete example input and its actual expected output. Distinguish expected behavior from behavior verified by execution.

## File: `<repo-relative path>`

### Purpose and snapshot

- Language:
- Role:
- Source date / commit / working-tree state:
- Applied status and evidence:
- Coverage:
- Called by / calls:
- Related tests:

### Exact source excerpt

Paste the exact proposed or confirmed source here, labeling which it is in a language-tagged code fence. Keep executable code free of added line-number prefixes. Put line numbers in the table below. Escape pipes and backticks correctly when necessary for Markdown tables.

### Line-by-line explanation

| Current source line | Exact code | Explanation |
| --- | --- | --- |
| `<line>` | `<exact source>` | Explain syntax, values, purpose, runtime effect, and relevant errors. |

Account for every included nonblank line, including imports, comments, and delimiters. Group only clearly identified repeated structural lines or blank spacing. Explain unchanged context if it is necessary to understand the modified section. Use prose for explanations that are too long for a table.

### What names and references point to

For every introduced or unfamiliar reference, identify its origin and meaning. Include function definitions, imported symbols, object attributes, type names, constants, routes, environment variables, database objects, and file paths as applicable.

| Reference | Defined or supplied by | What it refers to | How this code uses it |
| --- | --- | --- | --- |
| `<name>` | `<project file/function, library/module, runtime, environment, or provider>` | `<specific object, value, behavior, or resource>` | `<role in the current feature>` |

Explain scope and lifetime, units and types, and how a caller reaches the referenced definition when relevant. Distinguish actual source code from conceptual illustrations.

### Concrete execution trace

1. Identify a specific input and entry point.
2. Follow values through functions, conditions, loops, requests, and storage.
3. Show the resulting output and side effects.
4. Explain an important failure path and how the code handles it.

### Why this design

Explain the chosen approach, an appropriate alternative, the tradeoff, language rules versus conventions, and common mistakes. Add comparisons to familiar languages only when they clarify the current code.

### Verification

| Command or test | What it establishes | Actual result |
| --- | --- | --- |
| `<command>` | `<behavior or property>` | `<passed, failed, not run, or blocked; reason>` |

## Guided lesson steps

For each step, give the goal, exact file and edit location, copyable code/command, line-by-line explanation, expected result, verification command for the user, and the output needed before proceeding. Identify shell, machine, directory, and branch. Teach in small coherent sections.

## Commands and configuration

Explain introduced commands and configuration line by line. Identify shell, machine/container, working directory, arguments, flags, variables, quoting, ports, volumes, dependencies, and expected results where applicable. Never include secrets.

## Glossary and learning notes

Define new terms in the context of this implementation. Suggest an optional small exercise without making it a prerequisite for completing the requested work.

## Synchronization checklist

- [ ] Excerpts match proposed code or confirmed source, with state labeled.
- [ ] Line numbers checked against current source where available; unverified references labeled.
- [ ] Every included nonblank line accounted for.
- [ ] Removed code has no stale explanation.
- [ ] Coverage index updated and exclusions stated.
- [ ] User-provided or inspected verification evidence distinguished from expected behavior.
- [ ] Project handoff links to this walkthrough.
