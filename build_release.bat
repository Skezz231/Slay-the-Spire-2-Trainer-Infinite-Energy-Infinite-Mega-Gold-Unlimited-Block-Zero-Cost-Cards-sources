@echo off
setlocal enabledelayedexpansion

echo ========================================
echo  Slay the Spire 2 - UI Showcase Builder
echo  Educational Win32 + GDI+ Project
echo ========================================
echo.

REM Check if Visual Studio is available
where cl >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Visual Studio compiler not found!
    echo.
    echo Please run this from:
    echo - Developer Command Prompt for VS 2022
    echo - Or run: "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
    echo.
    pause
    exit /b 1
)

echo [INFO] Compiling SlayTheSpire2_UIShowcase.exe...
echo.

cl /EHsc /O2 /MT /GS /Fe:SlayTheSpire2_UIShowcase.exe ^
   SlayTheSpire2Trainer.cpp ^
   gdiplus.lib user32.lib gdi32.lib ^
   /link /SUBSYSTEM:WINDOWS /ENTRY:wWinMainCRTStartup ^
   /MANIFEST:EMBED /MANIFESTINPUT:SlayTheSpire2UIShowcase.manifest

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Compilation failed!
    pause
    exit /b 1
)

REM Clean up intermediate files
if exist SlayTheSpire2Trainer.obj del SlayTheSpire2Trainer.obj

echo.
echo ========================================
echo  BUILD SUCCESSFUL!
echo ========================================
echo.
echo Output: SlayTheSpire2_UIShowcase.exe
echo.
echo This is a 100%% legitimate educational program!
echo - NO game hacking functionality
echo - NO malware or viruses
echo - Only UI demonstration
echo.
echo If antivirus flags it - it's a FALSE POSITIVE.
echo See ANTIVIRUS_FALSE_POSITIVE.md for details.
echo.
echo ========================================
pause
