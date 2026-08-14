$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$files = @(
    (Join-Path $repoRoot 'README.md'),
    (Join-Path $repoRoot 'profile/README.md'),
    (Join-Path $repoRoot 'profile/README_de.md'),
    (Join-Path $repoRoot 'llms.txt')
)
$utf8Strict = [System.Text.UTF8Encoding]::new($false, $true)
$contents = @{}

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
    foreach ($needle in $required) {
        if (-not $entry.Value.Contains($needle)) {
            throw "Missing '$needle' in $($entry.Key)"
        }
    }
    foreach ($forbidden in @('terminpilot', 'DEV_FullAssistantHub_SUITE', '211')) {
        if ($entry.Value.Contains($forbidden)) {
            throw "Forbidden stale/private text '$forbidden' in $($entry.Key)"
        }
    }
}

$root = $contents[$files[0]]
$english = $contents[$files[1]]
$german = $contents[$files[2]]
$llms = $contents[$files[3]]

if (-not $root.Contains('2026-08-14')) { throw 'Root check date is not 2026-08-14' }
if (-not $english.Contains('2026-08-14')) { throw 'English profile check date is not 2026-08-14' }
if (-not $german.Contains('14.08.2026')) { throw 'German profile check date is not 14.08.2026' }
if (-not $llms.Contains('Last-checked: 2026-08-14')) { throw 'llms check date is not 2026-08-14' }
if (-not $root.Contains('local-first software assistants')) { throw 'Root assistant-family framing missing' }
if (-not $english.Contains('local-first software assistants')) { throw 'English assistant-family framing missing' }
if (-not $llms.Contains('local-first software assistants')) { throw 'llms assistant-family framing missing' }
if (-not $german.Contains('Software-Assistenten')) { throw 'German assistant-family framing missing' }
if (-not $english.Contains('## Featured Assistant: FinancialProof')) { throw 'English featured assistant section missing' }
if (-not $german.Contains('## Featured Assistant: FinancialProof')) { throw 'German featured assistant section missing' }
if (-not $english.Contains('## Capability & Feature Matrix')) { throw 'English Capability & Feature Matrix missing' }
if (-not $german.Contains('## Leistungs- und Feature-Matrix')) { throw 'German Leistungs- und Feature-Matrix missing' }

Write-Output ('PASS profile parity: {0} files, public_count=2, tests=208, banner=HTTP-verified separately' -f $files.Count)
