# assistassets-ai

<!-- public-index-last-checked: 2026-08-03 -->

<p align="center">
  🌐 <strong>English</strong> | <a href="README_de.md"><strong>Deutsch</strong></a>
</p>

<p align="center">
  <img src="logo.jpg" alt="assistassets-ai logo" width="180" />
</p>

<p align="center">
  <a href="https://github.com/assistassets-ai"><img src="https://img.shields.io/badge/GitHub-assistassets--ai-181717?style=for-the-badge&logo=github" alt="GitHub Org" /></a>
  <a href="https://github.com/open-bricks"><img src="https://img.shields.io/badge/Ecosystem-open--bricks-0052CC?style=for-the-badge" alt="open-bricks ecosystem" /></a>
  <a href="https://github.com/assistassets-ai/FinancialProof"><img src="https://img.shields.io/badge/Domain-Local--First%20Finance-008080?style=for-the-badge" alt="Local First Finance" /></a>
  <a href="https://github.com/assistassets-ai/FinancialProof"><img src="https://img.shields.io/badge/Stack-Python%20%7C%20Streamlit%20%7C%20SQLite-3776AB?style=for-the-badge&logo=python" alt="Python Streamlit SQLite" /></a>
  <a href="#use-boundary"><img src="https://img.shields.io/badge/Policy-No--Advice%20Boundary-e74c3c?style=for-the-badge" alt="No Advice Boundary" /></a>
</p>

<h3 align="center">Local-first tools for finance-oriented evidence review and market-pattern exploration with clear no-advice boundaries</h3>

assistassets-ai builds practical software for checking, structuring, and exploring finance-related data or evidence bundles on the user's own machine first. The public work emphasizes transparent analysis workflows, reproducible local state, inspectable exports, and cautious wording around regulated domains.

