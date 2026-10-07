# ADR-0001: Feature → dev → main GitHub flow

- Date: 2026-09-09 (recorded 2026-09-12)
- Status: Accepted

## Context

User wants professional GitHub practice on Blocky and across learning projects. Direct commits to `main` mix unfinished work with stable snapshots.

## Decision

Use:

```text
feature/<topic> | docs/<topic> | fix/<topic>  →  PR  →  dev  →  release PR  →  main
```

Documented in `agent-workflow/standards/GIT_WORKFLOW.md`.

## Alternatives considered

- Commit only on `main` — simpler, weaker history/review
- Long-lived personal branches without PRs — loses review trail

## Consequences

- Features land on `dev` first; `main` lags until intentional release
- CI runs on PRs; placeholder Node scripts must not be treated as real gates
- Solo learner may squash-merge noisy commits
