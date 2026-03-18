# OWEN Release Notes Template

Use this when publishing a new release. **Always include SHA-256 checksums** so users can verify integrity.

## Before publishing

1. Build the installer (e.g. `DynamicMC-Setup-v1.0.0.exe`).
2. Compute SHA-256:
   - **Windows:** `certutil -hashfile DynamicMC-Setup-v1.0.0.exe SHA256`
   - **PowerShell:** `Get-FileHash -Algorithm SHA256 .\DynamicMC-Setup-v1.0.0.exe | Format-List`
   - **Linux/WSL:** `sha256sum DynamicMC-Setup-v1.0.0.exe`
3. Paste the hash into the release description below.
4. Publish the release.

---

## Checksums (add to each release)

```
DynamicMC-Setup-v1.0.0.exe
SHA256: SHA256_HASH_HERE
```

---

## Example release description block

```markdown
## Verification

| File | SHA-256 |
|------|---------|
| DynamicMC-Setup-v1.0.0.exe | `abc123...` |

**Verify before installing (PowerShell, no script needed):**
```powershell
(Get-FileHash -Algorithm SHA256 .\DynamicMC-Setup-v1.0.0.exe).Hash -eq "abc123..."
```
Returns `True` if the file is authentic.

**Or use the verification script** (clone this repo first): `.\scripts\verify-installer.ps1 -Path ".\DynamicMC-Setup-v1.0.0.exe" -ExpectedHash "abc123..."`
```
