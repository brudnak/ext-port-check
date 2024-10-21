#!/bin/bash

check_port() {
    local port_hex="1A0A"
    local file=$1
    echo "Checking for port 6666 (hex 1A0A) in $file..."
    if grep -q ":$port_hex" "$file"; then
        echo "Port 6666 is LISTENING"
        grep ":$port_hex" "$file"
    else
        echo "Port 6666 is NOT listening"
    fi
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <network_log_file>"
    exit 1
fi

if [ -f "$1" ]; then
    check_port "$1"
else
    echo "File not found: $1"
fi

echo "Check complete."