<div align="center">

# Wuthering Waves: Ultimate Optimization & Performance Suite

[![Game: Wuthering Waves](https://img.shields.io/badge/Game-Wuthering%20Waves-0284c7?style=flat-square&labelColor=082f49)](https://wutheringwaves.kurogames.com/)
[![Engine: Unreal Engine 4](https://img.shields.io/badge/Engine-Unreal%20Engine%204.26-6366f1?style=flat-square&logo=unrealengine&logoColor=white&labelColor=1e1b4b)](https://www.unrealengine.com/)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows%2010%20%2F%2011%20(64--bit)-0078d4?style=flat-square&logo=windows&logoColor=white&labelColor=002040)](#)
[![DirectX](https://img.shields.io/badge/DirectX-DX11%20%7C%20DX12-059669?style=flat-square&labelColor=064e3b)](#)
[![Hardware](https://img.shields.io/badge/Hardware-NVIDIA%20%7C%20AMD%20%7C%20Intel-4f46e5?style=flat-square&labelColor=1e1b4b)](#)
[![Status](https://img.shields.io/badge/Game%20Version-v3.0%20--%20v3.6%2B%20Ready-e11d48?style=flat-square&labelColor=4c0519)](#)
<br>
[![Frame Gen: OptiScaler](https://img.shields.io/badge/Frame%20Gen-OptiScaler%20%7C%20FSR%203-d946ef?style=flat-square&labelColor=500724)](#frame-generation-setup-optiscaler--fsr-3)
[![Upscaling](https://img.shields.io/badge/Upscaling-DLSS%20%7C%20FSR%20%7C%20XeSS-8b5cf6?style=flat-square&labelColor=3b0764)](#)
[![Target FPS](https://img.shields.io/badge/Target%20FPS-60%20--%20120%2B%20FPS-f59e0b?style=flat-square&labelColor=451a03)](#)
[![Shader Cache](https://img.shields.io/badge/Shader%20Pipeline-Async%20Pre--Cache-06b6d4?style=flat-square&labelColor=083344)](#)
[![Stability](https://img.shields.io/badge/Stability-Anti--Flicker%20Guarded-14b8a6?style=flat-square&labelColor=042f2e)](#)
[![Safety](https://img.shields.io/badge/Safety-100%25%20Client--Side-10b981?style=flat-square&labelColor=052e16)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-84cc16?style=flat-square&labelColor=1a2e05)](#)
[![Ko-fi: Support](https://img.shields.io/badge/Ko--fi-Support-ff5e5b?style=flat-square&logo=ko-fi&logoColor=white&labelColor=4a1525)](https://ko-fi.com/jonathanssa)

<p align="center">
  <img src="https://files.catbox.moe/4ravx1.gif" width="125" alt="Welcome to Wuthering Waves Optimization Suite" />
</p>

A precision-engineered **Wuthering Waves (WuWa) FPS boost & lag fix** suite featuring tuned `Engine.ini` performance configs and **OptiScaler FSR 3 Frame Generation** (Unreal Engine 4). Designed to eliminate traversal hitches, fix stuttering in Jinzhou, Rinascita, and Lahai-Roi, prevent ground texture flickering, and double framerates from low-end potato laptops to flagship gaming PCs.

</div>

---

## Table of Contents

- [Architectural Overview](#architectural-overview)
- [Profile Performance Matrix](#profile-performance-matrix)
- [Master Technical Comparison Matrix](#master-technical-comparison-matrix)
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
| `01 - CONFIG ULTRA LOW` | Dual/Quad Core, 4-8GB RAM, Intel HD / UHD | Shadows OFF, Foliage OFF, Fog OFF, Minimal Particles | 70% + Sharpening | 30 - 60 FPS |
| `02 - CONFIG LOW` | 4-Core CPU, 8GB RAM, iGPU 2GB VRAM | 1 Cascade (512p), Fog OFF, 1200MB Texture Pool | 85% + Sharpening | 45 - 60 FPS |
| `03 - CONFIG MED` | 4-6 Core, 8-16GB RAM, Dedicated 4GB VRAM | 2 Cascades (1024p), Light AO/SSR, Full-FPS Animations | 100% Native | 60 FPS Stable |
| `04 - CONFIG HIGH` | 6+ Core, 16GB RAM, Dedicated 6-8GB VRAM | 3 Cascades (2048p), Volumetric Fog, Distance Field Shadows | 100% Native | 60 - 120 FPS |
| `05 - CONFIG VERY HIGH` | 8+ Core, 16-32GB RAM, Dedicated 8-12GB VRAM | 4 Cascades (3072p), Dense Fog Grid, Full-Res Particles | 100% Native | 120+ FPS |
| `06 - CONFIG ULTRA EXTREME (WARNING)` | Flagship Rigs (RTX 4080/4090, RX 7900 XTX) | 5 Cascades (4096p), 200% Foliage, Lumen Reflections | 100% Native | Uncapped / Cinematic |

---

## Master Technical Comparison Matrix

<div align="center">
  <img src="https://files.catbox.moe/g909ko.gif" width="115" alt="Master Technical Comparison Matrix" />
</div>

Detailed side-by-side comparison of Unreal Engine 4 rendering parameters across all six performance profiles:

| Rendering Feature / Console Variable (cVar) | `01 - ULTRA LOW` | `02 - LOW` | `03 - MED` | `04 - HIGH` | `05 - VERY HIGH` | `06 - ULTRA EXTREME` |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Internal Render Scale** (`r.ScreenPercentage`) | **70%** | **85%** | **100% (Native)** | **100% (Native)** | **100% (Native)** | **100% (Native)** |
| **Tonemapper Sharpen** (`r.Tonemapper.Sharpen`) | **0.8 (Aggressive)** | 0.5 | 0.4 | 0.3 | 0.25 | 0.2 |
| **Anti-Aliasing** (`r.PostProcessAAQuality`) | **OFF (0)** | TAA Level 2 | TAA Level 2 | TAA Level 3 | TAA Level 4 | **TAA Level 4 (Max)** |
| **Dynamic Shadow Quality** (`r.ShadowQuality`) | **OFF (0)** | Level 1 | Level 2 | Level 3 | Level 4 | **Level 5 (Ultra)** |
| **Shadow Cascades** (`r.Shadow.CSM.MaxCascades`) | **0 (None)** | 1 Cascade | 2 Cascades | 3 Cascades | 4 Cascades | **5 Cascades (4K Split)** |
| **Shadow Buffer Resolution** (`r.Shadow.MaxResolution`) | 128p | 512p | 1024p | 2048p (2K) | 3072p (3K) | **4096p (4K UHD)** |
| **Shadow Distance Scale** (`r.Shadow.DistanceScale`) | 0.2x | 0.6x | 0.85x | 1.2x | 1.5x | **2.0x (200% Distance)** |
| **Distance Field Shadowing & Contact Shadows** | ❌ OFF | ❌ OFF | ❌ OFF | ✅ DF Quality 2 | ✅ DF Quality 3 | ✅ DF Quality 3 |
| **Volumetric Fog & 3D Cloud Pass** | ❌ OFF | ❌ OFF | ❌ OFF | ✅ Voxel (16x64) | ✅ Dense Voxel (8x128) | ✅ Ultra Dense (6x256) |
| **Ambient Occlusion** (`r.AmbientOcclusionLevels`) | ❌ OFF (0) | ❌ OFF (0) | Level 1 | Level 2 | Level 3 | **Level 3 (Max Quality 100)** |
| **Screen Space Reflections** (`r.SSR.Quality`) | ❌ OFF (0) | ❌ OFF (0) | Quality 1 | Quality 2 | Quality 3 | **Quality 4 (Max Roughness 1.0)** |
| **Foliage & Grass Density** (`foliage` / `grass`) | **0% (Stripped)** | 50% | 75% | 100% (Full) | 125% (Dense) | **200% (Lush Density)** |
| **World View Distance** (`r.ViewDistanceScale`) | 50% (0.5x) | 75% (0.75x) | 90% (0.9x) | 120% (1.2x) | 150% (1.5x) | **250% (2.5x Horizon)** |
| **Static Mesh LOD Distance (Anti-Flicker)** | 1.6 (Optimized) | 1.2 | 1.0 (Standard) | 0.85 (High) | 0.75 (Epic) | **0.65 (Anti-Flicker Guard)** |
| **Skeletal Mesh (Character) LOD Bias** | +3 (Lowest Poly) | +1 | 0 (Native) | 0 (Native) | 0 (Native) | **-1 (Max Polygon Cap)** |
| **GPU Video Hardware Decoding** | ✅ GPU Decode (0) | ✅ GPU Decode (0) | ✅ GPU Decode (0) | ✅ GPU Decode (0) | ✅ GPU Decode (0) | ✅ GPU Decode (0) |
| **Parallel Frustum Culling (No White Spots)** | ✅ Enabled (1) | ✅ Enabled (1) | ✅ Enabled (1) | ✅ Enabled (1) | ✅ Enabled (1) | ✅ Enabled (1) |
| **Full Animation Framerate in Hubs (`a.URO`)** | Stock (1) | Stock (1) | ✅ Unlocked (0) | ✅ Unlocked (0) | ✅ Unlocked (0) | ✅ Unlocked (0) |
| **Combat Particles Limit (CPU / GPU per Frame)** | 10 / 16 | 300 / 256 | 600 / 512 | 1000 / 1024 | 1800 / 2048 | **5000 / 8192** |
| **Niagara Particle Quality Level** | Level 0 | Level 0 | Level 1 | Level 2 | Level 3 | **Level 4** |
| **Texture Streaming Pool** (`r.Streaming.PoolSize`) | **500 MB** | **1,200 MB** | **2,400 MB** | **4,200 MB** | **6,500 MB** | **10,000 MB (10 GB VRAM)** |
| **Ray Tracing / Lumen Reflections** | N/A | N/A | N/A | N/A | N/A | **Async Compute + ScreenTraces 0** |
| **Anisotropic Filtering** (`r.MaxAnisotropy`) | Default | Default | Default | Default | Default | **16x Forced Engine-wide** |
| **Shader Cache Pre-compile Batch Size** | 15 | 30 | 50 | 100 | 150 | **300** |

---

## Profile Breakdown

### Preset 1: ULTRA LOW (Minimalist Potato Mode)

<div align="center">
  <img src="https://files.catbox.moe/342906.gif" width="115" alt="Preset 1 Potato Mode" />
</div>

Specially engineered for low-specification machines, dual/quad-core processors, legacy integrated graphics (Intel HD 520/620/630, UHD 620), and systems constrained to 4GB–8GB of RAM. The sole objective is **absolute maximum playable framerate (30–60 FPS)** by gutting unnecessary rasterization workloads.

#### 🔻 Elements Reduced / Removed (Reduced Overhead):
- **Dynamic Shadows Completely Disabled**: Dynamic shadows and Cascaded Shadow Maps (CSM) are eliminated (`r.ShadowQuality=0`, `r.Shadow.CSM.MaxCascades=0`, buffer resolution reduced to 128p). Eliminates thousands of shadow draw calls per frame for massive CPU and GPU fillrate headroom.
- **Vegetation & Grass Stripped**: Procedural foliage and grass density are reduced to zero (`foliage.DensityScale=0`, `grass.DensityScale=0`), completely removing grass blade rendering across the terrain.
- **Atmospheric Passes Disabled**: Volumetric fog, 3D volumetric clouds, and light shafts (god rays) are turned off (`=0`) to eliminate heavy rasterizer load on integrated graphics.
- **Occlusion & Reflections Disabled**: Ambient Occlusion (`r.AmbientOcclusionLevels=0`) and Screen Space Reflections (`r.ScreenSpaceReflections=0`) are completely disabled.
- **Heavy Post-Processing Stripped**: Blinding FFT bloom (`r.Kuro.KuroEnableFFTBloom=0`, `r.Kuro.KuroBloomStreak=0`), Niagara radial combat blur (`r.Kuro.NiagaraBlur.Enable=0`), Lens Flare, Depth of Field, Chromatic Aberration, and Film Grain are all disabled.
- **Anti-Aliasing Disabled**: Post-processing anti-aliasing is turned off (`r.PostProcessAAQuality=0`, `r.DefaultFeature.AntiAliasing=0`) for the lowest possible input latency and zero shader overhead.
- **Combat Particles Strictly Capped**: Combat effects are capped to just 10 CPU particles and 16 GPU particles per frame (`fx.Niagara.QualityLevel=0`), preventing combat hitching during chaotic mob encounters.
- **Conservative 500MB Texture Cache**: Texture streaming pool is constrained to 500MB (`r.Streaming.PoolSize=500`), preventing Windows swapfile paging spikes and Out-of-Memory (OOM) crashes on 4GB–8GB RAM setups.
- **Internal Resolution Downscaled to 70%**: Internal rendering resolution is reduced to 70% of native display resolution (`r.ScreenPercentage=70`).

#### 🔺 Elements Added / Enhanced (Engine Optimizations):
- **GPU Hardware Video Decoding**: Forces hardware video decoding (`Electra.PC.UseSoftwareDecoding=0`), offloading cutscene playback and burst animation rendering from the CPU to the GPU.
- **Anti-Flicker LOD Guardrail**: Static mesh LOD distance scaling tuned to `1.6` (`r.StaticMeshLODDistanceScale=1.6`), giving high framerates while preventing distant objects from abruptly disappearing.
- **Foliage Draw Call Optimization**: Draw call optimization for foliage density LOD is active (`foliage.DensityScaleLOD.DrawCallOptimize=1`).
- **Parallel Frustum Culling**: Toggles multithreaded frustum culling (`r.ParallelFrustumCull=1`) to eliminate camera swing white spots and visual pop-in.
- **Aggressive Tonemapper Sharpening Filter**: Sharpness is boosted to 0.8 (`r.Tonemapper.Sharpen=0.8`) to restore image clarity and edge definition lost to the 70% resolution scale.
- **Asynchronous Shader Pre-caching**: Engine asynchronous shader pipeline caching is activated (`r.CreateShadersOnLoad=1`, `r.Shaders.Optimize=1`, batch size 15) to minimize traversal hitches and shader compilation drops.
- **Multi-threaded CPU Render Pipeline**: Forces Unreal Engine to utilize all available CPU cores via parallel draw pass setup and RHI worker threads (`r.ParallelRendering=1`, `r.MeshDrawCommands.ParallelPassSetup=1`, `r.RHICmdUseThread=1`, `r.RHICmdUseDeferredContexts=1`).
- **Memory Safety Guardrails**: Enforces hard VRAM pool limits (`r.Streaming.LimitPoolSizeToVRAM=1`) and Kuro streaming priority (`r.Streaming.UsingKuroStreamingPriority=3`).

---

### Preset 2: LOW (4-Core CPU, 8GB RAM, 2GB iGPU)

<div align="center">
  <img src="https://files.catbox.moe/a0xz2j.gif" width="115" alt="Preset 2 Low Spec" />
</div>

Calibrated specifically for modern laptops and desktops running integrated GPUs (Intel Iris Xe, AMD Radeon Vega 6/7/8) or entry-level discrete GPUs (GeForce MX Series) with 8GB of system RAM. Targets a **stable 45–60 FPS** while maintaining core visual elements so the game world does not look barren.

#### 🔻 Elements Reduced / Constrained:
- **Atmospheric Passes Kept Off**: Volumetric fog and volumetric clouds remain disabled (`=0`) to preserve fillrate on memory-bandwidth-limited iGPUs.
- **Occlusion & Reflections Kept Off**: Ambient Occlusion and Screen Space Reflections remain disabled (`=0`).
- **Simplified Single-Cascade Shadowing**: Shadows are capped at a single cascade with a 512x512 buffer (`r.Shadow.CSM.MaxCascades=1`, `r.Shadow.MaxResolution=512`, DistanceScale 0.6). Contact shadows and distance field shadowing remain off (`=0`).
- **Vegetation Density Halved**: Grass and tree density are reduced by 50% (`foliage.DensityScale=0.5`, `grass.DensityScale=0.5`).
- **Draw Distance Capped at 75%**: World view distance is scaled to 75% (`r.ViewDistanceScale=0.75`), with static mesh LOD scale 1.2 and skeletal mesh LOD bias 1.
- **Cinematic Passes Disabled**: Motion Blur, Depth of Field, Lens Flare, and Translucency Volume Blur remain disabled (`=0`).
- **Blinding Passes Removed**: FFT bloom and Niagara radial combat blur disabled for clean visual contrast.
- **Internal Resolution Scaled to 85%**: Render scale is tuned to 85% (`r.ScreenPercentage=85`), providing necessary breathing room on 1080p and 720p screens.
- **Strict 1200MB Texture Pool**: Texture streaming cache is capped at 1200MB (`r.Streaming.PoolSize=1200`), ensuring dynamic VRAM carving does not starve system RAM.

#### 🔺 Elements Added / Restored:
- **GPU Hardware Video Decoding**: Forces hardware video decoding (`Electra.PC.UseSoftwareDecoding=0`) for stutter-free cutscenes.
- **Smooth Temporal Anti-Aliasing (TAA Level 2)**: Re-enables TAA at Level 2 (`r.PostProcessAAQuality=2`, CurrentFrameWeight 0.25) to eliminate pixel shimmer and jagged edges without heavy GPU penalty.
- **Restored Dynamic Grounding Shadows**: Single-cascade dynamic shadows restore essential depth, preventing characters and enemies from appearing to float.
- **Parallel Frustum Culling**: Multithreaded frustum culling enabled (`r.ParallelFrustumCull=1`) to eliminate white flashes during fast camera turns.
- **Foliage Draw Call Optimization**: `foliage.DensityScaleLOD.DrawCallOptimize=1` keeps foliage batch overhead minimal.
- **Restored Eye Adaptation & Subtle Bloom**: Eye adaptation (`r.EyeAdaptationQuality=1`), Bloom Level 1, and Tonemapper Quality 1 are restored for smooth outdoor-to-indoor lighting transitions.
- **Compensatory Tonemapper Sharpening (0.5)**: Tonemapper sharpen is set to 0.5 (`r.Tonemapper.Sharpen=0.5`) to preserve crisp character edges at 85% render scale.
- **Expanded Combat Particle Budget**: Particle headroom is expanded to 300 CPU particles and 256 GPU particles per frame, ensuring skill animations and visual burst cues remain clear during combat.
- **Enhanced Shader Pipeline Cache**: Batch size increased to 30 with a background batch size of 5 for smooth open-world traversal.

---

### Preset 3: MEDIUM (GTX 1050 Ti / GTX 1650, 4GB VRAM)

<div align="center">
  <img src="https://files.catbox.moe/83a96b.gif" width="115" alt="Preset 3 Medium Balanced" />
</div>

A balanced configuration engineered to lock a stable **60 FPS** on entry-level dedicated gaming GPUs with 4GB VRAM (GTX 1050 Ti, GTX 1650, GTX 1060 3GB, RX 570 4GB, RTX 3050 4GB Laptop).

#### 🔻 Elements Reduced / Constrained:
- **Volumetric Fog & Clouds Kept Off**: Volumetric fog and 3D clouds remain disabled (`=0`) to guarantee an unwavering 60 FPS in foggy ravines or mountain peaks.
- **Contact & Distance Field Shadows Kept Off**: Contact shadows and distance field shadowing remain off (`=0`) to protect the 4GB GPU fillrate budget.
- **Vegetation Capped at 75%**: Grass and foliage density are capped at 75% (`foliage.DensityScale=0.75`, `grass.DensityScale=0.75`) with 90% view distance (`r.ViewDistanceScale=0.9`) for smooth combat frame pacing.
- **Cinematic Passes Disabled**: Motion Blur and Depth of Field remain disabled (`=0`) for competitive visual clarity.

#### 🔺 Elements Added / Enhanced:
- **100% Native Render Scale**: Renders at 100% native display resolution (`r.ScreenPercentage=100`), delivering crisp, pixel-perfect visuals without upsampling artifacts.
- **Full Animation Framerate in Hub Cities**: Disables Update Rate Optimization (`a.URO.Enable=0`, `a.URO.EnableScreenRatio=0`), completely restoring full 60 FPS character and NPC animations in Jinzhou, Rinascita, and crowded settlements.
- **Parallel Frustum Culling**: Enabled (`r.ParallelFrustumCull=1`) to eliminate camera swing white spots and geometry pop-in.
- **GPU Hardware Video Decoding**: Active (`Electra.PC.UseSoftwareDecoding=0`) for lag-free cinematic sequences.
- **Ambient Occlusion Enabled**: Level 1 Ambient Occlusion (`r.AmbientOcclusionLevels=1`, Intensity 0.9) adds subtle, natural contact shading under crevices, clothing folds, and objects.
- **Screen Space Reflections (SSR Enabled)**: Real-time reflections on water surfaces, puddles, and reflective tiles are activated with full roughness range (`r.ScreenSpaceReflections=1`, `r.SSR.Quality=1`, `r.SSR.MaxRoughness=1.0`).
- **Crisp 2-Cascade Shadows (1024p)**: Shadow resolution is doubled to 1024x1024 with 2 cascades (`r.ShadowQuality=2`, `r.Shadow.CSM.MaxCascades=2`, DistanceScale 0.85) and per-object character shadow resolution of 1024 (`r.Shadow.PerObjectResolutionMax=1024`).
- **Lighting & Atmospheric Rays**: Light shafts (god rays) enabled (`r.LightShaftQuality=1`), Bloom Level 2, Lens Flare Level 1, and Light Function Quality Level 1.
- **Full Model Detail (LOD 0 Characters)**: Characters are rendered at full polygon detail with zero mesh bias (`r.SkeletalMeshLODBias=0`), standard static mesh LOD scale 1.0.
- **2,400MB Dedicated Texture Pool**: Texture streaming cache allocated to 2,400MB (`r.Streaming.PoolSize=2400`), maximizing 4GB VRAM throughput without texture streaming hitches.
- **Expanded Particle Budget**: Raised to 600 CPU and 512 GPU particles per frame with Niagara Quality Level 1.

---

### Preset 4: HIGH (RTX 2060 / 3060 / 4060, 6GB-8GB VRAM)

<div align="center">
  <img src="https://files.catbox.moe/r5a2bh.gif" width="115" alt="Preset 4 High Sweet Spot" />
</div>

Targets high visual fidelity with deep dynamic lighting and rich environmental detail for modern mainstream GPUs with 6GB–8GB of dedicated VRAM (RTX 2060, RTX 3060, RTX 4060, RX 6600, RX 7600, Intel Arc A750). Target framerate: **60–120 FPS**.

#### 🔻 Tailored Constraints:
- **Motion Blur & Depth of Field Kept Off**: Disabled (`=0`) for optimal clarity during high-speed combat.
- **Optimized Voxel Fog Grid**: Voxel grid resolution is tuned for optimal performance (`GridPixelSizeK=16`, `GridSizeZ=64`), providing atmospheric fog without sacrificing high refresh rates.

#### 🔺 Significant Elements Added & Enhanced:
- **NVIDIA Reflex Low Latency Mode**: Engine-level Reflex low latency integration enabled (`t.Streamline.Reflex.Enable=1`) for ultra-responsive combat dodging and parrying.
- **Full Volumetric Fog & 3D Clouds**: Volumetric fog and 3D cloud layers activated (`r.VolumetricFog=1`, `r.VolumetricCloud=1`), producing dramatic sunbeams (god rays) streaming through cliffs and tree canopies.
- **2K Shadows with 3 Cascades**: Shadow buffers upgraded to 2048x2048 across 3 cascades (`r.Shadow.MaxResolution=2048`, `r.Shadow.CSM.MaxCascades=3`), with shadow projection distance expanded to 120% (`r.Shadow.DistanceScale=1.2`).
- **Contact Shadows & Distance Field Shadowing**: Enabled (`r.ContactShadows=1`, `r.DistanceFieldShadowing=1`, `r.DFShadowQuality=2`), rendering sharp micro-shadows beneath pebbles, foliage, character hair, and armor.
- **Extended Foliage Cull Distances**: Foliage culling distances pushed far out (`r.Kuro.Foliage.NearCullDistanceMax=9750`, `FarCullDistanceMax=22500`, `Grass3_0CullDistanceMax=30000`) with `foliage.DensityScaleLOD.DrawCallOptimize=1`.
- **Full Hub Animations**: Update Rate Optimization disabled (`a.URO.Enable=0`, `a.URO.EnableScreenRatio=0`), eliminating low-FPS character stutters in Jinzhou and Rinascita.
- **Parallel Frustum Culling**: Multithreaded frustum culling enabled (`r.ParallelFrustumCull=1`).
- **High-Tier Ambient Occlusion & SSR**: AO increased to Level 2 (`r.AmbientOcclusionLevels=2`), SSR upgraded to Quality 2 with `r.SSR.MaxRoughness=1.0`.
- **100% Full Vegetation & 120% View Distance**: Foliage and grass density restored to full 100% (`foliage.DensityScale=1.0`, `grass.DensityScale=1.0`), view distance scaled to 120% (`r.ViewDistanceScale=1.2`), and tight static mesh LOD 0.85.
- **Level 3 Anti-Aliasing**: PostProcessAAQuality=3 with TAA frame weight 0.20 for smooth edge definition without temporal smearing.
- **4,200MB Dedicated Texture Pool**: 4.2GB texture cache allocated (`r.Streaming.PoolSize=4200`, Streaming Boost 1) for instantaneous high-resolution texture streaming.
- **Dynamic Combat Particles**: Raised to 1000 CPU and 1024 GPU particles per frame, Niagara Quality Level 2, Bloom Level 3, and Lens Flare 2.

---

### Preset 5: VERY HIGH (RTX 3070 / 3080 / 4070, 8GB-12GB VRAM)

<div align="center">
  <img src="https://files.catbox.moe/amzdee.gif" width="115" alt="Preset 5 Very High 120 FPS" />
</div>

Engineered for enthusiast rigs and high-refresh-rate displays (120Hz – 165Hz+). Features extended draw distances, dense foliage, and ultra-crisp 3K shadows on GPUs with 8GB–12GB VRAM.

#### 🔻 Tuned Constraints:
- Motion Blur and Depth of Field remain disabled (`=0`).
- Tonemapper Sharpen softened to 0.25 (`r.Tonemapper.Sharpen=0.25`), as native resolution and high-tier AA naturally provide crisp visual clarity without artificial sharpening.

#### 🔺 Enthusiast Elements Added & Enhanced:
- **3K Crisp Shadows with 4 Cascades**: Shadow resolution elevated to 3072x3072 with 4 cascading splits (`r.Shadow.MaxResolution=3072`, `r.Shadow.CSM.MaxCascades=4`), with shadow distance extended to 150% (`r.Shadow.DistanceScale=1.5`, RadiusThreshold 0.02) to keep distant structures sharply shadowed.
- **Epic Distance Field Shadows**: Quality set to Level 3 (`r.DistanceFieldShadowing=1`, `r.DFShadowQuality=3`).
- **2x Denser Voxel Fog Grid**: Fog voxel grid resolution doubled (`GridPixelSizeK=8`, `GridSizeZ=128`), producing silky-smooth volumetric light scattering without voxel grid banding.
- **Full-Resolution Translucency Pass**: Enabled (`r.KuroDownsampleTranslucencyFullRes=true`) to preserve pristine sharpness during spectacular elemental burst skills.
- **Full-Resolution Scene Reflections**: HalfResSceneColor disabled (`r.SSR.HalfResSceneColor=0`, `r.SSR.MaxRoughness=1.0`, Quality 3) for clean, high-definition puddle and water reflections.
- **Dense Foliage (125%) & 150% View Distance**: Foliage and grass density increased to 125% (`foliage.DensityScale=1.25`, `grass.DensityScale=1.25`), with world view distance extended to 150% (`r.ViewDistanceScale=1.5`).
- **Tighter Mesh LOD Scaling (0.75x)**: Static Mesh LOD distance scale tightened to 0.75 (`r.StaticMeshLODDistanceScale=0.75`), forcing distant 3D models to retain high-polygon assets much further out before switching LODs.
- **NVIDIA Reflex Low Latency**: Enabled (`t.Streamline.Reflex.Enable=1`).
- **Full Hub Animations & Zero Culling White Spots**: `a.URO.Enable=0`, `a.URO.EnableScreenRatio=0`, and `r.ParallelFrustumCull=1`.
- **Maximum Ambient Occlusion & SSR**: AO increased to Level 3 (`r.AmbientOcclusionLevels=3`), SSR upgraded to Quality 3.
- **Maximum Anti-Aliasing (Level 4)**: PostProcessAAQuality=4 with TAA frame weight 0.18.
- **6,500MB Dedicated Texture Pool**: 6.5GB texture streaming cache (`r.Streaming.PoolSize=6500`) with high-speed update cycles, completely eliminating texture pop-in.
- **Massive Combat Particle Allowance**: Raised to 1800 CPU and 2048 GPU particles per frame, Niagara Quality Level 3, supporting spectacle-heavy 120+ FPS combat.

---

### Preset 6: ULTRA EXTREME (WARNING: Flagship Hardware Melter)

<div align="center">
  <img src="https://files.catbox.moe/omzl8c.gif" width="115" alt="Preset 6 Ultra Melter" />
</div>

An **uncompromising flagship profile** engineered exclusively for top-tier hardware (RTX 4080, RTX 4090, RX 7900 XTX) and systems with 32GB–64GB of RAM. Strips away engine throttling and unleashes Unreal Engine 4 rendering subsystems with dedicated anti-flicker stability guardrails.

#### 🔻 Anti-Flicker Guardrails & Unconstrained Hardware Allocation:
- **Zero Ground Flickering Guardrail**: Static mesh LOD distance scale is calibrated to `0.65` (`r.StaticMeshLODDistanceScale=0.65`). In Wuthering Waves' engine build, values below 0.5 cause aggressive terrain z-fighting and severe ground texture strobing/flickering. At 0.65, distant objects retain maximum geometric detail while ground textures remain 100% rock-solid.
- **Rock-Solid 100% Native Render Scale**: Renders at 100% native resolution (`r.ScreenPercentage=100`), eliminating sub-pixel temporal noise and supersampling pipeline hitches.
- **10,000MB (10GB) Dedicated Texture Cache**: Texture pool expanded to 10,000MB (`r.Streaming.PoolSize=10000`) with uncapped streaming bandwidth, delivering instant asset streaming without VRAM thrashing.

#### 🔺 Flagship Overkill Features Added:
- **Lumen & Ray Traced Reflection Optimization**: Async compute Lumen reflections enabled (`r.Lumen.Reflections.AsyncCompute=1`), screen traces disabled (`r.Lumen.Reflections.ScreenTraces=0`) to permanently eliminate SSR-like blocky ghosting artifacts on characters, with smooth roughness bias (`r.Lumen.Reflections.SmoothBias=1.0`).
- **Cinematic 4K Shadows (4096p) with 5 Cascades**: 5 cascading splits with massive 4096x4096 buffers (`r.Shadow.MaxResolution=4096`, `r.Shadow.CSM.MaxCascades=5`, ShadowQuality=5), 200% shadow projection distance (`r.Shadow.DistanceScale=2.0`, RadiusThreshold 0.01), and Level 3 Distance Field Shadows (`r.DFShadowQuality=3`).
- **Atmospherics & God Rays**: Ultra-dense volumetric fog voxel grid (`GridPixelSizeK=6`, `GridSizeZ=256`), PC-quality Tyndall light shaft scattering (`r.TyndallScatteringQuality=1`, `r.LightShaftDownSampleFactor=1`), and high-quality volumetric cloud simulation (`r.VolumetricCloud.HighQuality=1`).
- **Interactive Water Ripples**: C++ interaction water ripples enabled (`r.Kuro.InteractionEffect.UseCppWaterEffect=1`) when flying close or casting skills over water bodies.
- **Extended Planned Loading Range**: `wp.Runtime.PlannedLoadingRangeScale=1.0` and `r.Kuro.NpcDisappearDistance=20000` for long-range asset retention.
- **200% Foliage Density & 250% View Distance**: Foliage and grass density boosted to 200% (`foliage.DensityScale=2.0`, `grass.DensityScale=2.0`) with a 250% horizon view distance (`r.ViewDistanceScale=2.5`), transforming Solaris-3 into an ultra-lush wilderness.
- **Forced 16x Anisotropic Filtering**: 16x texture anisotropic filtering enforced engine-wide (`r.MaxAnisotropy=16`), ensuring surface textures remain pin-sharp at oblique viewing angles.
- **Full Hub Animations & Zero Culling White Spots**: `a.URO.Enable=0`, `a.URO.EnableScreenRatio=0`, and `r.ParallelFrustumCull=1` ensure silky 60+ FPS NPC animations and zero geometry flashing when panning the camera.
- **Particle Flood (5000 CPU / 8192 GPU)**: Particle caps unlocked to 5,000 CPU and 8,192 GPU particles per frame, Niagara Quality Level 4, Bloom Quality Level 4, and Lens Flare Level 3 for cinematic CGI-tier combat simulation.

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
<summary><b>How do I fix stuttering, FPS drops, and ground texture flickering in Wuthering Waves?</b></summary>
<br>
Every preset in this repository applies verified Unreal Engine 4 fixes: asynchronous shader pre-caching eliminates traversal stutters, <code>r.ParallelFrustumCull=1</code> removes camera-turn white flashes, <code>a.URO.Enable=0</code> (Medium and above) restores smooth 60 FPS NPC/character animations in Jinzhou and Rinascita, and keeping <code>r.StaticMeshLODDistanceScale</code> at <code>0.65</code> or higher prevents ground texture flickering.
</details>

<details>
<summary><b>How to get 120 FPS or enable Frame Generation on GTX 1650, RTX 2060, RTX 3060, or AMD RX GPUs?</b></summary>
<br>
Since Wuthering Waves restricts native DLSS Frame Generation to RTX 40-series cards, use the included <code>07 - ENABLE FRAMEGEN</code> (OptiScaler + FSR 3) package alongside any <code>Engine.ini</code> profile. It unlocks smooth Frame Generation on GTX 16-series, RTX 20/30-series, AMD Radeon RX 6000/7000, and Intel Arc GPUs.
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

> [!NOTE]
> ### A Personal Note from the Creator
> 
> **[ID] Bahasa Indonesia:**  
> *"Jujur, proyek ini gw buat bener-bener dari hati karena gw pernah ngerasain sendiri suramnya main di device spek ultra low—patah-patah, drop fps, sampe nge-lag parah gak karuan. Lewat config ini, gw pengen bagiin semua optimasi terbaik yang gw bisa biar lu semua sesama Rover tetep bisa enjoy explore Solaris-3 dengan lancar dan nyaman, gak peduli se-kentang apa pun device lu."*
> 
> **[EN] English:**  
> *"I built this project wholeheartedly because I've experienced firsthand the struggle of playing on low-end potato devices with constant stutters and unplayable frame drops. Through this optimization suite, I want to share the best tweaks I can offer so that every fellow Rover can explore Solaris-3 smoothly and comfortably, no matter what PC you're rocking."*
> 
> — **JonathanHS**

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

<br>

<div align="center">

<a href="https://ko-fi.com/jonathanssa" target="_blank" rel="noopener noreferrer">
  <img src="./assets/kofi-widget.svg" width="310" alt="Buy Me a Coffee on Ko-fi" />
</a>

<p><sub>Enjoying the FPS boost? Fuel future engine updates and optimizations with a cup of coffee! ☕</sub></p>

<br>

<p><sub><b>Search Tags:</b> Wuthering Waves Engine.ini config · WuWa FPS boost · Wuthering Waves lag fix · Low-end / Potato PC optimization · Stutter &amp; Flicker fix · OptiScaler FSR 3 Frame Generation · 120 FPS unlock · Unreal Engine 4 performance tweaks</sub></p>

</div>
