#!/bin/bash
# ============================================
# macOS VirtualBox Configuration Script
# For Linux hosts
# ============================================

echo
echo "========================================"
echo "  macOS VirtualBox Configuration Script"
echo "========================================"
echo

# --- Check if running as root ---
if [[ $EUID -ne 0 ]]; then
    echo "ERROR: This script must be run as root (sudo)!"
    echo "Usage: sudo ./configure-vm.sh"
    echo
    exit 1
fi

# --- Check if VBoxManage is available ---
if ! command -v VBoxManage &>/dev/null; then
    echo "ERROR: VBoxManage not found!"
    echo "Please install VirtualBox before running this script."
    echo
    exit 1
fi

# --- Get VM name from user ---
read -rp "Enter your Virtual Machine name: " VM_NAME

if [[ -z "$VM_NAME" ]]; then
    echo "ERROR: VM name cannot be empty!"
    echo
    exit 1
fi

echo
echo "Configuring VM: $VM_NAME"
echo
read -n1 -r -p "Make sure VirtualBox is completely closed. Press any key to continue..." key
echo

# --- Step 1: Configure CPU ID ---
echo
echo "[1/5] Configuring CPU ID..."
VBoxManage modifyvm "$VM_NAME" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff || {
    echo "ERROR: Failed to configure CPU ID."
    exit 1
}
echo "Done!"

# --- Step 2: Set System Product ---
echo
echo "[2/5] Setting System Product (iMac19,1)..."
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac19,1" || {
    echo "ERROR: Failed to set System Product."
    exit 1
}
echo "Done!"

# --- Step 3: Set System Version ---
echo
echo "[3/5] Setting System Version..."
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0" || {
    echo "ERROR: Failed to set System Version."
    exit 1
}
echo "Done!"

# --- Step 4: Set Board Product ---
echo
echo "[4/5] Setting Board Product..."
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-AA95B1DDAB278B95" || {
    echo "ERROR: Failed to set Board Product."
    exit 1
}
echo "Done!"

# --- Step 5: Configure SMC Device ---
echo
echo "[5/5] Configuring SMC Device..."
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/smc/0/Config/DeviceKey" \
"ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" || {
    echo "ERROR: Failed to set SMC DeviceKey."
    exit 1
}
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1 || {
    echo "ERROR: Failed to configure GetKeyFromRealSMC."
    exit 1
}
echo "Done!"

# --- Completion message ---
echo
echo "========================================"
echo "  Configuration completed successfully!"
echo "========================================"
echo
echo "You can now start your VM: $VM_NAME"
echo
echo "Recommended VirtualBox settings:"
echo " - System > Processor: 2+ CPUs"
echo " - Display > Video Memory: 128 MB"
echo " - Storage: Attach macOS ISO"
echo
