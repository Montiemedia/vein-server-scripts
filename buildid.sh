#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: buildid.sh
#
# Purpose:
#   Prints the current VEIN server build identifier/version as seen by the local installation.
#
# Called by:
#   menu.sh, troubleshooting workflows
#
# Outputs:
#   Writes build/version info to stdout.
#
# Return codes:
#   0 = success
#   1+ = error
# ==============================================================================

set -Eeuo pipefail
# shellcheck disable=SC1091
source /opt/games/vein/scripts/lib.sh

load_conf
if [[ -f "$MANIFEST" ]]; then
  grep -E '"buildid"' "$MANIFEST" || true
else
  echo "Kein Manifest gefunden: $MANIFEST"
fi
