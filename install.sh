#!/bin/bash

source "$(dirname "$0")/logging.sh"

# Function to check Secure Boot status
check_secure_boot() {
    log "Checking Secure Boot status..."

    if ! command -v mokutil &>/dev/null; then
        error "mokutil is not installed. Please install mokutil to check Secure Boot status."
        exit 1
    fi

    if mokutil --sb-state | grep -q 'Secure Boot enabled'; then
        log "Secure Boot is enabled."
        read -p "This script was designed to run without Secure Boot. Secure Boot is enabled, would you like to continue? [y/N]: " choice
        case "$choice" in
        [Yy]*) log "Continuing with Secure Boot enabled." ;;
        *)
            log "Exiting script."
            exit 1
            ;;
        esac
    else
        log "Secure Boot is not enabled. Proceeding with the script."
    fi
}
check_secure_boot

# Define path to script directory
SCRIPT_DIR="$(dirname "$0")/scripts"

# Function to prompt user for installation choices
prompt_installation() {
    local choice
    local message="$1"

    while true; do
        read -p "$message [Y/n]: " choice
        case "$choice" in
        [Nn])
            echo "Skipping $message."
            return 1
            ;;
        [Yy]|"")
            echo "Installing $message."
            return 0
            ;;
        *)
            echo "Invalid input. Please enter Y to install or n to skip."
            ;;
        esac
    done
}

# Call the individual scripts with prompts for specified scripts

"$SCRIPT_DIR/configure_dnf.sh"

"$SCRIPT_DIR/update_system.sh"

"$SCRIPT_DIR/update_firmware.sh"

"$SCRIPT_DIR/install_core.sh"

"$SCRIPT_DIR/add_repositories.sh"

"$SCRIPT_DIR/install_media_codecs.sh"

"$SCRIPT_DIR/install_nvidia_drivers.sh"

"$SCRIPT_DIR/install_hardware_acceleration.sh"

"$SCRIPT_DIR/configure_gnome.sh"

if prompt_installation "Flatpak content creator apps"; then
    "$SCRIPT_DIR/install_flatpak_content_creator_apps.sh"
fi

if prompt_installation "Flatpak developer apps"; then
    "$SCRIPT_DIR/install_flatpak_developer_apps.sh"
fi

if prompt_installation "Flatpak network tools apps"; then
    "$SCRIPT_DIR/install_flatpak_network_tools_apps.sh"
fi

if prompt_installation "Flatpak office apps"; then
    "$SCRIPT_DIR/install_flatpak_office_apps.sh"
fi

if prompt_installation "Game launcher apps"; then
    "$SCRIPT_DIR/install_game_launcher_apps.sh"
fi

if prompt_installation "Flatpak gamer apps"; then
    "$SCRIPT_DIR/install_flatpak_gamer_apps.sh"
fi

if prompt_installation "Gamemode"; then
    "$SCRIPT_DIR/install_gamemode.sh"
fi

if prompt_installation "Wine and Proton dependencies"; then
    "$SCRIPT_DIR/install_wine_proton_dependencies.sh"
fi

"$SCRIPT_DIR/verify_nvidia.sh"

