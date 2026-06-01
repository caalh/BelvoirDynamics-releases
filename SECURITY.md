# Security Policy

This policy covers binaries published in the
[`BelvoirDynamics-releases`](https://github.com/caalh/BelvoirDynamics-releases)
repository — currently the **GROVES** desktop editor. The OWEN VS Code / Cursor
extension is distributed separately through the VS Code Marketplace and Open VSX
Registry and is not in scope here.

---

## GROVES Security & Privacy

GROVES is a desktop text editor and 3D viewer for Monte Carlo input files (MCNP,
OpenMC, Serpent, SCONE). We take security and user trust seriously.

### What GROVES does not do

- **No telemetry or analytics** — GROVES does not collect or transmit any usage data.
- **No network access** — The application does not make outbound network requests
  during normal use.
- **No data exfiltration** — Your input files, geometry, and any nuclear data stay on
  your machine.

### Data handling

- All file operations are local. GROVES reads and writes files only on the user's
  filesystem.
- No data is sent to external servers.
- The application can run fully offline after installation.

### Verification

- SHA-256 checksums are published in each release's notes for integrity verification.
- Download only from the official
  [Releases](https://github.com/caalh/BelvoirDynamics-releases/releases) page.
- Use the provided verification scripts before installing:

**Windows / PowerShell** ([`scripts/verify-installer.ps1`](scripts/verify-installer.ps1)):

```powershell
.\scripts\verify-installer.ps1 -Path ".\GROVES-Setup-v1.0.1.exe" -ExpectedHash "DB3F736E286EA6650C25009AF1ED499C4687CEA7E4EA85EA9183FA9CB84351E9"
```

**Linux / WSL / macOS** ([`scripts/verify-installer.sh`](scripts/verify-installer.sh)):

```bash
./scripts/verify-installer.sh GROVES-Setup-v1.0.1.exe DB3F736E286EA6650C25009AF1ED499C4687CEA7E4EA85EA9183FA9CB84351E9
```

The scripts exit with status `0` on a successful match and `1` on mismatch (or print
the computed hash if no expected value is supplied).

### Air-gapped use

GROVES can be used in air-gapped or restricted environments:

1. Download the installer on a machine with internet access.
2. Verify the SHA-256 checksum against the value published in the release notes.
3. Transfer the installer via approved media (USB, internal network, etc.) to the
   target machine.
4. Install and run. No internet connection is required.

### Reporting a vulnerability

If you believe you have found a security vulnerability in GROVES (or any other
binary published from this repository), please report it responsibly:

- **Email:** inforeactormc@gmail.com
- **Subject:** `[BelvoirDynamics Security] Brief description`

We will acknowledge receipt and work with you to understand and address the issue.
We ask that you do not disclose the vulnerability publicly until we have had a chance
to respond.

### Compliance

If your organization handles sensitive or export-controlled nuclear data, follow your
internal policies for software approval, air-gapped deployment, and data handling.
GROVES is a general-purpose editor; it does not implement export controls or
classification handling.
