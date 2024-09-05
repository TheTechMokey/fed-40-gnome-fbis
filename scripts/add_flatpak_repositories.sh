#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Adding Flatpak repositories..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo