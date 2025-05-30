# Installing Zsh on WSL (Ubuntu 22.04.5 LTS)

This guide documents all the steps followed to install and configure Zsh under Windows Subsystem for Linux (WSL) with Ubuntu 22.04.5 LTS.


## 1. Enable WSL on Windows (WSL 1 or WSL 2)

### Open PowerShell as Administrator

- Click on **Start**, type `PowerShell`
- Right-click > **Run as administrator**


### Enable WSL and the Virtual Machine Platform

Paste this command into PowerShell:
   
```powershell
wsl --install
```
### If you want more control (e.g., to explicitly install WSL 2), use the following commands:

#### Explanation:

##### 1. Enable Windows Subsystem for Linux

- `dism.exe` – The Deployment Image Servicing and Management tool, used to modify Windows features.
- `/online` – Applies changes to the currently running operating system.
- `/enable-feature` – Enables a specific Windows feature.
- `/featurename:Microsoft-Windows-Subsystem-Linux` – The name of the WSL feature.
- `/all` – Enables all parent features required by this feature.
- `/norestart` – Prevents an automatic system restart after activation.

 **Purpose**: Enables the **WSL 1** compatibility layer on Windows.


##### 2. Enable Virtual Machine Platform

- `dism.exe` – Same tool as above, for managing Windows features.
- `/featurename:VirtualMachinePlatform` – Enables the virtualization components required to run **WSL 2**.

**Purpose**: Prepares the system to support **WSL 2**, which relies on lightweight virtualization.



### Commands to Run in PowerShell (as Administrator)

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### Reboot the computer


## 1. Install Ubuntu on Windows

Ubuntu 22.04.5 LTS was installed directly from the Microsoft Store.

- Open the **Microsoft Store**
- Search for **Ubuntu 22.04 LTS**
- Click **Install**

## 2. Launch Ubuntu and Set Up WSL

- Launch Ubuntu from the Start Menu
- Create a new UNIX user with username and password
- Ubuntu 22.04.5 LTS is now ready in WSL

## 3. Enable `sudo` permissions

To run administrative commands, you need to be able to use `sudo`.

If `sudo` is not enabled by default, grant your user administrative rights:

```bash
sudo apt update && sudo apt upgrade -y
```

## 4. Install Zsh

Run the following command:

```bash
sudo apt install zsh -y
```

## 5. Verify Zsh Installation

Check the version to verify installation:

```bash
zsh --version
```

## 6. Set Zsh as Default Shell

To make Zsh the default shell:

```bash
chsh -s $(which zsh)
```

Restart the Ubuntu terminal for the change to take effect.

## 7. (Optional) Install Oh My Zsh

Oh My Zsh provides themes and plugins for Zsh.

Install with curl:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Follow the on-screen instructions to complete the setup.

## Summary

You have now successfully installed and configured Zsh on WSL with Ubuntu 22.04.5 LTS.
