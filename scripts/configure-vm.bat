@echo off
REM ============================================
REM macOS VirtualBox Configuration Script
REM For Windows
REM ============================================

echo.
echo ========================================
echo  macOS VirtualBox Configuration Script
echo ========================================
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script must be run as Administrator!
    echo Right-click the script and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

REM Set VirtualBox path
set "VBOX_PATH=C:\Program Files\Oracle\VirtualBox\"

REM Check if VirtualBox is installed
if not exist "%VBOX_PATH%VBoxManage.exe" (
    echo ERROR: VirtualBox not found at: %VBOX_PATH%
    echo Please install VirtualBox or update the VBOX_PATH variable
    echo.
    pause
    exit /b 1
)

REM Get VM name from user
set /p VM_NAME="Enter your Virtual Machine name: "

if "%VM_NAME%"=="" (
    echo ERROR: VM name cannot be empty!
    echo.
    pause
    exit /b 1
)

echo.
echo Configuring VM: %VM_NAME%
echo.
echo WARNING: Make sure VirtualBox is completely closed before continuing!
echo Press any key to continue or Ctrl+C to cancel...
pause >nul

REM Navigate to VirtualBox directory
cd /d "%VBOX_PATH%"

echo.
echo [1/5] Configuring CPU ID...
VBoxManage.exe modifyvm "%VM_NAME%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
if %errorLevel% neq 0 (
    echo ERROR: Failed to configure CPU ID. Check if VM name is correct.
    pause
    exit /b 1
)
echo Done!

echo.
echo [2/5] Setting System Product (iMac19,1)...
VBoxManage.exe setextradata "%VM_NAME%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac19,1"
if %errorLevel% neq 0 (
    echo ERROR: Failed to set system product.
    pause
    exit /b 1
)
echo Done!

echo.
echo [3/5] Setting System Version...
VBoxManage.exe setextradata "%VM_NAME%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
if %errorLevel% neq 0 (
    echo ERROR: Failed to set system version.
    pause
    exit /b 1
)
echo Done!

echo.
echo [4/5] Setting Board Product...
VBoxManage.exe setextradata "%VM_NAME%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-AA95B1DDAB278B95"
if %errorLevel% neq 0 (
    echo ERROR: Failed to set board product.
    pause
    exit /b 1
)
echo Done!

echo.
echo [5/5] Configuring SMC Device...
VBoxManage.exe setextradata "%VM_NAME%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
if %errorLevel% neq 0 (
    echo ERROR: Failed to set SMC device key.
    pause
    exit /b 1
)
VBoxManage.exe setextradata "%VM_NAME%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
if %errorLevel% neq 0 (
    echo ERROR: Failed to configure real SMC.
    pause
    exit /b 1
)
echo Done!

echo.
echo ========================================
echo  Configuration completed successfully!
echo ========================================
echo.
echo You can now start your VM: %VM_NAME%
echo.
echo Additional recommended settings:
echo  - System ^> Processor: 2+ CPUs
echo  - Display ^> Video Memory: 128 MB
echo  - Storage: Attach macOS ISO
echo.
pause