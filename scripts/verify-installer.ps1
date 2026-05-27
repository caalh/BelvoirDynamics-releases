<#
.SYNOPSIS
    Verifies a GROVES installer's integrity using its SHA-256 checksum.

.DESCRIPTION
    Compares the SHA-256 hash of a downloaded installer against the expected value
    published in the release notes. Run this before installing.

    Expected filename pattern: GROVES-Setup-v<version>.exe
    (for example: GROVES-Setup-v1.0.1.exe)

    Files matching the legacy DynamicMC-Setup-v*.exe naming (v1.0.0 and earlier) are
    still accepted; a warning is printed so users are aware the file predates the
    GROVES rebrand.

.PARAMETER Path
    Path to the downloaded .exe file. Typically GROVES-Setup-v<version>.exe.

.PARAMETER ExpectedHash
    The SHA-256 hash from the release notes (case-insensitive, spaces / dashes
    ignored). If omitted, the script prints the computed hash and exits 0.

.PARAMETER Version
    Optional. The expected GROVES version (e.g. "1.0.1"). When supplied, the script
    additionally checks that the filename contains "v<Version>" and warns if it does
    not.

.EXAMPLE
    .\verify-installer.ps1 -Path ".\GROVES-Setup-v1.0.1.exe" -ExpectedHash "abc123..."

.EXAMPLE
    .\verify-installer.ps1 -Path ".\GROVES-Setup-v1.0.1.exe" -ExpectedHash "abc123..." -Version 1.0.1

.EXAMPLE
    .\verify-installer.ps1 -Path ".\GROVES-Setup-v1.0.1.exe"
    # Computes and prints the hash only - use when publishing checksums.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [Parameter(Mandatory = $false)]
    [string]$ExpectedHash,

    [Parameter(Mandatory = $false)]
    [string]$Version
)

if (-not (Test-Path -LiteralPath $Path)) {
    Write-Error "File not found: $Path"
    exit 1
}

$fileName = Split-Path -Leaf $Path
if ($fileName -notmatch '^GROVES-Setup-v[\d\.\w\-]+\.exe$') {
    if ($fileName -match '^DynamicMC-Setup-v[\d\.\w\-]+\.exe$') {
        Write-Warning "Filename '$fileName' uses the legacy DynamicMC-Setup-v*.exe naming. Current GROVES releases ship as 'GROVES-Setup-v<version>.exe'."
    } else {
        Write-Warning "Filename '$fileName' does not match the expected 'GROVES-Setup-v<version>.exe' pattern. Verification will continue using the provided checksum."
    }
}

if ($Version -and ($fileName -notmatch [regex]::Escape("v$Version"))) {
    Write-Warning "Filename '$fileName' does not contain 'v$Version'. Double-check that you downloaded the right version."
}

$hash = (Get-FileHash -Path $Path -Algorithm SHA256).Hash

if ($ExpectedHash) {
    $expected = $ExpectedHash -replace '\s', '' -replace '-', ''
    $actual = $hash -replace '\s', '' -replace '-', ''
    if ($expected -ieq $actual) {
        Write-Host "PASS: Checksum matches. File integrity verified." -ForegroundColor Green
        exit 0
    } else {
        Write-Host "FAIL: Checksum mismatch. Do not install this file." -ForegroundColor Red
        Write-Host "  Expected: $ExpectedHash"
        Write-Host "  Actual:   $hash"
        exit 1
    }
} else {
    Write-Host "SHA-256: $hash"
    Write-Host ""
    Write-Host "Compare this value to the checksum published in the release notes."
    exit 0
}
