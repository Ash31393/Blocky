# Pull Request and Code Review Checklist

## Author self-review

- Confirm the branch targets `dev` for feature/fix work or `main` only for a reviewed release PR from `dev`.
- Read the entire diff once in GitHub and/or GitLens.
- Remove debugging leftovers, unrelated formatting churn, dead code, secrets, generated artifacts, and accidental large files.
- Run formatter check, linter, type checker, tests, and build applicable to the repo.
- Test the user-visible path and at least one failure path.
- Update README, architecture/ADR, API/schema docs, and project handoff when needed.
- Explain risks, limitations, migrations, screenshots, and verification in the PR body.

## Reviewer pass

Review in this order:

1. Correctness and acceptance criteria
2. Security, privacy, permissions, and secrets
3. Data integrity, migrations, time/money semantics, and failure handling
4. Architecture boundaries and maintainability
5. Tests and observability
6. Naming, clarity, documentation, and style

Classify comments as blocking, suggestion, question, or praise/learning note. Explain why a change matters; do not only prescribe syntax.

## After merge

- Pull the target branch and verify the merge/CI result.
- Delete the merged feature branch when safe.
- Record the milestone and exact next action in the project handoff.
- For a `dev` to `main` release, perform a smoke test and record the released commit/tag when used.
