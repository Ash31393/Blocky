# Phase 0 Execution Guide (You Run Everything)

## Goal
Set up local environment and baseline project tooling for blockchain + multi-learning software.

## Why This Matters
Without a stable baseline, all later modules (contracts, API, SQLite, dashboarding) become inconsistent and hard to debug.

## Step 1: Verify Core Tools
Run these and confirm versions print successfully:

```powershell
node -v
npm -v
git --version
python --version
sqlite3 --version
```

Pass criteria:
- each command returns a version string
- for Python on Windows, either python --version or py --version is acceptable

If Python is not found on Windows:
- Try this launcher check first:

```powershell
py --version
```

- If not installed, install Python and verify:

```powershell
winget install -e --id Python.Python.3.12
python --version
py --version
```

Notes:
- During installer setup, enable Add Python to PATH.
- If command still fails, close and reopen terminal and run version checks again.

If sqlite3 is not found on Windows:
- Install SQLite CLI and verify:

```powershell
winget install -e --id SQLite.SQLite
sqlite3 --version
```

- Alternative package managers:

```powershell
choco install sqlite
```

Important:
- Chocolatey install to default paths requires an elevated (Run as Administrator) shell.
- If you are not elevated, this install may fail with Access denied under C:\ProgramData\chocolatey.

Notes:
- Reopen terminal after install so PATH refreshes.
- If winget/choco is unavailable, install SQLite manually and add its folder to PATH.

Non-admin fallback (recommended so work does not block):
- Use Python's built-in sqlite3 module for all SQLite tasks in this project.
- Verify SQLite engine availability through Python:

```powershell
py -c "import sqlite3; print(sqlite3.sqlite_version)"
```

- Create database file without sqlite3 CLI (create the folder first):

```powershell
New-Item -ItemType Directory -Path data\sqlite -Force
py -c "import sqlite3; sqlite3.connect('data/sqlite/learning.db').close(); print('created data/sqlite/learning.db')"
```

Pass criteria for this fallback:
- py command prints a SQLite version
- data/sqlite/learning.db can be created/read through Python

Current status template (fill this as you run):
- node: pass/fail
- npm: pass/fail
- git: pass/fail
- python: pass/fail (note whether checked via python or py)
- sqlite3: pass/fail

Current known status from latest run:
- python via py: pass (Python 3.14.0)
- sqlite3 CLI: not installed (non-admin machine), using Python sqlite3 module as fallback
- data/sqlite/learning.db: created successfully via py
- Step 1: COMPLETE

## Step 2: Install Blockchain Tooling

### Why Foundry
Foundry is the industry-standard Solidity dev framework. It gives you:
- `forge` for compiling and testing contracts
- `cast` for reading/writing on-chain from terminal
- `anvil` as a local EVM node for development

### Install on Windows
Foundry uses `foundryup` as its installer. On Windows it requires Git Bash or WSL because the installer script is Unix-based.

Option A: WSL (recommended, cleanest path)
1. Open WSL terminal (Ubuntu or any distro)
2. Run:

```bash
curl -L https://foundry.paradigm.xyz | bash
```

3. Close and reopen WSL terminal, then run:

```bash
foundryup
```

4. Verify:

```bash
forge --version
cast --version
anvil --version
```

Option B: Git Bash (if WSL is not available)
1. Open Git Bash (not PowerShell)
2. Run the same curl command above
3. Restart Git Bash and run foundryup
4. Verify with forge/cast/anvil --version

Option C: Windows native binary (manual)
1. Go to https://github.com/foundry-rs/foundry/releases
2. Download the latest windows zip
3. Extract to a folder, e.g. C:\foundry
4. Add C:\foundry to your PATH in System Environment Variables
5. Open new PowerShell and verify:

```powershell
forge --version
cast --version
anvil --version
```

Pass criteria:
- forge/cast/anvil each print a version string
- recommended to confirm from same terminal you will use day-to-day

Note:
- If WSL is not installed, run this in PowerShell first (requires admin):

```powershell
wsl --install
```

- Restart machine after WSL installs, then install Foundry inside WSL.

## Step 3: Initialize Monorepo Skeleton
From project root, create folders:

```powershell
mkdir contracts, app, protocol-sim, data, product, .github
mkdir docs\architecture, docs\decisions, docs\runbooks
mkdir contracts\src, contracts\test, contracts\script
mkdir app\web, app\api
mkdir protocol-sim\crypto, protocol-sim\chain-sim
mkdir data\sqlite, data\warehouse, data\dashboards
mkdir product\figma, product\research, product\ux-flows
mkdir .github\workflows
```

Pass criteria:
- folder tree exists with no errors

## Step 4: Initialize JavaScript Workspace
Pick package manager (npm/pnpm/yarn). If using npm:

```powershell
npm init -y
```

Then add scripts in package.json manually:
- lint
- test
- format

Pass criteria:
- package.json exists
- npm run <script> resolves (even if placeholder)

## Step 5: Baseline CI Workflow
Create one workflow file manually at .github/workflows/ci.yml with:
- checkout
- Node setup
- install deps
- run lint
- run test

Pass criteria:
- workflow appears in GitHub Actions after push

## Step 6: Report Back
Share:
- tool versions
- which package manager you chose
- any failed commands and fixes
- screenshot or copy of CI run status
- whether Python was verified via python or py command
