#!/usr/bin/env bash
# Verifies a GROVES installer's integrity using its SHA-256 checksum.
#
# Expected filename pattern: GROVES-Setup-v<version>.exe
# (for example: GROVES-Setup-v1.0.1.exe)
#
# Legacy DynamicMC-Setup-v*.exe (v1.0.0 and earlier) files are still accepted, with
# a warning that the file predates the GROVES rebrand.
#
# Usage:
#   ./verify-installer.sh GROVES-Setup-v1.0.1.exe <expected_hash>
#   ./verify-installer.sh GROVES-Setup-v1.0.1.exe                # prints hash only

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

BASENAME=$(basename "$FILE")
case "$BASENAME" in
    GROVES-Setup-v*.exe)
        ;;
    DynamicMC-Setup-v*.exe)
        echo "Warning: filename '$BASENAME' uses the legacy DynamicMC-Setup-v*.exe naming." >&2
        echo "         Current GROVES releases ship as 'GROVES-Setup-v<version>.exe'." >&2
        ;;
    *)
        echo "Warning: filename '$BASENAME' does not match 'GROVES-Setup-v<version>.exe'." >&2
        echo "         Verification will continue using the provided checksum." >&2
        ;;
esac

if command -v sha256sum >/dev/null 2>&1; then
    ACTUAL=$(sha256sum "$FILE" | cut -d' ' -f1)
elif command -v shasum >/dev/null 2>&1; then
    ACTUAL=$(shasum -a 256 "$FILE" | cut -d' ' -f1)
else
    echo "Error: neither sha256sum nor shasum is available on this system." >&2
    exit 1
fi

if [ -n "$EXPECTED" ]; then
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
