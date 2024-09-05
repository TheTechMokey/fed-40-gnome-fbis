#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Installing and configuring Gamemode..."

log "Installing and configuring Gamemode..."
if ! sudo dnf install -y gamemode; then
    error "Failed to install Gamemode."
    exit 1
fi

log "Enabling Gamemode globally..."
echo "export LD_PRELOAD=/usr/\$LIB/libgamemodeauto.so.0" | sudo tee -a /etc/environment