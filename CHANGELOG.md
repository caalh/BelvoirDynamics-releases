# Changelog

All notable changes to **GROVES** (and historically, its predecessor "DynamicMC" /
"OWEN desktop") releases distributed from this repository are documented here.

The canonical engineering changelog across the entire BelvoirDynamics division lives in
the source monorepo:
[`BelvoirDynamics/AI_CHANGELOG.md`](https://github.com/caalh/BelvoirDynamics/blob/main/AI_CHANGELOG.md).

This file tracks user-visible changes to the **published installers** only.

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
