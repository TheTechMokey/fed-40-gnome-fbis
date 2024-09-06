#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Installing and adding repositories..."

# Add RPM Fusion repositories
if sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm; then
    log "RPM Fusion repositories installed successfully."
else
    error "Failed to install RPM Fusion repositories."
    exit 1
fi

# Add Flathub repository
if flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo; then
    log "Flathub repository added successfully."
else
    error "Failed to add Flathub repository."
    exit 1
fi
