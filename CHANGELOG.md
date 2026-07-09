# Changelog

All notable changes to **GROVES** (and historically, its predecessor "DynamicMC" /
"OWEN desktop") releases distributed from this repository are documented here.

The canonical engineering changelog across the entire BelvoirDynamics division lives in
the source monorepo:
[`BelvoirDynamics/AI_CHANGELOG.md`](https://github.com/caalh/BelvoirDynamics/blob/main/AI_CHANGELOG.md).

This file tracks user-visible changes to the **published installers** only.

---

---

## [1.3.6] - 2026-07-08 — UX audit + integrated lattice editor

UX adversarial audit fixes plus Input Builder integrated lattice editor.

### Fixed

- **3D Geometry Preview** now switches the main **3D Preview** tab (was targeting nested editor tabs)
- **Toolbar ALLEN** opens embedded cross-section panel
- **Matplotlib-missing** inline message in embedded ALLEN panel

### Added

- **Input Builder — integrated Lattice tab** — full visual grid editor inside Snippet Wizards; toolbar/menu **Lattice Builder** shortcuts open Input Builder on Lattice tab
- **GROVES → Validate Workspace…** — re-run MCNP cross-file validation

### Changed

- **GROVES menu** grouped (Validate | Build | Simulate | Tools | Settings); tab-required actions gray out with tooltips

### SmartScreen

The Windows installer is **unsigned**. SmartScreen may block it — use **More info → Run anyway**
after verifying the SHA-256 below.

### Compatibility

- **In-place upgrade from v1.3.5 (or earlier) is supported.** Same Inno Setup `AppId` GUID.

### Verification

| File | SHA-256 |
|------|---------|
| `GROVES-Setup-v1.3.6.exe` | `E764CB3CDCAB8FF6F9D4245F488FAA2FB43616745101ABC2E762E80EEF2E8C4D` |

---

## [1.3.5] - 2026-07-08 — Hotfix + UI themes

Fixes a startup crash in v1.3.4 when the MCNP line-length ruler is enabled (default for
new editors): missing `QTextCharFormat` import in `code_editor.py`. Adds seven pickable
editor UI themes.

### Fixed

- **`NameError: name 'QTextCharFormat' is not defined`** on launch — app now starts normally

### Added

- **Seven UI themes** — Dark (default), Marble, Rome Marble, Gold, Ocean, Forest, Slate;
  selectable in Settings or the toolbar; persisted in QSettings

### SmartScreen

The Windows installer is **unsigned**. SmartScreen may block it — use **More info → Run anyway**
after verifying the SHA-256 below.

### Compatibility

- **In-place upgrade from v1.3.4 (or earlier) is supported.** Same Inno Setup `AppId` GUID.

### Verification

| File | SHA-256 |
|------|---------|
| `GROVES-Setup-v1.3.5.exe` | `1FDCE0A8E00E47635F43CD1C2E450A61A35033BAD2B88A2CC87C95036FD046A3` |

---

## [1.3.4] - 2026-07-06 — Feature release (installer catch-up)

**First installer published since the v1.0.1 rebrand.** Bundles source releases v1.1.0
through v1.3.4 into a single Windows installer.

### Added (since v1.0.1)

- **3D preview (v1.1.0):** fidelity Auto/Disc/Layers, solo layer, measurement tools
  (distance, angle, radius), pick readout, component layer toggles, axial slice, 1.5M
  instance budget, BEAVRS radial structure (barrel, shields, RPV, baffle boxes)
- **Editor (v1.1.0):** MCNP references index + dock (F12/Shift+F12), line-length ruler,
  4-palette highlight picker, settings dialog, deep validation
- **Workflows (v1.1.0):** run simulation, parametric sweep, prebuilt models, community
  library opt-in stub
- **ALLEN (v1.2.0):** embedded matplotlib panel + browser shortcut to NRDP `/nrdp/allen`
- **Results/Sweep (v1.3.0):** View Results dialog (k-eff, flux spectrum, tally table,
  mesh heatmap); sweep dashboard; Verify Geometry with OpenMC
- **PNNL materials (v1.3.3):** Insert PNNL Material picker — 411 materials from
  PNNL-15870 Rev. 2 with per-code card generation
- **Converter (v1.3.4):** hi-fi MCNP→OpenMC converter (beta, ported from OWEN v0.3.8);
  legacy regex fallback; MCNP→Serpent/SCONE experimental

### Compatibility

- **In-place upgrade from v1.0.1 (or DynamicMC v1.0.0) is supported.** The Inno Setup
  `AppId` GUID is preserved.
- **Installer size:** ~356 MB (PyInstaller bundle with PySide6, PyVista, VTK).

### Verification

| File | SHA-256 |
|------|---------|
| `GROVES-Setup-v1.3.4.exe` | `1EA43724E23E825B4728DF4C6B44ECCEFA64F6DA749C64C2331E2D28E9A4B0B7` |

---

## [1.0.1] - 2026-05-26 — GROVES rebrand

**This is the first release published under the `BelvoirDynamics-releases` repository
(previously `dynamicmc-releases`) and under the product name "GROVES".**

### Renamed

- **Product:** "DynamicMC" / "OWEN (desktop editor)" → **GROVES**.
  (The name **OWEN** is now exclusively used for the separately-distributed VS Code /
  Cursor extension, which is published to the VS Code Marketplace and Open VSX Registry,
  not here.)
- **Division:** "DynamicMC" (software development division of ReactorMC) →
  **BelvoirDynamics**.
- **Release repository:** `caalh/dynamicmc-releases` → `caalh/BelvoirDynamics-releases`.
- **Source repository:** `caalh/DynamicMC` → `caalh/BelvoirDynamics` (monorepo, with the
  desktop app under `groves/`).
- **Installer filename:** `DynamicMC-Setup-v*.exe` → `GROVES-Setup-v1.0.1.exe`.
- **Default install folder:** `C:\Program Files\ReactorMC\DynamicMC\` →
  `C:\Program Files\ReactorMC\GROVES\`.
- **Start Menu entry:** "ReactorMC → OWEN (DynamicMC Editor)" → "ReactorMC → GROVES".
- **Log file:** `%TEMP%\dynamicmc_app.log` → `%TEMP%\groves_app.log`.

### Compatibility

- **In-place upgrade from v1.0.0 is supported.** The Inno Setup `AppId` GUID
  (`{B7E3F2A1-9C4D-4E8F-A5D2-1F8C9B3E7A6D}`) is preserved from the DynamicMC v1.0.0
  installer, so Windows treats GROVES v1.0.1 as an update of the existing application.
  The installer relocates the application files to the new `\ReactorMC\GROVES\` folder
  and removes the old `\ReactorMC\DynamicMC\` folder.
- **User files and templates are unaffected.** All editor and 3D viewer functionality is
  unchanged from v1.0.0. No data migration is required.
- The user-config directory has been renamed from `%APPDATA%\DynamicMC\` to
  `%APPDATA%\GROVES\`; on first launch GROVES will copy any existing DynamicMC settings
  forward, or fall back to defaults if none exist.

### Notes for maintainers

- Engineering-level details for this rebrand (file moves, module renames, theme/asset
  changes, etc.) are recorded in `AI_CHANGELOG.md` in the BelvoirDynamics monorepo under
  the **GROVES v1.0.1 (rebrand)** entry.

---

## [1.0.0] - 2026-03 — Initial stable release (published as "DynamicMC" / "OWEN")

### Added

- Initial stable release of the desktop editor (distributed at the time as
  `DynamicMC-Setup-v1.0.0.exe` under the product names "DynamicMC" and "OWEN").
- Multi-tab code editor with syntax highlighting (MCNP, OpenMC, Serpent, SCONE).
- 3D geometry preview (PyVista) — visualize reactor models.
- 2D cross-section views (radial XY, axial XZ).
- Lattice Builder — visual grid tool for pin fill maps.
- Built-in templates (pin cells, assemblies, core models).
- MCNP ↔ OpenMC bidirectional converter (experimental).
- Dark and Marble themes.
- Block/column selection, file tree navigation, minimap.

## [0.9.0] - 2026-02 — Beta

### Added

- Beta release of the desktop editor (then named "DynamicMC").
- Core editor and 3D preview functionality.
