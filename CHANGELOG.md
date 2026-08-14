# Changelog

All notable changes to the `assistassets-ai` organization profile and shared community context will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.7] - 2026-08-14

### Added
- Integrated structured **Capability & Feature Matrix** (`## Capability & Feature Matrix` / `## Leistungs- und Feature-Matrix`) across `profile/README.md` and `profile/README_de.md`, documenting market data ingestion, technical indicators, scenario modeling, sentiment analysis, offline PWA companion, and safety boundaries.
- Added comprehensive Shields.io badge band including Public Repositories, Ecosystem (`open-bricks`), Domain (`Local-First Assistants`), Featured (`FinancialProof`), Tests Passed (`208 Passed`), Policy (`No-Advice Boundary`), and Context (`llms.txt`).

### Changed
- Re-verified the live GitHub organization index via GitHub API on **2026-08-14**: `FinancialProof` and `.github` remain the active public repositories (2 active public repositories in total); private repositories remain intentionally omitted.
- Synchronized `README.md`, `profile/README.md`, `profile/README_de.md`, and `llms.txt` to index timestamp **2026-08-14** (German: **14.08.2026**).
- Refined automated profile parity test suite `tests/profile_parity.ps1` to assert 2026-08-14 timestamps and capability matrix presence.

## [1.0.6] - 2026-08-11

### Maintenance
- Re-verified the live GitHub organization index via the GitHub API: `FinancialProof` and `.github` remain the only two active public repositories. The public check date is aligned to 2026-08-11; latest public pushes are 2026-07-25 and 2026-08-05 respectively.
- Re-verified the public FinancialProof README and banner endpoint. The repository currently documents 208 unit/regression tests (the previous 211 claim is not reproduced; the badge separately shows 204), and `assets/banner.svg` responds with HTTP 200. Public files therefore use the supported 208 figure and keep the banner target explicit.
- Reconciled the English, German, root, and machine-readable surfaces around the local-first assistant framing, FinancialProof as the first public assistant, the two-repository denominator, equivalent search phrases, and generic private-repository omission without publishing or pushing.

## [1.0.5] - 2026-08-06

### Reframing
- **Organization framing corrected:** assistassets-ai is repositioned as an organization for local-first software assistants (not a finance-only organization). FinancialProof is described as the first public assistant, not the organization's identity.
- **Added a Featured Assistant section** (`## Featured Assistant: FinancialProof`) with a banner link to FinancialProof's `assets/banner.svg`; the endpoint was rechecked as reachable (HTTP 200).
- **Added a bounded outlook sentence** noting that additional local-first assistants are in preparation, without naming private repositories or making release promises.
- **Removed private repository names from the four public navigation files:** private or internal repositories are now described generically and remain omitted from the public index.
- **Added assistant-family search phrases** alongside the existing FinancialProof-specific phrases.

## [1.0.4] - 2026-08-10

### Maintenance
- Re-verified the live GitHub organization index for `assistassets-ai` on 2026-08-10: `FinancialProof` and `.github` remain the active public repositories; private repositories remain intentionally omitted.
- Updated all landing-page index status fields to 2026-08-10 and recorded the live latest public push dates: `FinancialProof` 2026-07-25 and `.github` 2026-08-05.

## [1.0.3] - 2026-08-03

### Maintenance
- Re-verified live GitHub organization index for `assistassets-ai` on 2026-08-03: `FinancialProof` and `.github` remain the active public repositories; private repositories were explicitly kept out of public indexes.
- Updated all landing page indexes (`README.md`, `profile/README.md`, `profile/README_de.md`, `llms.txt`) to 2026-08-03, refreshing latest push dates, SEO discovery phrases, and ecosystem links.

## [1.0.2] - 2026-07-30

### Maintenance
- Re-verified the live public organization index: `FinancialProof` and `.github` remain the active public repositories; all four landing-page indexes (`README.md`, `profile/README.md`, `profile/README_de.md`, `llms.txt`) updated to 2026-07-30.

## [1.0.1] - 2026-07-29

### Maintenance
- Re-verified the live public organization index: `FinancialProof` and `.github` are the two active public repositories; all four landing-page indexes remain complete.

## [1.0.0] - 2026-07-27

### Added
- Created `profile/README_de.md` for full German i18n parity of the organization landing page.
- Added language switcher bar (`English` | `Deutsch`) to `profile/README.md` and `profile/README_de.md`.
- Added GFM `> [!NOTE]` callout for machine-readable context index and LLM navigation.
- Added Shields.io technology badges (`Python | Streamlit | SQLite`).
