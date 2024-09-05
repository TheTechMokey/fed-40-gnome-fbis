#!/bin/bash

source logging.sh

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

# Call the individual scripts
"$SCRIPT_DIR/configure_dnf.sh"
"$SCRIPT_DIR/install_coref.sh"

