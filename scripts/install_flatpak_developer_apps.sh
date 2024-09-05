#!/bin/bash

source "$(dirname "$0")/../logging.sh"

local -a developer_flathub_install=(
    "com.github.tchx84.Flatseal"
    "com.github.wwmm.easyeffects"
    "com.visualstudio.code"
    "io.github.shiftey.Desktop"
    "com.jetbrains.IntelliJ-IDEA-Community"
    "com.jetbrains.PyCharm-Community"
    "com.axosoft.GitKraken"
    "com.getpostman.Postman"
    "io.dbeaver.DBeaverCommunity"
    "io.podman_desktop.PodmanDesktop"

)
flatpak install -y flathub "${developer_flathub_install[@]}"