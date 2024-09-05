#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Installing Nvidia drivers..."

if ! sudo dnf -y update && sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs \
    svt-hevc svt-av1 svt-vp9 nvidia-vaapi-driver libva-utils; then
    error "Failed to install Nvidia drivers."
    exit 1
fi