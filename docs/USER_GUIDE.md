# GROVES User Guide

> This is the **installed-application** quick-start. For the full, canonical user guide
> (every feature, every shortcut, every screenshot), see
> [`BelvoirDynamics/groves/docs/USER_GUIDE.md`](https://github.com/caalh/BelvoirDynamics/blob/main/groves/docs/USER_GUIDE.md)
> in the source monorepo.

GROVES (formerly distributed as "DynamicMC" / "OWEN desktop" through v1.0.0) is a
desktop text editor and 3D viewer for Monte Carlo neutron transport input files. It
is one of two products from the **BelvoirDynamics** division of
[ReactorMC](https://reactormc.com); the other is the **OWEN** VS Code / Cursor
extension, distributed separately on the VS Code Marketplace and Open VSX Registry.

---

## Quick Start

### Launching GROVES (installed)

**Windows:**

- **Start Menu:** ReactorMC → GROVES
- **Desktop:** Double-click the GROVES shortcut (if created during install)

**What you'll see:**

1. Splash screen with the GROVES logo
2. Main window opens with the file tree on the left and editor tabs in the center

---

## Interface Overview

### Main tabs (top header)

```
┌─────────────────────────────────────────────┐
│  Editor  │  3D Preview                      │
└─────────────────────────────────────────────┘
```

- **Editor tab:** file tree + multi-tab code editor
- **3D Preview tab:** 3D geometry visualization

---

## Editor tab

### Layout

```
┌──────────────┬────────────────────────────────────┐
│  File Tree   │   Editor Tabs                      │
│              │  ┌──────┬──────┬──────┐            │
│  src/        │  │ File1│ File2│ File3│    x       │
│  ▶ templates │  └──────┴──────┴──────┘            │
│  file.i      │                                    │
│              │  [Code editor with line numbers]   │
│              │  [Minimap on right]                │
└──────────────┴────────────────────────────────────┘
```

### File tree navigation

- **Double-click file:** opens in a new editor tab
- **Single click:** selects file/folder

### Opening files

- **File tree:** double-click a file
- **Toolbar:** click "Open…"
- **Templates:** select from the dropdown and click "Load"

### Saving files

- Click **Save** or press `Ctrl+S`
- The tab title shows `*` when the file is modified

---

## 3D Preview tab

1. Click the **3D Preview** tab
2. Select a source file from the dropdown
3. Click **Generate 3D Preview**
4. **Rotate:** left-click + drag · **Zoom:** mouse wheel · **Pan:** middle-click + drag

---

## Toolbar features

- **Language:** MCNP, OpenMC, Serpent, SCONE — drives syntax highlighting
- **Template:** load pin cells, assemblies, core models
- **Snippet:** insert cell scaffolds, headers, etc.

---

## Supported codes

| Code        | Extension        |
|-------------|------------------|
| MCNP        | `.i`, `.inp`     |
| OpenMC      | `.py`            |
| Serpent 2   | `.inp`           |
| SCONE      | `.inp`           |

---

## Troubleshooting

**3D preview is blank:** click "Reset Camera" — the geometry may be off-screen.

**Preview is not generating:** make sure the source file contains geometry (e.g. MCNP
`fill=` blocks).

**Logs:** `%TEMP%\groves_app.log` (Windows). On installations upgraded from
DynamicMC v1.0.0, an older `%TEMP%\dynamicmc_app.log` may also exist from before the
rebrand; it can be safely deleted.

---

For build instructions, deeper feature documentation, and source code, see the
**[BelvoirDynamics monorepo](https://github.com/caalh/BelvoirDynamics)** — the GROVES
application lives under `groves/`.
