# fed-40-gnome-fbis
 Fedora 40 Gnome First Boot Install Script

## This install is for Fedora 40 Workstation with Gnome only.

## NOTE:
This is utilizing a AMD Ryzen 9 5900X and a NVIDIA GeForce RTX 4080 SUPER. If you are in need of other GPU or CPU settings on the installer... I will make a seperate install script for that... maybe? When I get time? 
This install is based on my own preferences and experiences. All applications are the applications I currently use or have used. I am open to suggestions for how the script(s) operate and what applications people use. I like new things :D

## What does this install script do?
This install script is a compiliation of information I've learned while using Fedora. My preference is Gnome, but I also play in KDE plasma (future installer script to come)
### This script will do the following:
#### Configure your DNF settings
`fastestmirror=1`
`max_parallel_downloads=10`
`countme=false` #DNF will not send any usage statistics
#### Update system and firmware
#### Install Nvidia Drivers
#### Install Codecs
#### Install flatpak groups for different uses based on your choices
Content creation, Developer, gamer, networking, office, and game launchers
Note: Steam and Lutris are RPM installs while Heroic Games Launcher is a flatpak. This is my preference.
#### Validate Nvidia Kernels are built.


## How to
### Install Fedora 40 Worksation
Install Fedora 40 Worksation @ https://fedoraproject.org/en/workstation/download 
### Configure & Install 
Configure and Install your Fedora 40 Workstation
### Restart
Restart to get to image
### Set up User Account
Set up Name, Username, and Password.
### NEXT, NEXT, NEXT.
Next it all to completion (disable information gathering and location services if you want)
### Open Terminal
Overview -> Terminal
### Change Directories
```bash
cd Downloads/
```
### git clone time
```
git clone https://github.com/TheTechMokey/fed-40-gnome-fbis.git
```
### Change Directories again
```bash
cd fed-40-gnome-fbis
```
### CHMOD +x
```bash
chmod +x install.sh
chmod +x scripts/*
```
### Run Install Script
```bash
sudo ./install.sh
```
### Follow prompts
Y Y Y Y Y...
If it asks you for a specific version of a package, choose the newest.. or not.. IDC it's your choice, it's your computer after all. 
### Reboot
```bash
sudo reboot
```
