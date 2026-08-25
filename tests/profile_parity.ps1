$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$files = @(
    (Join-Path $repoRoot 'README.md'),
    (Join-Path $repoRoot 'profile/README.md'),
    (Join-Path $repoRoot 'profile/README_de.md'),
    (Join-Path $repoRoot 'llms.txt'),
    (Join-Path $repoRoot 'CHANGELOG.md'),
    (Join-Path $repoRoot 'tests/profile_parity.ps1')
)
$parityFiles = $files[0..3]
$utf8Strict = [System.Text.UTF8Encoding]::new($false, $true)
$contents = @{}
$publicRepoNames = @('FinancialProof', '.github')
$publicContextNames = $publicRepoNames + @('assistassets-ai')
$privateRepoDenylist = @(
    $env:PROFILE_PRIVATE_REPO_DENYLIST -split ';' |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ }
)

foreach ($path in $files) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw "Missing parity file: $path"
    }
    $bytes = [System.IO.File]::ReadAllBytes($path)
    $contents[$path] = $utf8Strict.GetString($bytes)
    if ($contents[$path].Contains([char]0xfffd)) {
        throw "Invalid UTF-8 replacement character in $path"
    }
    $fences = ([regex]::Matches($contents[$path], '(?m)^```')).Count
    if (($fences % 2) -ne 0) {
        throw "Unbalanced Markdown fences in $path"
    }
}

$bannerUrl = 'https://raw.githubusercontent.com/assistassets-ai/FinancialProof/master/assets/banner.svg'
$repoUrl = 'https://github.com/assistassets-ai/FinancialProof'
$required = @(
    'FinancialProof',
    '.github',
    '2',
    '208',
    $bannerUrl,
    $repoUrl,
    'local-first'
)

foreach ($entry in $contents.GetEnumerator()) {
    if ($entry.Key -in $parityFiles) {
        foreach ($needle in $required) {
            if (-not $entry.Value.Contains($needle)) {
                throw "Missing '$needle' in $($entry.Key)"
            }
        }
    }
    foreach ($pattern in @(
        'https://github\.com/assistassets-ai/([A-Za-z0-9_.-]+)',
        'https://raw\.githubusercontent\.com/assistassets-ai/([A-Za-z0-9_.-]+)',
        'https://api\.github\.com/repos/assistassets-ai/([A-Za-z0-9_.-]+)'
    )) {
        foreach ($match in [regex]::Matches(
            $entry.Value,
            $pattern,
            [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
        )) {
            if ($match.Groups[1].Value -notin $publicRepoNames) {
                throw "Non-public repository reference in $($entry.Key)"
            }
        }
    }
    foreach ($line in $entry.Value -split "`r?`n") {
        if ($line -notmatch '(?i)(?:private|internal|privat|nicht öffentlich)') { continue }
        if ($line -match '(?i)assistassets-ai/[A-Za-z0-9_.-]+') {
            throw "Named private/internal repository disclosure in $($entry.Key)"
        }
        foreach ($token in [regex]::Matches($line, '`([A-Za-z0-9_.-]+)`')) {
            $name = $token.Groups[1].Value
            if ($name -notin $publicContextNames -and $name -notmatch '(?i)\.(?:md|txt|json|ya?ml|ps1)$') {
                throw "Named private/internal repository disclosure in $($entry.Key)"
            }
        }
    }
    foreach ($privateRepoName in $privateRepoDenylist) {
        $privatePattern = '(?i)(?<![A-Za-z0-9_-])' + [regex]::Escape($privateRepoName) + '(?![A-Za-z0-9_-])'
        if ([regex]::IsMatch($entry.Value, $privatePattern)) {
            throw "Externally denied private repository reference in $($entry.Key)"
        }
    }
    if ($entry.Key -in $parityFiles -and $entry.Value.Contains('211')) {
        throw "Forbidden stale test count in $($entry.Key)"
    }
}

$root = $contents[$files[0]]
$english = $contents[$files[1]]
$german = $contents[$files[2]]
$llms = $contents[$files[3]]

if (-not $root.Contains('2026-08-25')) { throw 'Root check date is not 2026-08-25' }
if (-not $english.Contains('2026-08-25')) { throw 'English profile check date is not 2026-08-25' }
if (-not $german.Contains('25.08.2026')) { throw 'German profile check date is not 25.08.2026' }
if (-not $llms.Contains('Last-checked: 2026-08-25')) { throw 'llms check date is not 2026-08-25' }
if (-not $root.Contains('local-first software assistants')) { throw 'Root assistant-family framing missing' }
if (-not $english.Contains('local-first software assistants')) { throw 'English assistant-family framing missing' }
if (-not $llms.Contains('local-first software assistants')) { throw 'llms assistant-family framing missing' }
if (-not $german.Contains('Software-Assistenten')) { throw 'German assistant-family framing missing' }
if (-not $english.Contains('## Featured Assistant: FinancialProof')) { throw 'English featured assistant section missing' }
if (-not $german.Contains('## Featured Assistant: FinancialProof')) { throw 'German featured assistant section missing' }
if (-not $english.Contains('## Capability & Feature Matrix')) { throw 'English Capability & Feature Matrix missing' }
if (-not $german.Contains('## Leistungs- und Feature-Matrix')) { throw 'German Leistungs- und Feature-Matrix missing' }

Write-Output ('PASS profile parity: {0} files, public_count=2, tests=208, banner=HTTP-verified separately' -f $files.Count)
