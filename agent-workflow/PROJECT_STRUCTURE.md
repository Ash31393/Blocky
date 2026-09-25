# Project Structure — Blocky

Factual map of what exists. Do not reorganize the application to match a template.

Last updated: 2026-09-23

## Top level

| Path | Purpose |
| --- | --- |
| `CODING_STUDY_GUIDE_HANDOFF.md` | Ultimate coding/IT study guide + agent operating instructions (2026-09-12) |
| `agent-workflow/` | Living agent docs, standards, checklists, templates |
| `oldInstructions/` | Archived prior handoffs/runbooks/requirements (review only) |
| `data/etl/` | Schema init (`init_schema.py`) + CoinGecko → SQLite ETL (`fetch_prices.py`) |
| `data/archive/` | Archived learning-platform seed script |
| `data/sqlite/` | Local DB files (`*.db` gitignored) |
| `docs/runbooks/` | Previously held phase-1 briefs; locally deleted pending commit of move to `oldInstructions/runbooks/` |
| `.github/workflows/ci.yml` | GitHub Actions Node lint/test placeholders |
| `package.json` | Node project metadata; placeholder lint/test/format scripts |
| `pyproject.toml` | Project metadata + uv dependencies; Ruff lint/format |
| `uv.lock` | Locked dev deps for `uv sync` (commit with pyproject.toml) |
| `.vscode/settings.json` | Format on save: Prettier default, Ruff for Python |
| `.venv/` | Local uv virtualenv (gitignored) |
| `.gitignore` | Ignores `data/sqlite/*.db`, `.venv/`, `__pycache__/`, `*.pyc`, `.ruff_cache/` |

## Data flow (analytics)

```text
CoinGecko HTTP API
  → data/etl/fetch_prices.py
  → data/sqlite/blocky_analytics.db
       assets (ETH id=1)
       price_daily (upsert on asset_id + price_date)
       v_price_trends (view for BI: symbol, price_date, close_usd, …)
```

## Python environment

```text
uv venv → .venv
uv sync --group dev   # reads pyproject.toml + uv.lock
uv add <pkg>          # runtime dep
uv add --dev <pkg>    # dev group
```

ETL scripts use stdlib only; no runtime packages in `[project].dependencies` yet.

## Documentation ownership

| Concern | Location |
| --- | --- |
| Agent permission + ecosystem master | `CODING_STUDY_GUIDE_HANDOFF.md` |
| Current Blocky objective / next action | `agent-workflow/PROJECT_HANDOFF.md` |
| Web3 curriculum sequence | `agent-workflow/PROJECT_BLOCKCHAIN_WEB3.md` |
| Git PR flow | `agent-workflow/standards/GIT_WORKFLOW.md` |
| Tooling roles | `agent-workflow/standards/TOOLING_AND_ESLINT.md` |
| Session logs | `agent-workflow/sessions/` |
| ADRs | `agent-workflow/decisions/` |
