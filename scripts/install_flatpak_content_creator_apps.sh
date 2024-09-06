#!/bin/bash

source "$(dirname "$0")/../logging.sh"

install_flathub_creator () {
local -a content_creator_flathub_install
    content_creator_flathub_install=(
    "com.github.finefindus.eyedropper"
    "com.obsproject.Studio"
    "com.obsproject.Studio.Plugin.OBSVkCapture"
    "org.freedesktop.Platform.VulkanLayer.OBSVkCapture"
    "com.obsproject.Studio.Plugin.Gstreamer"
    "org.blender.Blender"
    "org.pipewire.Helvum"
    "com.github.wwmm.easyeffects"
    "org.gimp.GIMP"
    "org.tenacityaudio.Tenacity"
)
flatpak install -y flathub "${content_creator_flathub_install[@]}"
}
install_flathub_creator 
