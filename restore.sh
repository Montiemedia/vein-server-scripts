#!/bin/bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: restore.sh
# Updated: 2025-12-26
#
# Purpose:
#   Restores a backup into a separate restore directory for manual copy-back (safe restore workflow).
#
# Called by:
#   Manual admin use
#
# Outputs:
#   Extracted files under /opt/games/vein/_restore_test
#
# Return codes:
#   0 on success, non-zero on error.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -Eeuo pipefail
source /opt/games/vein/game.conf

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /opt/games/vein/backups/vein_YYYYMMDD_HHMMSS.tar.gz"
  exit 1
fi

ARCHIVE="$1"
[[ -f "$ARCHIVE" ]] || { echo "Nicht gefunden: $ARCHIVE"; exit 1; }

systemctl stop "$SERVICE_NAME" || true

mkdir -p "$DATA_DIR"
tar -xzf "$ARCHIVE" -C "$DATA_DIR"

systemctl start "$SERVICE_NAME" || true
echo "Restore fertig"

