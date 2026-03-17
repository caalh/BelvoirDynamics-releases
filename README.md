# OWEN — Open Workflow for Engineered Neutronics

**A DynamicMC Product** | [ReactorMC](https://reactormc.com)

> **DynamicMC** is the software development division of [ReactorMC](https://reactormc.com).
> **OWEN** is the first product from DynamicMC — a professional code editor and 3D
> visualization tool for reactor physics simulations.

---

## What is OWEN?

OWEN is a desktop text editor built for nuclear engineers. It supports four Monte Carlo
neutron transport codes:

- **MCNP** input files
- **OpenMC** Python models
- **Serpent 2** input decks
- **SCONE** input files

## Features

- Multi-tab code editor with syntax highlighting for all four codes
- 3D geometry preview (PyVista) — visualize your reactor models
- 2D cross-section views (radial XY, axial XZ)
- **Lattice Builder** — visual grid tool to create lattice fill maps (MCNP, OpenMC, Serpent)
- Built-in templates — start quickly with pin cells, assemblies, and core models
- Smart analysis — automatic language detection and diagnostics
- MCNP ↔ OpenMC bidirectional converter (experimental)
- Dark and Marble themes
- Block/column selection (Alt+drag or toggle button)
- Standard shortcuts (Ctrl+S, Ctrl+O, Ctrl+T, etc.)
- File tree navigation with minimap

## Quick Start

1. **Open a template**: Select from the dropdown, click "Load"
2. **Edit your model**: Make changes in the editor
3. **Build a lattice**: Click "Lattice Builder" or right-click → "Insert Lattice..."
4. **Generate 3D preview**: Switch to "3D Preview" tab, select source, click "Generate"
5. **Save your work**: Press Ctrl+S or click "Save"

## Project Structure

```
DynamicMC/
├── src/dynamicmc/      # Application source code
├── src/templates/      # Bundled template input files
├── assets/             # Icons and fonts
├── docs/               # Documentation (BUILD_GUIDE, USER_GUIDE, etc.)
├── scripts/            # Utility scripts (icon generators, build helpers)
├── installer/          # Inno Setup installer script
├── tests/              # pytest tests
├── launcher.py         # PyInstaller entry point
├── build_installer.py  # Build script
└── requirements.txt    # Python dependencies
```

## System Requirements

- Windows 10 or Windows 11 (64-bit)
- 4 GB RAM minimum (8 GB recommended)
- 500 MB free disk space
- OpenGL 3.3+ compatible graphics

## Documentation

- **User Guide**: See [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md)
- **Build Guide**: See [`docs/BUILD_GUIDE.md`](docs/BUILD_GUIDE.md)
- **AI Maintainer Guide**: See [`docs/AI_MAINTAINER_GUIDE.md`](docs/AI_MAINTAINER_GUIDE.md)

## Building from Source

```bash
pip install -r requirements.txt
set PYTHONPATH=src
python -m dynamicmc
```

Or use the dev launcher: `run_dynamicmc.bat`

## About

- **Product**: OWEN v1.0.0
- **Division**: DynamicMC (Software Development)
- **Organization**: [ReactorMC](https://reactormc.com)
- Website: https://reactormc.com

## License

Copyright 2025-2026 ReactorMC. All rights reserved.
