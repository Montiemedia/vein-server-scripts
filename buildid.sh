#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: buildid.sh
# Updated: 2025-12-26
#
# Purpose:
#   Prints build id (if used).
#
# Called by:
#   Manual admin use or update.sh
#
# Outputs:
#   Build information
#
# Return codes:
#   0 on success.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
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
