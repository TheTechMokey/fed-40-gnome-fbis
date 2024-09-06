#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Installing Flatpak applications..."

local -a gamer_flathub_install=(
  
    "com.teamspeak.TeamSpeak"
    "dev.vencord.Vesktop"
    "info.mumble.Mumble"
    "org.libretro.RetroArch"
    "io.github.mandruis7.xbox-cloud-gaming-electron"
)
flatpak install -y flathub "${gamer_flathub_install[@]}"