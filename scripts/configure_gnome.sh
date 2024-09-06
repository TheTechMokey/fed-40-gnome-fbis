#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Configuring GNOME settings with user prompts..."

# Function to prompt user for enabling or disabling a setting
prompt_enable_disable() {
    local setting_name="$1"
    local enable_command="$2"
    local disable_command="$3"

    while true; do
        read -p "Do you want to enable (1) or disable (0) $setting_name? [0/1]: " choice
        case "$choice" in
        1)
            log "Enabling $setting_name..."
            if ! eval "$enable_command"; then
                error "Failed to enable $setting_name."
                exit 1
            fi
            break
            ;;
        0)
            log "Disabling $setting_name..."
            if ! eval "$disable_command"; then
                error "Failed to disable $setting_name."
                exit 1
            fi
            break
            ;;
        *)
            log "Invalid input. Please enter 1 to enable or 0 to disable."
            ;;
        esac
    done
}

# Prompt to set dark theme
prompt_enable_disable "GNOME dark theme" \
    "gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'" \
    "gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'"

# Prompt to enable or disable Night Light
prompt_enable_disable "Night Light" \
    "gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true" \
    "gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false"

# Prompt to enable or disable clock showing seconds
prompt_enable_disable "Clock showing seconds" \
    "gsettings set org.gnome.desktop.interface clock-show-seconds true" \
    "gsettings set org.gnome.desktop.interface clock-show-seconds false"

# Prompt to enable or disable minimize and maximize buttons
prompt_enable_disable "Minimize and maximize buttons" \
    "gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'" \
    "gsettings set org.gnome.desktop.wm.preferences button-layout ':close'"

# Prompt to enable or disable screen blanking
prompt_enable_disable "Screen blanking" \
    "gsettings set org.gnome.desktop.session idle-delay 300" \
    "gsettings set org.gnome.desktop.session idle-delay 0"

# Prompt to enable or disable automatic suspend on AC
prompt_enable_disable "Automatic suspend on AC" \
    "gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'" \
    "gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'"

# Prompt to enable or disable automatic suspend on battery
prompt_enable_disable "Automatic suspend on battery" \
    "gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'" \
    "gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'"

# Prompt to enable or disable power saver mode
prompt_enable_disable "Power saver mode on low battery" \
    "gsettings set org.gnome.settings-daemon.plugins.power power-saver-profile-on-low-battery true" \
    "gsettings set org.gnome.settings-daemon.plugins.power power-saver-profile-on-low-battery false"

# Set automatic deletion of trash content to 15 days
log "Setting automatic trash deletion to 15 days..."
if ! gsettings set org.gnome.desktop.privacy remove-old-trash-files true; then
    error "Failed to enable automatic trash deletion."
    exit 1
fi

if ! gsettings set org.gnome.desktop.privacy old-files-age 15; then
    error "Failed to set trash deletion age to 15 days."
    exit 1
fi

log "Automatic trash deletion is set to 15 days."
