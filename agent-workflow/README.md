# Agent Workflow Directory

Living project documentation for Blocky. Shared across agents and machines. Do not duplicate this folder per agent.

## Read order (Blocky)

1. Repo-root `CODING_STUDY_GUIDE_HANDOFF.md` — Part I permission boundary + Part II ecosystem context (as needed)
2. `PROJECT_HANDOFF.md` — current objective, verified state, exact next action
3. `PROJECT_BLOCKCHAIN_WEB3.md` — domain curriculum and longer Web3 route
4. `PROJECT_STRUCTURE.md` — map of what exists in this repo (do not reorganize the app to match a template)
5. `sync-notes.md` — machine/branch/pending-change resume notes
6. Standards/checklists below when doing Git, tooling, or PR review

## Structure

```text
agent-workflow/
  README.md
  PROJECT_HANDOFF.md
  PROJECT_BLOCKCHAIN_WEB3.md
  PROJECT_STRUCTURE.md
  TROUBLESHOOTING.md
  BACKLOG.md
  sync-notes.md
  sessions/
  decisions/
  standards/
    GIT_WORKFLOW.md
    TOOLING_AND_ESLINT.md
  checklists/
    PULL_REQUEST_REVIEW.md
  templates/
    PROJECT_HANDOFF_TEMPLATE.md
    SESSION_LOG_TEMPLATE.md
```

## Update conventions

- Documentation exception: agents may create/update files under `agent-workflow/` without re-asking.
- Record verified facts only. Label proposals clearly. Never invent test results.
- Do not change application source/config under this exception. Git sync still needs explicit user permission.
- Prefer updating an existing record over adding a contradictory duplicate.
- Archive provenance for older instruction copies lives under repo-root `oldInstructions/` (review only; not live source of truth).

## Related repo-root files

| Path | Role |
| --- | --- |
| `CODING_STUDY_GUIDE_HANDOFF.md` | Ultimate coding study guide + agent operating rules (2026-09-12) |
| `oldInstructions/` | Archived prior handoffs/runbooks for review |
| `pyproject.toml` | Ruff config |
| `.vscode/settings.json` | Prettier + Ruff format-on-save |
