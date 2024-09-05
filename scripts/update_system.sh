#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Updating the system..."

if ! sudo dnf -y update && sudo dnf -y upgrade --refresh; then
    error "Failed to update and upgrade the system."
    exit 1
fi
