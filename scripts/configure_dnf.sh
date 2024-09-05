#!/bin/bash

source "$(dirname "$0")/../logging.sh"

log "Configuring DNF..."

tmp_file=$(mktemp)

if ! grep -q '^fastestmirror=1' /etc/dnf/dnf.conf; then
    echo "fastestmirror=1" | sudo tee -a "$tmp_file"
fi

if ! grep -q '^max_parallel_downloads=10' /etc/dnf/dnf.conf; then
    echo "max_parallel_downloads=10" | sudo tee -a "$tmp_file"
fi

if ! grep -q '^countme=false' /etc/dnf/dnf.conf; then
    echo "countme=false" | sudo tee -a "$tmp_file"
fi

if [ -s "$tmp_file" ]; then
    sudo tee -a /etc/dnf/dnf.conf <"$tmp_file"
else
    log "No new DNF settings to add."
fi

rm -f "$tmp_file"
