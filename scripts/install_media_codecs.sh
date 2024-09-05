#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Installing media codecs..."

if ! sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing && sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin && sudo dnf update @sound-and-video && sudo dnf group install Multimedia; then
    error "Failed to install media codecs."
    exit 1
fi