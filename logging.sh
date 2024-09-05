#!/bin/bash

set -e          # Exit on any error
set -o pipefail # Exit if any command in a pipe fails

# Helper function to log messages
log() {
    echo "[INFO] $1"
    logger -t script "[INFO] $1" # Log to system log
}

error() {
    echo "[ERROR] $1"
    logger -t script "[ERROR] $1" # Log to system log
}
