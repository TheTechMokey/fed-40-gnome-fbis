#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Configuring GNOME settings..."

# Set dark theme (equivalent of Breeze Dark for KDE)
log "Setting dark theme..."
if ! gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'; then
    error "Failed to set GNOME dark theme."
    exit 1
fi

# Enable Night Light
log "Enabling Night Light..."
if ! gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true; then
    error "Failed to enable Night Light."
    exit 1
fi

# Set clock to show seconds
log "Setting clock to show seconds..."
if ! gsettings set org.gnome.desktop.interface clock-show-seconds true; then
    error "Failed to set clock to show seconds."
    exit 1
fi

# Example: Set resolution scaling for a specific monitor using xrandr
# First, find the connected monitors
connected_monitors=$(xrandr --listmonitors | grep -oP '\S+(?=\s+\d)')

# Apply resolution scaling to a specific monitor (change "HDMI-1" to your desired monitor identifier)
monitor_to_scale="HDMI-1"  # Example: use xrandr to list monitors and choose the correct one
scale_factor="1.25"  # Example scale factor

if echo "$connected_monitors" | grep -q "$monitor_to_scale"; then
    log "Applying resolution scaling of $scale_factor to $monitor_to_scale..."
    if ! xrandr --output "$monitor_to_scale" --scale "${scale_factor}x${scale_factor}"; then
        error "Failed to apply resolution scaling."
        exit 1
    fi
else
    log "Monitor $monitor_to_scale not found, skipping resolution scaling."
fi

# Additional GNOME configurations can go here
