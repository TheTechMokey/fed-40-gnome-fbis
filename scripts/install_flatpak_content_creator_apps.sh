#!/bin/bash

source "$(dirname "$0")/../logging.sh"

local -a content_creator_flathub_install=(
    "com.github.finefindus.eyedropper"
    "com.obsproject.Studio"
    "com.obsproject.Studio.Plugin.OBSVkCapture"
    "org.freedesktop.Platform.VulkanLayer.OBSVkCapture"
    "oject.Studio.Plugin.GStreamerVaapi"
    "com.obsproject.Studio.Plugin.Gstreamer"
    "org.blender.Blender"
    "org.pipewire.Helvum"
    "com.github.wwmm.easyeffects"
    "org.gimp.GIMP"
    "org.tenacityaudio.Tenacity"
)
flatpak install -y flathub "${content_creator_flathub_install[@]}"