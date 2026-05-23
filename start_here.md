# Start Here: Blockchain Learning Project Playbook

## Purpose
This repository is a professional, end-to-end blockchain learning lab.

You will learn by building production-style components across:
- Cryptography basics
- Solidity smart contracts
- Multi-chain concepts
- DeFi primitives
- NFT systems
- Marketplace architecture
- Multi-learning software system design and analytics

This file is the operating guide for both humans and LLM chats.

## Current Status
- Repository initialized
- Documentation baseline created
- No code yet
- Multi-learning software track approved

## Ground Rules
- Learn by shipping small, testable milestones
- Security first: never optimize before threat-modeling
- Keep each module independent, then integrate
- Prefer explicit design docs over hidden assumptions
- Every feature must include tests, linting, and a short explanation

## Recommended Project Structure
Create this structure first and keep it stable:

- docs/
  - architecture/
  - decisions/
  - runbooks/
- contracts/
  - src/
  - test/
  - script/
- app/
  - web/
  - api/
- protocol-sim/
  - crypto/
  - chain-sim/
- data/
  - sqlite/
  - warehouse/
  - dashboards/
  - subgraph/ (optional later)
- product/
  - figma/
  - research/
  - ux-flows/
- .github/
  - workflows/

## Working Model (Professional Workflow)
1. Open an issue before coding
2. Write or update a mini design note in docs/architecture/
3. Create a branch: feat/<area>-<short-name>
4. Implement with tests and docs in the same PR
5. Run local quality gates
6. Open PR with security and testing checklist
7. Merge only after all checks pass

## Docs-Only Execution Mode (Active)
- Assistant writes and maintains Markdown docs only.
- User executes all commands, setup, coding, deployment, and integrations.
- Execution playbooks live in docs/runbooks/.

## Quality Gates (Must Pass)
- Formatting and lint checks
- Unit tests
- Integration tests where relevant
- Contract static analysis and gas snapshot for contract changes
- Updated docs for behavior changes

## Security Baseline
- Never commit private keys or mnemonics
- Use env files and examples only
- Assume external calls can fail or be malicious
- Use checks-effects-interactions and reentrancy protections
- Add invariants for economic logic
- Treat oracle data as adversarial unless validated

## LLM Collaboration Contract (Important)
Every new chat should follow this order before changing code:
1. Read this file
2. Read explanation.md
3. Read docs/architecture/ and docs/decisions/ if present
4. Summarize current state in 8 to 12 bullet points
5. Propose a plan with milestones and risks
6. Implement only one milestone per PR-sized change

When an LLM finishes a task, it must update:
- docs/runbooks/progress-log.md with what changed
- docs/decisions/ if any architectural choice changed
- tests and usage notes related to the task

## Learning Roadmap (Execution Order)
1. Phase 0: Environment and toolchain foundations
2. Phase 1: Cryptography and blockchain internals simulation
3. Phase 2: Solidity fundamentals and secure patterns
4. Phase 3: ERC-20 and DeFi mini-protocols
5. Phase 4: ERC-721 and ERC-1155 NFT systems
6. Phase 5: Marketplace contracts and off-chain indexing
7. Phase 6: Multi-chain deployment and cross-chain design
8. Phase 7: Learning platform product features (progress tracking, quests, scoring)
9. Phase 8: Data layer and BI analytics (SQLite to warehouse to Tableau)
10. Phase 9: Monitoring, incident response, and audit-style hardening

## First Build Sprint (Do This Next)
1. Initialize monorepo and package manager
2. Add Solidity framework and testing setup
3. Create HelloChain contract with unit tests
4. Build simple local blockchain simulator in TypeScript (block, tx, hash, chain validation)
5. Add CI pipeline for lint + test
6. Add docs/runbooks/progress-log.md
7. Add a learning profile model backed by SQLite (users, lessons, checkpoints)
8. Create the first product UX flow in Figma (onboarding to first contract deployment)

Use these runbooks for execution:
- docs/runbooks/docs-only-mode.md
- docs/runbooks/phase-0-execution-guide.md
- docs/runbooks/phase-1-data-and-analytics-guide.md
- docs/runbooks/phase-1-product-design-guide.md

## Definition Of Done For Any Module
- Clear objective
- Threat model section added
- Tests cover happy paths and failure paths
- Gas/performance note (if contract code)
- User/developer usage example
- Documentation updated

## Priority Backlog (High Value)
- Wallet connection flow (web)
- ERC-20 token with role-based minting and pausing
- Constant product AMM with swap + liquidity tests
- NFT minting with metadata strategy
- Marketplace listing, buying, fee routing, and royalties
- Multi-network deployment scripts
- Learning journey engine (module unlocks, difficulty levels, milestones)
- Event tracking pipeline for learner activity and protocol interactions
- Tableau dashboard for completion rates, error hotspots, and velocity

## How To Use This File In New Chats
Paste this prompt at the start of any new LLM chat:

"Read start_here.md and explanation.md first. Summarize project state, then propose one milestone with implementation steps, threat model, tests, and docs updates. Keep scope PR-sized."

## Non-Goals For Early Phases
- Real-money mainnet deployment
- Complex leverage and derivatives
- Blindly copying protocol code without understanding assumptions

## Success Criteria
After completing the roadmap, you should be able to:
- Design and implement secure smart contracts
- Explain tradeoffs across EVM chains and non-EVM chains
- Build DeFi and NFT primitives with tests
- Ship a simple marketplace end-to-end
- Build and operate a data-informed learning platform around your blockchain curriculum
- Operate with professional engineering and security discipline

## No-Limit Tool Policy
You are not constrained to a small stack. Use the best tool for each layer:
- Product design: Figma, FigJam
- Databases: SQLite first, then Postgres if needed
- Analytics and BI: Tableau, Metabase, or Power BI
- Observability: OpenTelemetry, Grafana
- Collaboration: GitHub Projects, ADRs, issue templates

Rule: justify each tool choice with scope, cost, and maintenance tradeoffs.
