#!/bin/bash

source "$(dirname "$0")/../logging.sh"

sudo dnf install -y steam wine lutris wine-core wine-common wine-alsa \
    wine-tahoma-fonts vulkan vulkan-tools vulkan-loader \
    libvkd3d SDL2 SDL2_image SDL2_ttf SDL2_mixer SDL2_net