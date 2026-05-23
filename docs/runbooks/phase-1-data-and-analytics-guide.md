# Phase 1 Data And Analytics Guide (You Run Everything)

## Goal
Create local learning data storage with SQLite and prepare BI-ready datasets for Tableau.

## Why This Matters
You are building a learning platform, not only contracts. Progress and quality must be measurable.

## Step 1: Create SQLite Database
From project root:

```powershell
sqlite3 data/sqlite/learning.db
```

Inside SQLite shell, create baseline schema:

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  handle TEXT NOT NULL UNIQUE,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE modules (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  level TEXT NOT NULL,
  topic TEXT NOT NULL
);

CREATE TABLE lessons (
  id INTEGER PRIMARY KEY,
  module_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  objective TEXT NOT NULL,
  FOREIGN KEY (module_id) REFERENCES modules(id)
);

CREATE TABLE checkpoints (
  id INTEGER PRIMARY KEY,
  lesson_id INTEGER NOT NULL,
  check_type TEXT NOT NULL,
  weight INTEGER NOT NULL,
  FOREIGN KEY (lesson_id) REFERENCES lessons(id)
);

CREATE TABLE submissions (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  checkpoint_id INTEGER NOT NULL,
  status TEXT NOT NULL,
  score REAL,
  submitted_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (checkpoint_id) REFERENCES checkpoints(id)
);

CREATE TABLE events (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  event_type TEXT NOT NULL,
  payload_json TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
```

Exit shell:

```sql
.quit
```

Pass criteria:
- data/sqlite/learning.db exists
- all 6 tables created

## Step 2: Add Seed Data
Re-open DB and insert at least:
- 1 user
- 2 modules
- 4 lessons
- 8 checkpoints

Pass criteria:
- SELECT COUNT(*) confirms rows exist

## Step 3: Create BI Views
Add views for Tableau:

```sql
CREATE VIEW v_completion_funnel AS
SELECT m.topic, m.name AS module_name,
       COUNT(DISTINCT l.id) AS lesson_count,
       COUNT(DISTINCT s.id) AS submission_count,
       AVG(CASE WHEN s.status = 'pass' THEN 1.0 ELSE 0.0 END) AS pass_rate
FROM modules m
LEFT JOIN lessons l ON l.module_id = m.id
LEFT JOIN checkpoints c ON c.lesson_id = l.id
LEFT JOIN submissions s ON s.checkpoint_id = c.id
GROUP BY m.topic, m.name;

CREATE VIEW v_error_hotspots AS
SELECT c.check_type,
       COUNT(*) AS total_attempts,
       SUM(CASE WHEN s.status = 'fail' THEN 1 ELSE 0 END) AS fail_count
FROM submissions s
JOIN checkpoints c ON c.id = s.checkpoint_id
GROUP BY c.check_type;
```

Pass criteria:
- both views query successfully

## Step 4: Connect Tableau
In Tableau Desktop/Public:
1. Connect to SQLite
2. Select data/sqlite/learning.db
3. Import v_completion_funnel and v_error_hotspots
4. Build:
- completion by module chart
- fail hotspots chart

Pass criteria:
- dashboard renders both charts

## Step 5: Report Back
Share:
- schema creation success
- row counts per table
- screenshot or summary of two Tableau visuals
- top 3 insights from dashboard
