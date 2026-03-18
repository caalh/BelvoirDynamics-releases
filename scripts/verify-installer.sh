#!/usr/bin/env bash
# Verifies OWEN installer integrity using SHA-256 checksum.
# Usage:
#   ./verify-installer.sh DynamicMC-Setup-v1.0.0.exe <expected_hash>
#   ./verify-installer.sh DynamicMC-Setup-v1.0.0.exe   # prints hash only

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-exe> [expected_sha256_hash]"
    exit 1
fi

FILE="$1"
EXPECTED="${2:-}"

if [ ! -f "$FILE" ]; then
    echo "Error: File not found: $FILE"
    exit 1
fi

ACTUAL=$(sha256sum "$FILE" | cut -d' ' -f1)

if [ -n "$EXPECTED" ]; then
    # Normalize: lowercase, strip spaces/dashes
    E=$(echo "$EXPECTED" | tr -d ' -' | tr '[:upper:]' '[:lower:]')
    A=$(echo "$ACTUAL" | tr -d ' -' | tr '[:upper:]' '[:lower:]')
    if [ "$E" = "$A" ]; then
        echo "PASS: Checksum matches. File integrity verified."
        exit 0
    else
        echo "FAIL: Checksum mismatch. Do not install this file."
        echo "  Expected: $EXPECTED"
        echo "  Actual:   $ACTUAL"
        exit 1
    fi
else
    echo "SHA-256: $ACTUAL"
    echo ""
    echo "Compare this value to the checksum published in the release notes."
    exit 0
fi
