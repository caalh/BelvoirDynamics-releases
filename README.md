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

## Latest release — GROVES v1.3.4 (July 2026)

**Major feature release.** Catches up the Windows installer with source releases v1.1.0
through v1.3.4: 3D preview enhancements, MCNP reference tracker, run simulation, parametric
sweep, ALLEN cross-sections, results viewer, sweep dashboard, PNNL-15870 materials picker,
hi-fi MCNP→OpenMC converter (beta), and OpenMC geometry verification.

In-place upgrade from GROVES v1.0.1 (or DynamicMC v1.0.0) is supported — the Inno Setup
`AppId` GUID is preserved.

- **Download:** [v1.3.4 release page](https://github.com/caalh/BelvoirDynamics-releases/releases/tag/v1.3.4)
- **Installer:** `GROVES-Setup-v1.3.4.exe` (~356 MB)
- **SHA-256:** `1EA43724E23E825B4728DF4C6B44ECCEFA64F6DA749C64C2331E2D28E9A4B0B7`
- **Install path:** `C:\Program Files\ReactorMC\GROVES\`
- **Full changelog:** [`CHANGELOG.md`](CHANGELOG.md), with deeper engineering history in
  [`BelvoirDynamics/AI_CHANGELOG.md`](https://github.com/caalh/BelvoirDynamics/blob/main/AI_CHANGELOG.md)

### What is GROVES?

GROVES is a desktop text editor built for nuclear engineers. It supports four Monte Carlo
neutron transport codes:

- **MCNP** input files
- **OpenMC** Python models
- **Serpent 2** input decks
- **SCONE** input files

Features include syntax highlighting, a 3D geometry preview (PyVista) with BEAVRS radial
structure and measurement tools, MCNP reference tracker, run simulation and parametric sweep,
results viewer and sweep dashboard, PNNL-15870 materials picker (411 materials), hi-fi
MCNP→OpenMC converter (beta), OpenMC geometry verification, ALLEN cross-sections panel,
2D cross-section views, a visual Lattice Builder, bundled prebuilt models, and Dark /
Marble themes.

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
.\scripts\verify-installer.ps1 -Path ".\GROVES-Setup-v1.3.4.exe" -ExpectedHash "1EA43724E23E825B4728DF4C6B44ECCEFA64F6DA749C64C2331E2D28E9A4B0B7"
```

```bash
# Linux / WSL / macOS
./scripts/verify-installer.sh GROVES-Setup-v1.3.4.exe 1EA43724E23E825B4728DF4C6B44ECCEFA64F6DA749C64C2331E2D28E9A4B0B7
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
