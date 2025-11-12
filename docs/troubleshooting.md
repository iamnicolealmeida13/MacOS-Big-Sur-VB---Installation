# **Troubleshooting**
## **VM won't boot**

- Ensure VT-x/AMD-V is enabled in BIOS.
- Check that you've run the configuration script.
- Verify the ISO is properly attached.

## **Black screen on boot**

Try changing Graphics Controller to VBoxVGA or VBoxSVGA.
Increase Video Memory to 128MB.

## **Installation is very slow**

- Allocate more CPU cores (2-4).
- Increase RAM allocation (8GB recommended).
- Use an SSD for the virtual disk.

## **Mouse/Keyboard not working**

- Install VirtualBox Guest Additions after macOS installation.
- Enable USB 2.0 or 3.0 controller in VM settings.