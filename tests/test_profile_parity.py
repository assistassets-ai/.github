# -*- coding: utf-8 -*-
"""Contract tests for assistassets-ai organization profile parity and integrity."""

import os
import re
import pytest

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))

PUBLIC_REPOS = [
    ".github",
    "FinancialProof",
]

SISTER_ORGS = [
    "open-bricks",
    "file-bricks",
    "doc-bricks",
    "dev-bricks",
    "ellmos-ai",
    "research-line",
    "biotec-line",
    "entertain-and-more",
    "um-bruch",
    "assistassets-ai",
    "lukisch",
]

PRIVATE_REPOS = [
    "terminpilot",
    "DEV_FullAssistantHub_SUITE",
    "UpToday",
    "PrivacyMailDesk",
    "routinika",
]


def get_file_content(relative_path: str) -> str:
    path = os.path.join(REPO_ROOT, relative_path)
    assert os.path.exists(path), f"File not found: {path}"
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def test_markdown_fence_balance():
    """Verify all markdown files have balanced code fences."""
    md_files = [
        "README.md",
        "profile/README.md",
        "profile/README_de.md",
        "CHANGELOG.md",
        "CONTRIBUTING.md",
        "SECURITY.md",
        "CODE_OF_CONDUCT.md",
    ]
    for rel_path in md_files:
        content = get_file_content(rel_path)
        fence_count = len(re.findall(r"^```", content, flags=re.MULTILINE))
        assert fence_count % 2 == 0, f"Unbalanced code fences in {rel_path} (found {fence_count})"


def test_public_repo_inventory():
    """Verify all public repos are cataloged in core profile documents."""
    target_files = [
        "profile/README.md",
        "profile/README_de.md",
        "README.md",
        "llms.txt",
    ]
    for rel_path in target_files:
        content = get_file_content(rel_path)
        for repo in PUBLIC_REPOS:
            assert repo in content, f'Public repo "{repo}" missing from {rel_path}'


def test_private_repo_leak_guard():
    """Verify 0 private/internal repos are leaked into public profile documents."""
    target_files = [
        "profile/README.md",
        "profile/README_de.md",
        "README.md",
        "llms.txt",
        "SECURITY.md",
        "CONTRIBUTING.md",
        "CODE_OF_CONDUCT.md",
        "CHANGELOG.md",
    ]
    for rel_path in target_files:
        content = get_file_content(rel_path)
        for priv in PRIVATE_REPOS:
            assert priv not in content, f'Leak violation: private repo "{priv}" found in {rel_path}'


def test_check_timestamp_parity():
    """Verify verification date 2026-09-16 across profile files."""
    expected_iso = "2026-09-16"
    expected_de = "16.09.2026"

    en_content = get_file_content("profile/README.md")
    assert expected_iso in en_content

    de_content = get_file_content("profile/README_de.md")
    assert expected_de in de_content

    root_content = get_file_content("README.md")
    assert expected_iso in root_content

    llms_content = get_file_content("llms.txt")
    assert expected_iso in llms_content


def test_activity_snapshot_integrity():
    """Verify recent push activity entries in profile READMEs."""
    en_content = get_file_content("profile/README.md")
    de_content = get_file_content("profile/README_de.md")

    for repo in PUBLIC_REPOS:
        assert repo in en_content
        assert repo in de_content

    assert "2026-07-25" in en_content
    assert "25.07.2026" in de_content
    assert "2026-09-16" in en_content
    assert "16.09.2026" in de_content


def test_ecosystem_cross_linking():
    """Verify sister organization references are complete across profile docs."""
    target_files = ["profile/README.md", "profile/README_de.md", "llms.txt"]
    for rel_path in target_files:
        content = get_file_content(rel_path)
        for org in SISTER_ORGS:
            assert org in content, f'Sister org "{org}" missing from {rel_path}'


def test_security_policy_invariants():
    """Verify modern security policy features 48h SLA and critical invariants."""
    sec_content = get_file_content("SECURITY.md")
    assert "48 hours" in sec_content or "48h" in sec_content
    assert "Zero-Egress" in sec_content
    assert "Unprivileged User Mode" in sec_content
    assert "Data Integrity" in sec_content
    assert "No-Advice Boundary" in sec_content


def test_mermaid_diagram_syntax():
    """Verify Mermaid flowchart blocks exist and have valid structure."""
    for rel_path in ["profile/README.md", "profile/README_de.md"]:
        content = get_file_content(rel_path)
        assert "```mermaid" in content
        assert "graph TD" in content or "flowchart" in content
        subgraph_starts = len(re.findall(r"\bsubgraph\b", content))
        subgraph_ends = len(re.findall(r"^\s*end\s*$", content, flags=re.MULTILINE))
        assert subgraph_starts == subgraph_ends, f"Mismatched subgraph/end in {rel_path}"
