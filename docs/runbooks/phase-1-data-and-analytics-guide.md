# Blocky Master Project Snapshot (Condensed)

## Purpose
This repository is a build-to-learn blockchain engineering lab plus a learning-platform layer.

You are building two tracks together:
- blockchain engineering: protocol simulation, Solidity, DeFi/NFT/marketplace, multi-chain
- learning software: learner progress data model, scoring, and BI analytics

## Working Mode
- docs-only mode is active
- assistant writes guidance docs
- you run commands, tooling, coding, Tableau, and integrations

## Current Status Summary
- project folder structure is in place for contracts, app, protocol simulation, data, and product
- CI baseline exists in GitHub workflows
- SQLite database exists at data/sqlite/learning.db
- core schema exists: users, modules, lessons, checkpoints, submissions, events
- seed baseline exists: 1 user, 2 modules, 4 lessons, 8 checkpoints
- analytics views exist: v_completion_funnel and v_error_hotspots
- Tableau is connected to learning.db and both views are visible
- you are currently at the Tableau chart-building stage

## What You Have Completed
- environment baseline setup was documented and executed with Windows fallbacks
- Python launcher path works and SQLite fallback via Python is documented
- schema and views were created for BI reporting
- initial Tableau worksheets were started for completion and fail analysis

## What Is Blocking Clear Insights Right Now
- submissions and events are still near-empty
- with low attempts, v_error_hotspots can appear sparse or blank
- Tableau charts are structurally correct but insight quality depends on richer sample attempts

## Immediate Next Steps (Tableau Phase)
1. Add realistic attempts to submissions (both pass and fail) across quiz, coding, and case-study checks.
2. Refresh Tableau extracts/live connection.
3. Finalize two visuals:
- completion by module/topic from v_completion_funnel
- fail hotspots by check_type from v_error_hotspots
4. Add one dashboard with both visuals and a topic filter.
5. Record 3 insights and actions.

## Suggested SQL For Better Tableau Signal
Use this to create sample attempts quickly:

```sql
INSERT INTO submissions (user_id, checkpoint_id, status, score) VALUES
(1, 1, 'pass', 0.92),
(1, 2, 'fail', 0.40),
(1, 3, 'pass', 0.85),
(1, 4, 'fail', 0.35),
(1, 5, 'pass', 0.88),
(1, 6, 'pass', 0.91),
(1, 7, 'fail', 0.45),
(1, 8, 'pass', 0.95);
```

Then validate:

```sql
SELECT * FROM v_completion_funnel;
SELECT * FROM v_error_hotspots;
```

## SQL Tool Choice (No Command-Line Setup)
- use DB Browser for SQLite as your primary SQL tool right now
- do not use MySQL tools for this project stage because your data source is a SQLite file, not a MySQL server
- keep Tableau connected to the same file: data/sqlite/learning.db

DB Browser workflow:
1. Open DB Browser for SQLite.
2. Open database file: data/sqlite/learning.db.
3. Go to Execute SQL.
4. Run the INSERT block above, then run the two SELECT checks.
5. Click Write Changes.
6. In Tableau, click Data > Refresh.

Optional fallback without sqlite3 CLI:
- use Python launcher for one-off SQL scripts if needed (py command)

## Tableau Build Checklist
- Sheet 1: module completion
- Columns: module_name
- Rows: submission_count (or lesson_count)
- Color: topic

- Sheet 2: error hotspots
- Columns: check_type
- Rows: fail_count
- Optional label: total_attempts

- Dashboard:
- include both sheets
- add Topic filter
- add title and one-paragraph interpretation

## Quick Fix Notes For Your Current Tableau State
- if a sheet looks blank, confirm the sheet is using the correct view table first
- for completion chart, use fields from v_completion_funnel only
- for hotspots chart, use fields from v_error_hotspots only
- if bars do not appear, ensure measure aggregation is SUM and mark type is Bar
- if values still look sparse, refresh after inserting more submission rows

## Evidence To Capture In Your Next Update
- table row counts after inserts
- screenshots of both sheets and dashboard
- top 3 insights
- one concrete curriculum action from those insights

## Next Milestone After Tableau
- wire dashboard metrics into product decisions:
- adjust lesson sequence or remediation based on fail hotspots
- define event logging needed for deeper cohort analytics
