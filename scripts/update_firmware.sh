#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Updating firmware..."

if ! sudo dnf autoremove -y && sudo fwupdmgr refresh --force && sudo fwupdmgr get-devices && sudo fwupdmgr get-updates -y && sudo fwupdmgr update -y; then
    error "Failed to update firmware."
    exit 1
fi