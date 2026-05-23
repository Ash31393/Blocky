# Multi-Learning Software Blueprint

## Objective
Build a software platform around the blockchain curriculum that supports guided learning, evaluation, and analytics.

## System Components
- app/web
  - Learner UI for lessons, tasks, wallet interactions, and progress
- app/api
  - Lesson orchestration, scoring, and progress persistence
- contracts
  - Smart contracts used in exercises and product modules
- protocol-sim
  - Local simulation exercises for blockchain internals
- data/sqlite
  - Source of truth for learner progress in early phases
- data/dashboards
  - BI assets and dashboard specs
- product/figma
  - UX wireframes, component states, and flow documentation

## Learning Domain Model
- Track: A large topic area (Crypto, Solidity, DeFi, NFT, Marketplace, Multi-chain)
- Module: Group of lessons with a skill objective
- Lesson: One guided build step
- Checkpoint: A measurable validation event
- Submission: Learner attempt and result
- Badge: Milestone completion marker

## Execution Flow
1. Learner starts a lesson
2. System presents objective and success criteria
3. Learner submits code or runs local checks
4. Auto-checkers evaluate tests/lint/security gates
5. Score and feedback recorded in SQLite
6. Dashboard metrics update from events

## Scoring Model (Initial)
- Pass/fail gate for required checkpoints
- Weighted score for optional advanced checkpoints
- Suggested formula:
  score = sum(pass_i * weight_i) / sum(weight_i)

## Tooling Policy
Use any tool that improves outcome quality:
- Design: Figma, FigJam
- Data: SQLite, Postgres, DuckDB
- BI: Tableau, Metabase, Power BI
- Tracking: OpenTelemetry, custom events
- Delivery: GitHub Actions, conventional PR reviews

## Security + Privacy Notes
- Never collect sensitive personal data in learner tables
- Hash or pseudonymize identifiers if analytics are shared
- Keep secrets out of repo; use env files and secret managers
- Log only what is needed for debugging and learning analytics

## Phase Plan
- Phase A: Schema + progress API + one dashboard
- Phase B: Quest engine + adaptive module unlocks
- Phase C: Advanced analytics and cohort insights
- Phase D: Multi-user and role-based views

## Definition Of Done For Blueprint Changes
- Architectural change documented
- Data model impact listed
- Security/privacy impact listed
- Migration strategy listed if schema changed
