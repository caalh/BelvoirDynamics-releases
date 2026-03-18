# OWEN User Guide

## Quick Start

### Launching OWEN (Installed)

**Windows:**
- **Start Menu:** ReactorMC → OWEN (DynamicMC Editor)
- **Desktop:** Double-click the OWEN shortcut (if created during install)

**What you'll see:**
1. Splash screen with OWEN logo
2. Main window opens with file tree on the left, editor tabs in the center

---

## Interface Overview

### Main Tabs (Top Header)
```
┌─────────────────────────────────────────────┐
│ 📝 Editor  │  🎨 3D Preview                 │
└─────────────────────────────────────────────┘
```

- **📝 Editor Tab**: File tree + multi-tab code editor
- **🎨 3D Preview Tab**: 3D geometry visualization

---

## Editor Tab

### Layout
```
┌──────────────┬────────────────────────────────────┐
│  File Tree   │   Editor Tabs                      │
│              │  ┌──────┬──────┬──────┐            │
│  📁 src      │  │ File1│ File2│ File3│    x       │
│  ▶ templates │  └──────┴──────┴──────┘            │
│  📄 file.i   │                                     │
│              │  [Code editor with line numbers]   │
│              │  [Minimap on right]                │
└──────────────┴────────────────────────────────────┘
```

### File Tree Navigation
- **Double-click file**: Opens in new editor tab
- **Single click**: Select file/folder

### Opening Files
- **File Tree:** Double-click a file
- **Toolbar:** Click "Open…" button
- **Templates:** Select from dropdown, click "Load"

### Saving Files
- Click **Save** button or press Ctrl+S
- Tab shows `*` when modified

---

## 3D Preview Tab

1. Click **3D Preview** tab
2. Select source file from dropdown
3. Click **Generate 3D Preview**
4. **Rotate:** Left-click + drag | **Zoom:** Mouse wheel | **Pan:** Middle-click + drag

---

## Toolbar Features

- **Language:** MCNP, OpenMC, Serpent — affects syntax highlighting
- **Template:** Load pin cells, assemblies, core models
- **Snippet:** Insert cell scaffolds, headers

---

## Supported Codes

| Code | Extension |
|------|-----------|
| MCNP | `.i`, `.inp` |
| OpenMC | `.py` |
| Serpent 2 | `.inp` |
| SCONE | `.inp` |

---

## Troubleshooting

**3D Preview blank:** Click "Reset Camera" — geometry may be off-screen.

**Preview not generating:** Ensure source file has geometry (e.g. MCNP `fill=` blocks).

**Logs:** `%TEMP%\dynamicmc_app.log` (Windows)

---

For build instructions and source code, see [DynamicMC](https://github.com/caalh/DynamicMC).