> [!NOTE]
> **Machine-Readable Navigation Context**: AI agents and automated tools can inspect [`llms.txt`](https://github.com/assistassets-ai/.github/blob/main/llms.txt) for canonical repositories, public project roles, risk boundaries, and preferred search phrases.

---

## Architecture & Data Flow

```mermaid
graph TD
    A["Market Data Sources (yfinance / CSV)"] -->|Fetch & Cache| B[("Local SQLite Database")]
    B --> C["Streamlit Analytics Workspace"]
    C --> D["Technical Indicators & Scenario Engine"]
    D --> E["ARIMA / Monte Carlo / Sentiment"]
    C --> F["Redacted JSON Workspace Export"]
    F --> G["Read-Only Offline PWA Companion"]

    style A fill:#1e293b,stroke:#38bdf8,stroke-width:2px,color:#fff
    style B fill:#0f172a,stroke:#008080,stroke-width:2px,color:#fff
    style C fill:#1e1b4b,stroke:#818cf8,stroke-width:2px,color:#fff
    style D fill:#311042,stroke:#c084fc,stroke-width:2px,color:#fff
    style E fill:#064e3b,stroke:#34d399,stroke-width:2px,color:#fff
    style F fill:#451a03,stroke:#fb923c,stroke-width:2px,color:#fff
    style G fill:#3f0f1d,stroke:#f43f5e,stroke-width:2px,color:#fff
```

## Start Here

| Need | Start with | Why |
|---|---|---|
| Explore historical market patterns locally | [FinancialProof](https://github.com/assistassets-ai/FinancialProof) | Streamlit-based analysis workspace for market data, yfinance access, technical indicators, ARIMA, Monte Carlo, sentiment, SQLite-backed state, optional ML/NLP modules, and offline/PWA exports |
| Understand the public organization profile | [`.github`](https://github.com/assistassets-ai/.github) | Shared profile README, community files, and `llms.txt` navigation for assistassets-ai |

## Public Repository Directory

This public profile intentionally lists public repositories only. Private or internal repositories (such as `terminpilot` and `DEV_FullAssistantHub_SUITE`) are intentionally omitted from the public index.

Verified public index: `FinancialProof` and `.github` were checked against the live GitHub organization on **2026-08-03**. No active public repository is missing from this directory.

| Project | Stack & Coverage | Description |
|---|---|---|
| [FinancialProof](https://github.com/assistassets-ai/FinancialProof) | Python 3.10+, Streamlit, yfinance, SQLite, PWA · 211 tests | Local-first Streamlit tool for historical financial market pattern analysis, technical indicators, scenario exploration, yfinance data access, SQLite-backed state, optional ML/NLP modules, offline/PWA exports, and evidence-oriented review workflows |
| [`.github`](https://github.com/assistassets-ai/.github) | Markdown, GitHub Profile, `llms.txt` | Organization landing page, shared community files, profile assets, workflow templates, and machine-readable `llms.txt` context |

## Public Activity Snapshot

| Project | Default branch | Latest public push | Public role |
|---|---:|---:|---|
| [FinancialProof](https://github.com/assistassets-ai/FinancialProof) | `master` | 2026-07-25 | Active product repository |
| [`.github`](https://github.com/assistassets-ai/.github) | `main` | 2026-08-03 | Active organization profile and public index |

## Discovery Focus

FinancialProof is the current public product surface. The best external search framing is precise and risk-aware: local-first finance analysis, Streamlit stock-analysis dashboards, historical technical indicators, yfinance data access, SQLite-backed watchlists, offline/PWA exports, and no-financial-advice boundaries.

## Use Boundary

> [!IMPORTANT]
> assistassets-ai repositories are software and research tools. They are **not financial advisers**, **not trading systems**, **not tax or legal advisers**, and **not a substitute for professional review**. Outputs should be treated as exploratory historical analysis, workflow support, or documentation aids, not as forecasts, guarantees, or instructions to buy, sell, hold, allocate assets, or make legal, tax, or accounting decisions.

## Design Principles

- **Local first:** user data, generated artifacts, and analysis state stay on the user's machine unless an external data source is explicitly configured.
- **No-advice clarity:** READMEs and UI text avoid investment, tax, legal, or guaranteed-outcome claims.
- **Inspectable workflows:** calculations, assumptions, exports, and local state are documented for human and LLM-assisted review.
- **Practical tooling:** projects assist repeated real workflows, including data import, comparison, review, export, and handoff.
- **Privacy-conscious defaults:** tools minimize unnecessary uploads, account requirements, and hidden remote processing.

## Machine-Readable Context

For crawlers and LLM tools, see [`llms.txt`](https://github.com/assistassets-ai/.github/blob/main/llms.txt). It lists canonical repositories, public project roles, risk boundaries, and preferred search phrases for the assistassets-ai organization.

## Search Phrases

- assistassets-ai FinancialProof
- local-first financial analysis
- local-first Streamlit stock analysis
- Streamlit market analysis workspace
- historical market pattern exploration
- historical technical indicators yfinance SQLite watchlist
- FinancialProof workspace export PWA companion
- finance evidence review workflow
- no trading advice software
- no financial advice Streamlit dashboard
- FinancialProof market evidence review
- SQLite-backed finance analysis workspace

## Ecosystem & Network

assistassets-ai is the finance-and-assistant branch of the broader local-first software and research ecosystem:

| Organization | Focus Area |
|---|---|
| [open-bricks](https://github.com/open-bricks) | Dachorganisation / Umbrella org for local-first desktop software & tools |
| [file-bricks](https://github.com/file-bricks) | PySide6 desktop file management, sync, and indexing utilities |
| [doc-bricks](https://github.com/doc-bricks) | Document processing, markdown tools, and reader utilities |
| [dev-bricks](https://github.com/dev-bricks) | Developer tools, test environments, and CLI utilities |
| [ellmos-ai](https://github.com/ellmos-ai) | AI infrastructure, MCP servers, agent frameworks, and orchestration |
| [research-line](https://github.com/research-line) | Scientific research, mathematical proofs, and open-science repositories |
| [biotec-line](https://github.com/biotec-line) | Bioinformatics, VCF handling, and genetic data tools |
| [entertain-and-more](https://github.com/entertain-and-more) | Terminal games, audio tools, and entertainment software |
| [lukisch](https://github.com/lukisch) | Personal GitHub developer profile |
