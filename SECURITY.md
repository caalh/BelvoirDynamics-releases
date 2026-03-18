# Security Policy

---

## OWEN Security & Privacy

OWEN (Open Workflow for Engineered Neutronics) is a desktop text editor and 3D viewer for Monte Carlo input files (MCNP, OpenMC, Serpent, SCONE). We take security and user trust seriously.

### What OWEN Does Not Do

- **No telemetry or analytics** — OWEN does not collect or transmit any usage data.
- **No network access** — The application does not make outbound network requests during normal use.
- **No data exfiltration** — Your input files, geometry, and any nuclear data stay on your machine.

### Data Handling

- All file operations are local. OWEN reads and writes files only on the user's filesystem.
- No data is sent to external servers.
- The application can run fully offline after installation.

### Verification

- SHA-256 checksums are published in each release's notes for integrity verification.
- Download only from the official [Releases](https://github.com/caalh/dynamicmc-releases/releases) page.
- Use the provided verification scripts (`scripts/verify-installer.ps1` or `scripts/verify-installer.sh`) to verify your download before installing.

### Air-Gapped Use

OWEN can be used in air-gapped or restricted environments:

1. Download the installer on a machine with internet access.
2. Verify the SHA-256 checksum against the value published in the release notes.
3. Transfer the installer via approved media (USB, internal network, etc.) to the target machine.
4. Install and run. No internet connection is required.

### Reporting a Vulnerability

If you believe you have found a security vulnerability in OWEN, please report it responsibly:

- **Email:** inforeactormc@gmail.com
- **Subject:** [OWEN Security] Brief description

We will acknowledge receipt and work with you to understand and address the issue. We ask that you do not disclose the vulnerability publicly until we have had a chance to respond.

### Compliance

If your organization handles sensitive or export-controlled nuclear data, follow your internal policies for software approval, air-gapped deployment, and data handling. OWEN is a general-purpose editor; it does not implement export controls or classification handling.
