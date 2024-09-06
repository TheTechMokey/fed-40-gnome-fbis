#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Verifying Nvidia installation... This could take up to 5 minutes."
# Verify Nvidia installation
verify_nvidia() {
    log "Verifying Nvidia installation... This could take up to 5 minutes."

    local retries=12
    local wait_time=30
    local success=false

    for ((i = 1; i <= retries; i++)); do
        if lsmod | grep -q nvidia; then
            log "Nvidia kernel module is loaded."

            if command -v nvidia-smi &>/dev/null; then
                if sudo nvidia-smi &>/dev/null; then
                    log "Nvidia driver installation verified successfully with 'nvidia-smi'."
                    success=true
                    break
                else
                    error "Nvidia driver installation verification failed with 'nvidia-smi'."
                fi
            else
                error "'nvidia-smi' command not found. Please check if the Nvidia drivers are installed correctly."
            fi
        else
            log "Nvidia kernel module is not loaded yet. Retrying in $wait_time seconds..."
        fi

        sleep $wait_time
    done

    if [ "$success" = true ]; then
        log "Nvidia drivers are properly installed and working."
    else
        error "Nvidia driver installation failed after $((retries * wait_time)) seconds. Please check system logs for more details."
        exit 1
    fi
}
verify_nvidia
