# GROVES Release Notes Template

Use this template when publishing a new GROVES release on the
[Releases](https://github.com/caalh/BelvoirDynamics-releases/releases) page.
**Always include the SHA-256 checksum** of the installer so users can verify integrity.

The filename pattern is `GROVES-Setup-v<version>.exe`
(example: `GROVES-Setup-v1.0.1.exe`).

---

## Before publishing

1. Build the installer in the source repo (`groves/build_installer.py` then Inno Setup),
   producing `GROVES-Setup-v<version>.exe`.
2. Compute the SHA-256 checksum of the installer:
   - **Windows (cmd):** `certutil -hashfile GROVES-Setup-v1.0.1.exe SHA256`
   - **PowerShell:** `Get-FileHash -Algorithm SHA256 .\GROVES-Setup-v1.0.1.exe | Format-List`
   - **Linux / WSL / macOS:** `sha256sum GROVES-Setup-v1.0.1.exe`
3. Paste the hash into the **Checksums** and **Verification** sections below.
4. Upload `GROVES-Setup-v<version>.exe` as a release asset and publish the release.

---

## Suggested release description

Copy the block below into the GitHub release description and fill in the placeholders
(`<version>`, `<SHA256_HASH>`, and the highlight bullets).

```markdown
# GROVES v<version>

<one-sentence summary of this release — e.g. "Adds the SCONE pinUniverse
visualizer and fixes a 3D preview crash on AMD GPUs.">

## Highlights

- <headline change 1>
- <headline change 2>
- <headline change 3>

## New features

- <feature 1>
- <feature 2>

## Bug fixes

- <fix 1>
- <fix 2>

## Known issues

- <known issue 1>
- <known issue 2>

## Install

1. Download `GROVES-Setup-v<version>.exe` from this release.
2. Verify the SHA-256 checksum (see "Verification" below).
3. Run the installer. Default install path:
   `C:\Program Files\ReactorMC\GROVES\`.
4. Launch from the Start Menu (**ReactorMC → GROVES**) or the desktop shortcut
   (if created during install).

Existing GROVES (or DynamicMC v1.0.0) installations will be upgraded in place — the
installer's `AppId` GUID is preserved.

## Verification

| File                          | SHA-256          |
|-------------------------------|------------------|
| `GROVES-Setup-v<version>.exe` | `<SHA256_HASH>`  |

**PowerShell (no script needed):**

\`\`\`powershell
(Get-FileHash -Algorithm SHA256 .\GROVES-Setup-v<version>.exe).Hash -eq "<SHA256_HASH>"
\`\`\`

Returns `True` if the file is authentic.

**Or use the verification script** (clone
[`BelvoirDynamics-releases`](https://github.com/caalh/BelvoirDynamics-releases) first):

\`\`\`powershell
.\scripts\verify-installer.ps1 -Path ".\GROVES-Setup-v<version>.exe" -ExpectedHash "<SHA256_HASH>"
\`\`\`

\`\`\`bash
./scripts/verify-installer.sh GROVES-Setup-v<version>.exe <SHA256_HASH>
\`\`\`

## Source

Built from [`caalh/BelvoirDynamics`](https://github.com/caalh/BelvoirDynamics) at tag
`groves-v<version>`. See `groves/docs/BUILD_GUIDE.md` for build instructions.
```

---

## Checksums block (drop into release description)

```
GROVES-Setup-v<version>.exe
SHA256: <SHA256_HASH>
```
