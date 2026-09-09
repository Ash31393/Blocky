# Tooling, ESLint, and Folder-Structure Standard

## Quality-tool roles

| Concern | Typical tool |
| --- | --- |
| JavaScript/TypeScript code quality | ESLint |
| Formatting | Prettier |
| Type correctness | TypeScript compiler |
| Unit/component tests | Vitest/Jest |
| Browser workflow tests | Playwright |
| Markdown | markdownlint |
| Python lint/format | Ruff |
| Python types | Pyright or mypy |

Verify framework versions and official setup before installing. Avoid obsolete ESLint configuration tutorials and duplicated formatting rules.

## Recommended JS/TS scripts

```json
{
  "scripts": {
    "lint": "eslint .",
    "lint:fix": "eslint . --fix",
    "format": "prettier . --write",
    "format:check": "prettier . --check",
    "typecheck": "tsc --noEmit",
    "test": "vitest run",
    "build": "vite build"
  }
}
```

These are examples, not commands to paste blindly. Match the actual framework, dependencies, and project goals. A script must fail when its real check fails; placeholder scripts do not count as CI.

## Folder structures

Choose structure based on scale:

- Small learning slice: keep files close and obvious.
- Growing UI: group by feature, with shared UI/utilities separated only when truly reused.
- Backend service: separate transport/API, domain/service logic, persistence adapters, configuration, and tests when those boundaries exist.
- Data/ML: separate raw/normalized/curated data, ingestion, transforms, features, models, reports, and tests; do not commit large/private datasets.
- Systems labs: organize numbered experiments with a README, source, build/run commands, expected output, and learning log.

Before restructuring, map current imports and runtime entry points, propose the target tree, move one coherent slice, run checks, and commit separately from behavior changes.

## IDE comparison rule

Use Cursor for agent-guided continuity, then schedule focused comparisons when useful: WebStorm for React/TypeScript, PyCharm for Python/data, CLion for C/C++, DataGrip for databases, Rider for .NET/Unity, and IntelliJ IDEA for Java. Compare navigation, refactoring, debugger, test runner, database integration, and Git/PR experience using the same real project.
