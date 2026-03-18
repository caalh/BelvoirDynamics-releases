<#
.SYNOPSIS
    Verifies OWEN installer integrity using SHA-256 checksum.

.DESCRIPTION
    Compares the SHA-256 hash of a downloaded installer against the expected
    value published in the release notes. Run this before installing.

.PARAMETER Path
    Path to the downloaded .exe file.

.PARAMETER ExpectedHash
    The SHA-256 hash from the release notes (case-insensitive, spaces ignored).

.EXAMPLE
    .\verify-installer.ps1 -Path ".\DynamicMC-Setup-v1.0.0.exe" -ExpectedHash "abc123..."
.EXAMPLE
    .\verify-installer.ps1 -Path ".\DynamicMC-Setup-v1.0.0.exe"
    (Computes and prints hash only - use when publishing checksums)
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [Parameter(Mandatory = $false)]
    [string]$ExpectedHash
)

if (-not (Test-Path -LiteralPath $Path)) {
    Write-Error "File not found: $Path"
    exit 1
}

$hash = (Get-FileHash -Path $Path -Algorithm SHA256).Hash

if ($ExpectedHash) {
    $expected = $ExpectedHash -replace '\s', '' -replace '-', ''
    $actual = $hash -replace '\s', '' -replace '-', ''
    if ($expected -eq $actual) {
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
