#!/bin/bash

source "$(dirname "$0")/../logging.sh"

install_flathub_network_tools () {
local -a network_tools_flathub_install
    network_tools_flathub_install=(
    "org.nmap.Zenmap"
    "org.remmina.Remmina"
    "org.wireshark.Wireshark"
    "com.jgraph.drawio.desktop"
)
flatpak install -y flathub "${network_tools_flathub_install[@]}"
}
install_flathub_network_tools