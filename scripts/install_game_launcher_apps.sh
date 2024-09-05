#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Installing Steam..."

sudo dnf install -y steam lutris 
flatpak install -y flathub com.heroicgameslauncher.hgl