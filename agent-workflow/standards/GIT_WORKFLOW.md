# Git and GitHub Workflow Standard

## Default branch flow

```text
feature/<topic> or fix/<topic> -> PR -> dev -> release PR -> main
```

- `main`: stable, reviewed, tested, demonstrable releases.
- `dev`: integration branch for completed work awaiting a release.
- `feature/<topic>`: one bounded capability.
- `fix/<topic>`: one bounded defect correction.
- `docs/<topic>`: substantial documentation-only work.
- `chore/<topic>`: tooling, dependency, or maintenance work.

## Start work

```bash
git status
git fetch --prune origin
git switch dev
git pull --ff-only origin dev
git switch -c feature/short-description
```

Explain that `fetch` updates remote-tracking information, `--prune` removes stale remote references, `switch` changes/creates branches, and `--ff-only` refuses an implicit merge commit.

If `dev` does not exist, create it deliberately from the stable `main`, push it, and record the repository decision. Never assume the correct base when history disagrees.

## During work

- Inspect `git diff` and `git diff --staged`.
- Commit coherent checkpoints using meaningful messages, preferably Conventional Commit style.
- Rebase or merge the updated `dev` only after teaching the difference and checking the repository policy.
- Never force-push a shared branch without explicit discussion.

## Feature PR into dev

The PR must state purpose, important changes, how it was tested, screenshots/data migrations/API changes where relevant, known limitations, and handoff/documentation changes.

Preferred solo-learning merge: squash merge when intermediate commits are noisy; regular merge when commit history is deliberately instructional. Choose per repository and document it.

## Release PR from dev into main

Run the complete quality suite, review the accumulated diff, verify migrations and secrets handling, update documentation/changelog when relevant, and smoke-test the demonstrable behavior. Tag releases after the project has meaningful release boundaries.

## Progressive professional additions

Introduce these as the repositories mature:

1. PR template and issue templates
2. protected `main` and then protected `dev`
3. required CI status checks
4. CODEOWNERS when collaborators exist
5. Dependabot/Renovate and security scanning
6. release tags and generated release notes
7. deployment environments and approval gates

Branch protection can block a solo learner if enabled too early. Explain the benefit and confirm the checks work before requiring them.
