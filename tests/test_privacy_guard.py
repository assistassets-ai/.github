"""Synthetic privacy regressions; no internal repository inventory belongs here."""

import pytest
from test_profile_parity import check_public_references


@pytest.mark.parametrize("host", ["github.com/", "raw.githubusercontent.com/", "api.github.com/repos/"])
def test_unknown_organization_repository_is_rejected(host, monkeypatch):
    monkeypatch.delenv("PROFILE_PRIVATE_REPO_DENYLIST", raising=False)
    with pytest.raises(AssertionError, match="Unlisted repository reference") as error:
        check_public_references(f"https://{host}assistassets-ai/synthetic-hidden-example", "fixture.md")
    assert "synthetic-hidden-example" not in str(error.value)


@pytest.mark.parametrize("name", ["FinancialProof", ".github", "FINANCIALPROOF"])
def test_public_repository_is_allowed(name, monkeypatch):
    monkeypatch.delenv("PROFILE_PRIVATE_REPO_DENYLIST", raising=False)
    check_public_references(f"https://github.com/assistassets-ai/{name}", "fixture.md")


def test_external_denylist_checks_plain_names_without_printing_them(monkeypatch):
    monkeypatch.setenv("PROFILE_PRIVATE_REPO_DENYLIST", " ; synthetic-hidden-example ; ")
    with pytest.raises(AssertionError, match="Externally denied repository reference") as error:
        check_public_references("Notes about SYNTHETIC-HIDDEN-EXAMPLE.", "fixture.md")
    assert "synthetic-hidden-example" not in str(error.value).lower()
    check_public_references("prefix-synthetic-hidden-example-suffix", "fixture.md")
