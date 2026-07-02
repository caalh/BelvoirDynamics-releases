# BelvoirDynamics Releases

**The canonical download repository for [BelvoirDynamics](https://github.com/caalh/BelvoirDynamics)** | [ReactorMC](https://reactormc.com)

> **BelvoirDynamics** is the software development division of [ReactorMC](https://reactormc.com).
> This repository hosts signed Windows installers, checksums, release notes, and verification
> scripts for BelvoirDynamics products. Source code lives in the
> [BelvoirDynamics monorepo](https://github.com/caalh/BelvoirDynamics).

---

## Products distributed here

| Product | Description | Platform | Distribution |
|---|---|---|---|
| **GROVES** | Desktop text editor and 3D viewer for Monte Carlo input files (MCNP, OpenMC, Serpent, SCONE) | Windows 10/11 (64-bit) | **This repo** — Inno Setup `.exe` installers |
| **OWEN** | VS Code / Cursor extension for nuclear reactor modeling | VS Code, Cursor | Published to the [VS Code Marketplace](https://marketplace.visualstudio.com/) and [Open VSX Registry](https://open-vsx.org/) — **not hosted here** |
| **NICHOLS** | Sublime Text & Notepad++ packages for Monte Carlo input decks | Sublime Text 4, Notepad++ 8.x | Zips on [caalh/nichols](https://github.com/caalh/nichols/releases) GitHub Releases — **not hosted here** |

Future BelvoirDynamics products that ship as standalone binaries will be added to this repo.

---

## Latest release — GROVES v1.0.1 (May 2026)

**Rebrand release.** GROVES is the new name for the desktop editor previously distributed
as "DynamicMC" / "OWEN (desktop)". The application is functionally compatible with v1.0.0
and supports in-place upgrade (the Inno Setup `AppId` GUID is preserved).

> Newer GROVES source releases (v1.1.0+) exist in the
> [BelvoirDynamics monorepo](https://github.com/caalh/BelvoirDynamics); a rebuilt
> installer will be published here when ready. v1.0.1 remains the latest installer.

- **Download:** [v1.0.1 release page](https://github.com/caalh/BelvoirDynamics-releases/releases/tag/v1.0.1)
- **Installer:** `GROVES-Setup-v1.0.1.exe`
- **Install path:** `C:\Program Files\ReactorMC\GROVES\` (moved from `\ReactorMC\DynamicMC\` in v1.0.0)
- **Full changelog:** [`CHANGELOG.md`](CHANGELOG.md), with deeper engineering history in
  [`BelvoirDynamics/AI_CHANGELOG.md`](https://github.com/caalh/BelvoirDynamics/blob/main/AI_CHANGELOG.md)

### What is GROVES?

GROVES is a desktop text editor built for nuclear engineers. It supports four Monte Carlo
neutron transport codes:

- **MCNP** input files
- **OpenMC** Python models
- **Serpent 2** input decks
- **SCONE** input files

Features include syntax highlighting, a 3D geometry preview (PyVista), 2D cross-section
views, a visual Lattice Builder, bundled templates, automatic language detection, a
(experimental) MCNP ↔ OpenMC converter, and Dark / Marble themes.

---

## Download & install

1. Go to the [Releases](https://github.com/caalh/BelvoirDynamics-releases/releases) page.
2. Download `GROVES-Setup-v<version>.exe` and the published SHA-256 checksum.
3. **Verify the checksum** (see below) before running the installer.
4. Run the installer. Windows SmartScreen may warn about an unsigned binary — click
   "More info" → "Run anyway" if you trust the source.

### System requirements

- Windows 10 or Windows 11 (64-bit)
- 4 GB RAM minimum (8 GB recommended)
- 500 MB free disk space
- OpenGL 3.3+ compatible graphics

---

## Security & verification

- **[SECURITY.md](SECURITY.md)** — privacy policy, data handling, air-gapped use,
  vulnerability reporting.
- **Verify before installing.** SHA-256 checksums are published on each
  [release](https://github.com/caalh/BelvoirDynamics-releases/releases) page.
- **Verification scripts:**
  - Windows / PowerShell: [`scripts/verify-installer.ps1`](scripts/verify-installer.ps1)
  - Linux / WSL / macOS: [`scripts/verify-installer.sh`](scripts/verify-installer.sh)

```powershell
# Windows / PowerShell
.\scripts\verify-installer.ps1 -Path ".\GROVES-Setup-v1.0.1.exe" -ExpectedHash "71A34E01467038237FC275D3DDA44809CDEF7EBAFDF15136C213E00F1AECC103"
```

```bash
# Linux / WSL / macOS
./scripts/verify-installer.sh GROVES-Setup-v1.0.1.exe 71A34E01467038237FC275D3DDA44809CDEF7EBAFDF15136C213E00F1AECC103
```

---

## Documentation

- **User Guide:** [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md) — quick-start for the
  installed application. The canonical, full-length guide lives in the source repo:
  [`BelvoirDynamics/groves/docs/USER_GUIDE.md`](https://github.com/caalh/BelvoirDynamics/blob/main/groves/docs/USER_GUIDE.md).
- **Changelog:** [`CHANGELOG.md`](CHANGELOG.md)
- **Release notes template:** [`RELEASE_NOTES_TEMPLATE.md`](RELEASE_NOTES_TEMPLATE.md) —
  used by maintainers when publishing a new GROVES release.

---

## Building from source

Source code lives in the **[BelvoirDynamics monorepo](https://github.com/caalh/BelvoirDynamics)**
(GROVES under `groves/`, OWEN under `owen/`, NICHOLS under `nichols/`).

```bash
git clone https://github.com/caalh/BelvoirDynamics.git
cd BelvoirDynamics/groves
pip install -r requirements.txt
set PYTHONPATH=src
python -m groves
```

See `groves/docs/BUILD_GUIDE.md` and `docs/AI_MAINTAINER_GUIDE.md` in the source repo for
full build and packaging instructions.

---

## About

- **Division:** BelvoirDynamics (software development)
- **Organization:** [ReactorMC](https://reactormc.com)
- **Source code:** https://github.com/caalh/BelvoirDynamics
- **Releases (this repo):** https://github.com/caalh/BelvoirDynamics-releases

> Historical note: this repository was previously named `dynamicmc-releases` and
> distributed the application under the names "DynamicMC" and "OWEN (desktop)". As of
> GROVES v1.0.1 (May 2026) it has been renamed to `BelvoirDynamics-releases` to reflect
> the new division name and product naming. Old release tags (≤ v1.0.0) remain available
> for historical reference.

## License

Copyright 2025-2026 ReactorMC. All rights reserved.
