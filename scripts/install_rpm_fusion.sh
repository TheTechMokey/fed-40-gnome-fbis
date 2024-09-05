#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Installing RPM Fusion repositories..."
if ! sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm; then
    error "Failed to install RPM Fusion repositories."
    exit 1
fi
