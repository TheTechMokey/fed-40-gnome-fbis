#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Starting core installation..."

# Define the packages to install
packages="xrandr gnome-tweaks gnome-extensions-app"

# Install the packages
if sudo dnf install -y $packages; then
    log "Core installation completed successfully."
else
    error "Failed to install core packages."
    exit 1
fi
