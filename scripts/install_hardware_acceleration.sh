#!/bin/bash

source "$(dirname "$0")/../logging.sh"

 log "Enabling hardware acceleration..."

if ! sudo dnf install -y ffmpeg ffmpeg-libs libva libva-utils && sudo dnf config-manager --set-enabled fedora-cisco-openh264 && sudo dnf install -y openh264 gstreamer1-plugin-openh264 mozilla-openh264; then
    error "Failed to enable hardware acceleration."
    exit 1
fi