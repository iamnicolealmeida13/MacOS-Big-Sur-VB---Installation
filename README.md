# ***MacOS-Big-Sur-VB---Installation***
A complete guide to install and configure macOS on VirtualBox with all necessary scripts.

# ⚠️ **Legal Disclaimer** ⚠️
This repository is for educational purposes only, macOS virtualization is subject to Apple's EULA (*End User License Agreement*). Make sure you comply with all of Apple's legal terms before proceeding. 

**Note**: *Apple only permits macOS virtualization on Apple hardware. Using these scripts may violate their terms of service.*

# **Pre-requisites**
- [*VirtualBox*](https://bit.ly/4nN5GLu) 6.1 or higher
- [*Virtual Box Extension Pack*](https://bit.ly/47L98k0) (*You have to install this Extension in order to work*)
- **Host OS**: *Windows, Linux,* or *macOS*
- **Hardware**: Intel processor (*AMD may have issues - but works*)
- **RAM**: Minimum 4GB dedicated to VM (8GB recommended)
- **Disk Space**: Minimum 50GB (*80GB+ recommended*)
- **Virtualization**: VT-x/AMD-V enabled in BIOS
- **Iso Image**: macOS (**Big Sur, Monterey, Ventura,** or **Sonoma**)

# **Quick Installation**
#### Step 1: **Install the Extension Pack**

1. Open VirtualBox.
2. Click ***"Files" > "Tools" > "Extensions" > "Install" > Select the `.vbox.extpack` pack*** - Wait until it finishes.

**Note**: *Make sure you are using the same version as the VirtualBox App.*

#### Step 2: **Create The Virtual Machine**

1. Open VirtualBox.
2. Click "New".
3. Configure:
    - **Name**: Choose a name (*e.g., MacOS*)
    - **Type**: Mac OS X
    - **Version**: Mac OS X (64-bit)
    - **Memory**: 4096MB or higher
    - **Hard disk**: Create a Virtual hard disk (VDI, 80GB+)

#### Step 3: **Configure VM Settings**
Before starting the VM, configure these settings in VirtualBox:

- **System > Motherboard**:
    - **Chipset**: ICH9
    - *Uncheck Floppy*
    - **Boot Order**: Hard Disk, Optical

- **System > Processor**:
    - **CPUs**: 2 or more
    - *Enable PAE/NX*

- **Display**:
    - **Video Memory**: 128MB
    - **Graphics Controller**: VMSVGA

- **Storage**:
    - Attach your **MacOS ISO** to the optical drive.

#### Step 4: **Run Configuration Script**

#### **Windows Users**:
1. Close VirtualBox completly
2. Open Command Prompt as Administrator
3. Navigate to the [*scripts*]() folder <!-- Colocar link da pasta -->
4. Run `configure-vm.bat`
5. Enter your VMname when prompted 

#### **Linux/Mac Users**:
1. Close VirtualBox completly
2. Open Terminal 
3. Navigate to the [*scripts*]() folder <!-- Colocar link da pasta -->
4. Run `chmod +x configure-vm-sh && ./configure-vm.sh`
5. Enter your VMname when prompted

#### Step 5: **Install MacOS**
1. Start the VM
2. **Boot from the ISO**
3. Open Disk Utility and format the virtual disk as ***APFS***
4. Close Disk Utility and proceed with MacOS installation
5. Follow the on-screen instructions

# **Repository Structure**

| Path | Description | Type |
|------|--------------|------|
| `MacOS-Big-Sur-VB---Installation/` | Project root directory | 📂 Folder |
| `├── README.md` | This file | 📄 File |
| `├── scripts/` | Contains VM configuration scripts | 📂 Folder |
| `│   ├── configure-vm.bat` | Windows configuration script | ⚙️ File |
| `│   └── configure-vm.sh` | Linux/Mac configuration script | ⚙️ File |
| `├── docs/` | Additional documentation | 📂 Folder |
| `│   ├── troubleshooting.md` | Common issues and solutions | 📘 File |
| `│   └── optimization.md` | Performance optimization tips | 📘 File |
| `└── LICENSE` | License file | 📄 File |

# **What the Scripts Do**
The configuration scripts apply essential settings to make MacOS work in VirtualBox: 
1. **CPU ID Settings**: Spoofs the CPU to appear as a Mac-compatible processor.
2. **System Product**: Sets the VM to identify as an iMac19,1.
3. **Board Product**: Configures the board identifier.
4. **SMC Device Key**: Adds the System Management Controller key.
5. **Real SMC**: Enables SMC emulation.


# **Contributing**
Contributions are welcome! Please:

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Push to the branch.
5. Open a Pull Request.

# **Support**
If this repository helped you, please consider giving it a star! It helps others find this project.


**Disclaimer**: *This project is not affiliated with, endorsed by, or sponsored by Apple Inc. All trademarks are the property of their respective owners!*
