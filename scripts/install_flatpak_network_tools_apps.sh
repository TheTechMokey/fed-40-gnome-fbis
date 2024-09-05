#!/bin/bash

source "$(dirname "$0")/../logging.sh"

local -a network_tools_flathub_install=(
    "org.nmap.Zenmap"
    "org.remmina.Remmina"
    "org.wireshark.Wireshark"
    "com.jgraph.drawio.desktop"
)
flatpak install -y flathub "${network_tools_flathub_install[@]}"