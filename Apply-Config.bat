@echo off
setlocal enabledelayedexpansion
title Wuthering Waves - Config Switcher

echo ========================================================
echo      WUTHERING WAVES ENGINE CONFIGURATION SWITCHER      
echo ========================================================
echo.

set "DETECTED_PATH="

REM 1. Fast drive scan across common game directories (C through K)
for %%D in (C D E F G H I J K) do (
    if not defined DETECTED_PATH (
        if exist "%%D:\Games\Wuthering Waves\Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor" (
            set "DETECTED_PATH=%%D:\Games\Wuthering Waves\Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor"
        ) else if exist "%%D:\Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor" (
            set "DETECTED_PATH=%%D:\Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor"
        ) else if exist "%%D:\Games\Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor" (
            set "DETECTED_PATH=%%D:\Games\Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor"
        ) else if exist "%%D:\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor" (
            set "DETECTED_PATH=%%D:\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor"
        ) else if exist "%%D:\Program Files\Epic Games\WutheringWaves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor" (
            set "DETECTED_PATH=%%D:\Program Files\Epic Games\WutheringWaves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor"
        ) else if exist "%%D:\SteamLibrary\steamapps\common\Wuthering Waves\Client\Saved\Config\WindowsNoEditor" (
            set "DETECTED_PATH=%%D:\SteamLibrary\steamapps\common\Wuthering Waves\Client\Saved\Config\WindowsNoEditor"
        ) else if exist "%%D:\Program Files (x86)\Steam\steamapps\common\Wuthering Waves\Client\Saved\Config\WindowsNoEditor" (
            set "DETECTED_PATH=%%D:\Program Files (x86)\Steam\steamapps\common\Wuthering Waves\Client\Saved\Config\WindowsNoEditor"
        )
    )
)

REM 2. Fallback to desktop shortcut resolution if not found by drive loop
if not defined DETECTED_PATH (
    for /f "delims=" %%I in ('powershell -NoProfile -Command "$sh=New-Object -ComObject WScript.Shell; Get-ChildItem -Path @(\"$env:USERPROFILE\Desktop\",\"$env:PUBLIC\Desktop\") -Filter \"*Wuthering*.lnk\" -ErrorAction SilentlyContinue | ForEach-Object { $t=$sh.CreateShortcut($_.FullName).TargetPath; if ($t) { $d=Split-Path $t; @(Join-Path $d \"Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor\", Join-Path $d \"Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor\", Join-Path $d \"Client\Saved\Config\WindowsNoEditor\") | ForEach-Object { if (Test-Path $_) { $_; exit } } } }"') do (
        set "DETECTED_PATH=%%I"
    )
)

if defined DETECTED_PATH (
    echo [FOUND] Auto-detected game configuration directory:
    echo "!DETECTED_PATH!"
    echo.
    echo Target Directory:
    echo [1] Use auto-detected path (Recommended)
    echo [2] Enter custom path manually
    echo.
    set /p TARGET_CHOICE="Select target path [1/2] (Default is 1): "
    if "!TARGET_CHOICE!"=="2" (
        set /p GAME_PATH="Enter the folder path where Engine.ini is located: "
    ) else (
        set "GAME_PATH=!DETECTED_PATH!"
    )
) else (
    echo [NOTICE] Could not automatically locate Wuthering Waves directory.
    echo Please specify the folder path where Engine.ini is located.
    echo (Example: F:\Games\Wuthering Waves\Wuthering Waves\Wuthering Waves Game\Client\Saved\Config\WindowsNoEditor)
    echo.
    set /p GAME_PATH="Enter config folder path: "
)

if not exist "%GAME_PATH%" (
    echo.
    echo Target folder does not exist yet. Creating directory:
    echo "%GAME_PATH%"
    mkdir "%GAME_PATH%" 2>nul
)

:MENU
cls
echo ========================================================
echo      WUTHERING WAVES ENGINE CONFIGURATION SWITCHER      
echo ========================================================
echo Target: "%GAME_PATH%"
echo.
echo Select Profile:
echo [1] ULTRA LOW         (Potato Mode, All FX Off, Max FPS)
echo [2] LOW               (4-Core CPU, 8GB RAM, iGPU 2GB VRAM)
echo [3] MEDIUM            (Balanced 60 FPS, GTX 1050Ti/1650 4GB)
echo [4] HIGH              (Enhanced Lighting, RTX 2060/3060 6-8GB)
echo [5] VERY HIGH         (Enthusiast Fidelity, RTX 3070/3080/4070)
echo [6] ULTRA EXTREME (WARNING) (Insane 4K Overkill, RTX 4080/4090 32GB)
echo [7] RESTORE STOCK     (Default Vanilla Game Settings)
echo [0] Exit
echo.
set /p PROFILE_CHOICE="Enter your choice [0-7]: "

if "%PROFILE_CHOICE%"=="1" (
    set "SRC_CONFIG=%~dp001 - CONFIG ULTRA LOW\engine.ini"
    set "PROFILE_NAME=ULTRA LOW"
) else if "%PROFILE_CHOICE%"=="2" (
    set "SRC_CONFIG=%~dp002 - CONFIG LOW\engine.ini"
    set "PROFILE_NAME=LOW"
) else if "%PROFILE_CHOICE%"=="3" (
    set "SRC_CONFIG=%~dp003 - CONFIG MED\engine.ini"
    set "PROFILE_NAME=MEDIUM"
) else if "%PROFILE_CHOICE%"=="4" (
    set "SRC_CONFIG=%~dp004 - CONFIG HIGH\engine.ini"
    set "PROFILE_NAME=HIGH"
) else if "%PROFILE_CHOICE%"=="5" (
    set "SRC_CONFIG=%~dp005 - CONFIG VERY HIGH\engine.ini"
    set "PROFILE_NAME=VERY HIGH"
) else if "%PROFILE_CHOICE%"=="6" (
    set "SRC_CONFIG=%~dp006 - CONFIG ULTRA EXTREME (WARNING)\engine.ini"
    set "PROFILE_NAME=ULTRA EXTREME (WARNING)"
) else if "%PROFILE_CHOICE%"=="7" (
    set "SRC_CONFIG=%~dp0engine-stock.ini"
    set "PROFILE_NAME=STOCK DEFAULT"
) else if "%PROFILE_CHOICE%"=="0" (
    exit /b
) else (
    echo Invalid selection. Press any key to try again...
    pause >nul
    goto MENU
)

set "DEST_CONFIG=%GAME_PATH%\Engine.ini"

echo.
echo --------------------------------------------------------
if exist "%DEST_CONFIG%" (
    if not exist "%GAME_PATH%\Engine.ini.backup" (
        echo [INFO] Creating first-time backup: Engine.ini.backup
        copy /y "%DEST_CONFIG%" "%GAME_PATH%\Engine.ini.backup" >nul
    )
    echo [INFO] Removing Read-Only attribute from old Engine.ini...
    attrib -r "%DEST_CONFIG%" 2>nul
)

echo [INFO] Applying %PROFILE_NAME% configuration...
copy /y "%SRC_CONFIG%" "%DEST_CONFIG%" >nul

if %ERRORLEVEL% equ 0 (
    echo [INFO] Setting Engine.ini to Read-Only so game cannot reset it...
    attrib +r "%DEST_CONFIG%" 2>nul
    echo.
    echo ========================================================
    echo SUCCESS: %PROFILE_NAME% profile successfully applied!
    echo ========================================================
) else (
    echo.
    echo [ERROR] Failed to copy configuration file. Please check permissions.
)

echo.
pause

