# Agent Workflow Directory

This directory holds reusable process documents. It prevents the master handoff and project handoffs from becoming procedural dumping grounds.

## Read order

1. `../AGENT_INSTRUCTIONS.md`
2. `../AGENT_HANDOFF.md` when ecosystem context matters
3. the relevant `../project-handoffs/PROJECT_*.md`
4. the applicable standard or checklist here

## Structure

```text
agent-workflow/
  README.md
  standards/
    GIT_WORKFLOW.md
    TOOLING_AND_ESLINT.md
  checklists/
    PULL_REQUEST_REVIEW.md
  templates/
    PROJECT_HANDOFF_TEMPLATE.md
    SESSION_LOG_TEMPLATE.md
```

Keep durable facts in project handoffs, universal behavior in agent instructions, ecosystem relationships in the master handoff, repeatable processes in standards/checklists, and fill-in structures in templates.

Do not create a new agent file when an existing category can be updated. Archive or consolidate stale duplicates rather than letting contradictory instructions accumulate.
