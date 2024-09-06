#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Installing Flatpak applications..."

install_flathub_office () {
local -a office_flathub_install
    office_flathub_install=(
    "org.mozilla.Thunderbird"
    "org.libreoffice.LibreOffice"
    "md.obsidian.Obsidian"
)
flatpak install -y flathub "${office_flathub_install[@]}"
}
install_flathub_office