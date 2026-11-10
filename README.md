<div align="center">

# Wuthering Waves: Ultimate Optimization & Performance Suite

[![Game: Wuthering Waves](https://img.shields.io/badge/Game-Wuthering%20Waves-0ea5e9?style=flat-square&labelColor=0f172a)](https://wutheringwaves.kurogames.com/)
[![Engine: Unreal Engine 4](https://img.shields.io/badge/Engine-Unreal%20Engine%204.26-6366f1?style=flat-square&labelColor=1e1b4b)](https://www.unrealengine.com/)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows%2064--bit-0078D4?style=flat-square&labelColor=0c4a6e)](#)
[![Frame Gen: OptiScaler](https://img.shields.io/badge/Frame%20Gen-OptiScaler%20%7C%20FSR%203-d946ef?style=flat-square&labelColor=581c87)](#frame-generation-setup-optiscaler--fsr-3)
[![License: MIT](https://img.shields.io/badge/License-MIT-10b981?style=flat-square&labelColor=064e3b)](#)

<p align="center">
  <img src="https://files.catbox.moe/4ravx1.gif" width="125" alt="Welcome to Wuthering Waves Optimization Suite" />
</p>

A precision-engineered suite of `Engine.ini` performance profiles and **Frame Generation mods** for **Wuthering Waves** (Unreal Engine 4). Designed to eliminate traversal hitches, enforce asynchronous shader pre-caching, stabilize frame delivery, and double framerates across all PC hardware tiers.

</div>

---

## Table of Contents

- [Architectural Overview](#architectural-overview)
- [Profile Performance Matrix](#profile-performance-matrix)
- [Profile Breakdown](#profile-breakdown)
  - [Preset 1: ULTRA LOW (Minimalist Potato Mode)](#preset-1-ultra-low-minimalist-potato-mode)
  - [Preset 2: LOW (4-Core CPU, 8GB RAM, 2GB iGPU)](#preset-2-low-4-core-cpu-8gb-ram-2gb-igpu)
  - [Preset 3: MEDIUM (GTX 1050 Ti / GTX 1650, 4GB VRAM)](#preset-3-medium-gtx-1050-ti--gtx-1650-4gb-vram)
  - [Preset 4: HIGH (RTX 2060 / 3060 / 4060, 6GB-8GB VRAM)](#preset-4-high-rtx-2060--3060--4060-6gb-8gb-vram)
  - [Preset 5: VERY HIGH (RTX 3070 / 3080 / 4070, 8GB-12GB VRAM)](#preset-5-very-high-rtx-3070--3080--4070-8gb-12gb-vram)
  - [Preset 6: ULTRA EXTREME (WARNING: Flagship Hardware Melter)](#preset-6-ultra-extreme-warning-flagship-hardware-melter)
- [Frame Generation Setup (OptiScaler & FSR 3)](#frame-generation-setup-optiscaler--fsr-3)
- [System Requirements](#system-requirements)
- [Installation Methods](#installation-methods)
  - [Method 1: Automated Script (Recommended)](#method-1-automated-script-recommended)
  - [Method 2: Manual Deployment](#method-2-manual-deployment)
- [Recommended In-Game Settings](#recommended-in-game-settings)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Safety and Disclaimer](#safety-and-disclaimer)
- [Contributing & Support](#contributing--support)

---

## Architectural Overview

<div align="center">
  <img src="https://files.catbox.moe/6neo09.gif" width="130" alt="Aemeath Raging at Laptop" />
</div>

Unreal Engine 4 open-world titles often suffer from three distinct hardware bottlenecks on PC systems:

1. **Shader Pipeline Stutters**: Assets encountering an uncompiled shader trigger instantaneous CPU frame hitches. This repository forces background pipeline compilation and asynchronous batching (`r.CreateShadersOnLoad=1` and `r.ShaderPipelineCache.*`).
2. **VRAM Pool Exhaustion & Paging**: On configurations with shared system memory (integrated GPUs) or 8GB of total RAM, standard texture streaming targets exceed physical limits. This forces Windows to page active textures into the system swapfile, producing severe frame drops.
3. **Fillrate Overhead**: Volumetric fog marching grids and screen-space ambient occlusion degrade fillrate performance on bandwidth-limited hardware.

Each profile targets a distinct balance between draw call efficiency, texture streaming bounds, and shader complexity.

---

## Profile Performance Matrix

<div align="center">
  <img src="https://files.catbox.moe/g909ko.gif" width="115" alt="Profile Performance Matrix" />
</div>

| Profile Directory | Target Hardware Class | Rendering Features | Resolution Scale | Target Framerate |
| :--- | :--- | :--- | :--- | :--- |
| `01 - CONFIG ULTRA LOW` | Dual/Quad Core, 4-8GB RAM, Intel HD / UHD | Shadows OFF, Foliage OFF, Fog OFF, Minimal Particles | 65% + Sharpening | 30 - 60 FPS |
| `02 - CONFIG LOW` | 4-Core CPU, 8GB RAM, iGPU 2GB VRAM | 1 Cascade (512p), Fog OFF, 1000MB Texture Pool | 85% + Sharpening | 45 - 60 FPS |
| `03 - CONFIG MED` | 4-6 Core, 8-16GB RAM, Dedicated 4GB VRAM | 2 Cascades (1024p), Light AO/SSR, 75% Density | 100% Native | 60 FPS Stable |
| `04 - CONFIG HIGH` | 6+ Core, 16GB RAM, Dedicated 6-8GB VRAM | 3 Cascades (2048p), Volumetric Fog, AO Level 2 | 100% Native | 60 - 120 FPS |
| `05 - CONFIG VERY HIGH` | 8+ Core, 16-32GB RAM, Dedicated 8-12GB VRAM | 4 Cascades (3072p), Dense Fog Grid, 150% Distance | 100% Native | 120+ FPS |
| `06 - CONFIG ULTRA EXTREME (WARNING)` | Flagship Rigs (RTX 4080/4090, RX 7900 XTX) | 6 Cascades (4096p), 250% Foliage, Locked LOD 0 | 125% Supersampling | Uncapped / Cinematic |

---

## Profile Breakdown

### Preset 1: ULTRA LOW (Minimalist Potato Mode)

<div align="center">
  <img src="https://files.catbox.moe/342906.gif" width="115" alt="Preset 1 Potato Mode" />
</div>

Designed for low-specification machines with legacy integrated graphics (Intel HD 520/620/630) or limited system memory (4GB - 8GB).
- **Shadowing**: Cascading shadow maps and distance field shadows completely disabled (`r.ShadowQuality=0`, `r.Shadow.CSM.MaxCascades=0`).
- **Vegetation**: Foliage and procedural grass generation eliminated (`foliage.DensityScale=0`, `grass.DensityScale=0`) to reduce CPU draw calls.
- **Level of Detail**: Static mesh LOD bias pushed to maximum downsampling distance (`r.StaticMeshLODDistanceScale=2.5`).
- **Resolution**: Scaled to 65% of native display resolution, paired with a custom tonemapper sharpen pass (`r.Tonemapper.Sharpen=0.8`).

### Preset 2: LOW (4-Core CPU, 8GB RAM, 2GB iGPU)

<div align="center">
  <img src="https://files.catbox.moe/a0xz2j.gif" width="115" alt="Preset 2 Low Spec" />
</div>

Optimized specifically for modern laptops and desktops running integrated GPUs (Intel Iris Xe, AMD Radeon Vega 6/7/8) where VRAM is dynamically carved out of 8GB system RAM.
- **Memory Streaming**: Hard ceiling of 1000MB allocated to texture streaming (`r.Streaming.PoolSize=1000`), preventing system memory paging crashes.
- **Atmospherics**: Volumetric fog and volumetric cloud passes disabled to unburden integrated GPU rasterizers.
- **Draw Distance**: Capped at 75% native distance, with 50% foliage density to ensure smooth combat frame pacing.
- **Resolution**: Scaled to 85% native with tonemapper compensation.

### Preset 3: MEDIUM (GTX 1050 Ti / GTX 1650, 4GB VRAM)

<div align="center">
  <img src="https://files.catbox.moe/83a96b.gif" width="115" alt="Preset 3 Medium Balanced" />
</div>

A balanced configuration engineered to hold a stable 60 FPS on entry-level dedicated gaming GPUs with 4GB VRAM.
- **Shadowing**: 1024x1024 resolution shadow buffers with 2 cascades.
- **Reflections & Occlusion**: Ambient Occlusion (level 1) and Screen Space Reflections enabled with low ray step budgets.
- **Texture Cache**: Allocated 2200MB texture pool.
- **Resolution**: 100% Native display scale.

### Preset 4: HIGH (RTX 2060 / 3060 / 4060, 6GB-8GB VRAM)

<div align="center">
  <img src="https://files.catbox.moe/r5a2bh.gif" width="115" alt="Preset 4 High Sweet Spot" />
</div>

High visual fidelity targeting modern mainstream GPUs with 6GB to 8GB of dedicated VRAM.
- **Lighting & Shadows**: 2048x2048 shadow buffers with 3 cascades, distance field contact shadows enabled.
- **Atmospherics**: Standard voxel volumetric fog and procedural cloud layers enabled.
- **Environment**: 100% native foliage density with 120% draw distance scale.
- **Texture Cache**: Allocated 4500MB texture pool.

### Preset 5: VERY HIGH (RTX 3070 / 3080 / 4070, 8GB-12GB VRAM)

<div align="center">
  <img src="https://files.catbox.moe/amzdee.gif" width="115" alt="Preset 5 Very High 120 FPS" />
</div>

Enthusiast-tier fidelity calibrated for high refresh rate displays (120Hz - 165Hz+).
- **Shadows**: 3072x3072 shadow buffers with 4 cascades and extended cascade split radiuses.
- **Voxel Grid**: Volumetric fog slice resolution tightened (`GridPixelSizeK=8`, `GridSizeZ=128`).
- **World Rendering**: View distance extended to 150%, foliage density increased to 125%.
- **Texture Cache**: Allocated 6500MB texture pool.

### Preset 6: ULTRA EXTREME (WARNING: Flagship Hardware Melter)

<div align="center">
  <img src="https://files.catbox.moe/omzl8c.gif" width="115" alt="Preset 6 Ultra Melter" />
</div>

An uncapped, hardware-stressing profile engineered exclusively for flagship hardware (RTX 4080, RTX 4090, RX 7900 XTX) with 32GB+ system RAM.
- **Shadows**: 4096x4096p 4K buffers with 6 cascading splits across a 300% shadow projection distance.
- **Polygon Locking**: Mesh degradation disabled (`r.StaticMeshLODDistanceScale=0.1`, `r.SkeletalMeshLODBias=-2`), permanently forcing highest-resolution LOD 0 geometry across all rendering distances.
- **Supersampling**: Internal render pipeline runs at 125% native resolution (`r.ScreenPercentage=125`) for pristine sub-pixel stability.
- **Environment**: Foliage and grass density boosted to 250%, view distance scaled to 300%.
- **Texture Allocation**: 12,000MB dedicated texture cache with unconstrained streaming bandwidth.

---

## Frame Generation Setup (OptiScaler & FSR 3)

<div align="center">
  <img src="https://files.catbox.moe/6xu2bj.gif" width="130" alt="Driving Frame Generation" />
</div>

Wuthering Waves only natively supports DLSS 3 Frame Generation on RTX 40-series cards. The included **`07 - ENABLE FRAMEGEN`** package integrates **OptiScaler** with **AMD FidelityFX FSR 3 Frame Generation**, unlocking 2x framerate boosts on:

- **NVIDIA GeForce RTX 20 & 30 Series** (RTX 2060 / 2070 / 2080 / 3060 / 3070 / 3080 / 3090)
- **NVIDIA GeForce GTX 16 Series** (GTX 1650 / 1660 / 1660 Ti)
- **AMD Radeon RX 6000 & 7000 Series** (RX 6600, 6700 XT, 7800 XT, etc.)
- **Intel Arc Discrete GPUs** (A580, A750, A770)

### How to Install Frame Generation:

1. Open your Wuthering Waves game installation directory and locate the binary folder:
   ```text
   <GameDirectory>\Wuthering Waves Game\Client\Binaries\Win64\
   ```
   *(This is the folder containing `Client-Win64-Shipping.exe`)*
2. Open the **`07 - ENABLE FRAMEGEN`** folder inside this repository.
3. Copy all of the following items directly into `Client\Binaries\Win64\`:
   - `dxgi.dll`
   - `version.dll`
   - `OptiScaler.ini`
   - `OptiScaler` (folder)
   - `Licenses` (folder)
4. Launch the game normally.

### How to Activate In-Game:

- Press **`Insert`** on your keyboard while in-game to toggle the **OptiScaler GUI Overlay**.
- Under Upscaling / Frame Generation, enable **FSR 3 / DLSS-G Frame Generation**.
- Set **In-Game Graphics**: Enable **DLSS** or **FSR** with Super Resolution set to *Balanced* or *Quality*.
- Press **`Insert`** again to hide the menu and enjoy doubled framerates!

> [!TIP]
> To uninstall Frame Generation, simply delete `dxgi.dll`, `version.dll`, `OptiScaler.ini`, and the `OptiScaler` folder from `Client\Binaries\Win64\`.

---

## System Requirements

<div align="center">
  <img src="https://files.catbox.moe/qomanc.gif" width="115" alt="System Requirements" />
</div>

- **Operating System**: Windows 10 (64-bit) or Windows 11 (64-bit).
- **Game Installation**: Official Kuro Games Launcher or Epic Games Store build.
- **Storage**: Solid State Drive (NVMe or SATA SSD) strongly recommended. Unreal Engine 4 streaming pipelines experience disk latency hitches when run on mechanical HDDs.
- **Permissions**: Standard user access; Administrator access required if the game is located within protected directories (`C:\Program Files`).

---

## Installation Methods

### Method 1: Automated Script (Recommended)

<div align="center">
  <img src="https://files.catbox.moe/0anj40.gif" width="115" alt="Automated Script Switcher" />
</div>

The root of this repository includes an interactive batch utility: `Apply-Config.bat`.

1. Clone or download this repository.
2. Run `Apply-Config.bat`.
3. **Smart Auto-Detection**:
   - The script automatically scans all storage drives (`C:`, `D:`, `E:`, `F:`, etc.) and game shortcuts to locate your actual Wuthering Waves configuration directory (`...\Client\Saved\Config\WindowsNoEditor`).
   - Press **`1`** to confirm the auto-detected path, or **`2`** to enter a custom folder path manually.
4. Select your desired profile (`1` through `6`, or `7` to restore default settings).
5. The script automatically:
   - Creates a safety backup of your current setup (`Engine.ini.backup`).
   - Replaces `Engine.ini` with the selected profile.
   - Applies the **Read-Only** file attribute to prevent the game client from overwriting your custom configuration.

---

### Method 2: Manual Deployment

<div align="center">
  <img src="https://files.catbox.moe/uey3t1.gif" width="115" alt="Manual Deployment Confused" />
</div>

To install configurations manually:

1. Open your Wuthering Waves installation directory and navigate to the configuration folder:
   ```text
   <GameDirectory>\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor\
   ```
   *(Example: `C:\Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor\` or `F:\Games\Wuthering Waves\...\Client\Saved\Config\WindowsNoEditor\`)*

2. Create a backup of your existing `Engine.ini` file.
3. Open your chosen profile folder (e.g. `02 - CONFIG LOW`), open `engine.ini`, and copy its entire contents.
4. Paste the copied contents into the target `Engine.ini` and save the file.
5. **Mandatory Step**:
   - Right-click `Engine.ini` -> select **Properties**.
   - In the **General** tab, check the **Read-only** attribute box.
   - Click **Apply**, then **OK**.

> [!IMPORTANT]
> If you do not mark `Engine.ini` as **Read-only**, the Wuthering Waves launcher will overwrite your custom settings with default parameters upon startup.

---

## Recommended In-Game Settings

<div align="center">
  <img src="https://files.catbox.moe/7xttpk.gif" width="115" alt="Writing Settings Note" />
</div>

After deploying your configuration, align the in-game options via **Settings -> Graphics**:

- **Display Mode**: Fullscreen or Borderless Windowed.
- **Resolution**:
  - Low-Spec / iGPU: 1280x720 or 1600x900 if 1080p yields insufficient framerates.
  - Mid / High Spec: Monitor native resolution (1080p, 1440p, or 4K).
- **Framerate Limit**: Lock to **60 FPS** (or 45/30 FPS on 4-core CPUs to guarantee uniform frame delivery).
- **V-Sync**: **OFF** (use GPU driver-level G-Sync, FreeSync, or Fast Sync for tear-free output).
- **Motion Blur**: **OFF**.
- **Super Resolution (FSR / DLSS / Intel XeSS)**: Set to **Balanced** or **Performance** on lower-end systems.

---

## Frequently Asked Questions

<div align="center">
  <img src="https://files.catbox.moe/4h5u5c.gif" width="125" alt="Frequently Asked Questions" />
</div>

<details>
<summary><b>Is modifying Engine.ini or using OptiScaler bannable?</b></summary>
<br>

<div align="center">
  <img src="https://files.catbox.moe/u33k85.gif" width="110" alt="No Ban / Safe" />
</div>

<b>No.</b> Editing <code>Engine.ini</code> alters client-side rendering console variables exposed by Unreal Engine. OptiScaler acts as a direct translation layer between DirectX and rendering APIs. Neither touches game memory values, server-side data, or circumvents anti-cheat drivers (Anti-Cheat Expert / TpSafe).
</details>

<details>
<summary><b>Why do custom settings revert after exiting the game?</b></summary>
<br>
The game launcher detected an unprotected configuration file and regenerated it. Ensure you right-click <code>Engine.ini</code>, navigate to <b>Properties</b>, check the <b>Read-only</b> flag, and click Apply.
</details>

<details>
<summary><b>Can I combine an Engine.ini profile with Frame Generation?</b></summary>
<br>
<b>Yes!</b> They complement each other perfectly. The <code>Engine.ini</code> profile optimizes draw calls, eliminates traversal hitches, and guarantees smooth base frame delivery, while OptiScaler doubles your final output framerate. For optimal results, aim for a baseline of at least 45–60 FPS before enabling Frame Gen.
</details>

<details>
<summary><b>The game crashes or halts on the loading splash screen. What happened?</b></summary>
<br>
Ensure you copied the configuration file in its entirety. Every profile in this repository preserves the mandatory <code>[Core.System] Paths=...</code> declaration block required by Wuthering Waves to resolve plugin dependencies (such as LGUI, Puerts, and Wwise). Omitting this block will cause instant engine initialization failure. Additionally, verify that your hardware meets the VRAM allocation target of the selected profile.
</details>

<details>
<summary><b>How do I restore the factory default settings?</b></summary>
<br>
Execute <code>Apply-Config.bat</code> and select option <code>7 (RESTORE STOCK)</code>, or copy the contents of <code>engine-stock.ini</code> back into your active <code>Engine.ini</code>.
</details>

---

## Safety and Disclaimer

<div align="center">
  <img src="https://files.catbox.moe/ujuxu5.gif" width="115" alt="Safety Warning" />
</div>

- This is an independent, community-driven optimization project and is not affiliated with, maintained by, or officially endorsed by Kuro Games.
- Deploy the **`06 - CONFIG ULTRA EXTREME (WARNING)`** profile with discretion. Ensure adequate thermal headroom on your system, as it imposes substantial rendering stress on the GPU rasterization core and VRAM sub-systems.

---

<div align="center">
  <img src="https://files.catbox.moe/dj90gi.gif" width="130" alt="Enjoy Wuthering Waves" />
  <p><b>Enjoy smooth, stutter-free exploration across Solaris-3!</b></p>
</div>

---

## Contributing & Support

<div align="center">
  <img src="https://files.catbox.moe/cd0o84.gif" width="125" alt="Contributing" />
</div>

Technical proposals, benchmarks, and cvar refinements are welcome! Please open an **Issue** or submit a **Pull Request** documenting tested hardware specifications and performance deltas. If this framework helped improve your game performance, consider starring the repository!
