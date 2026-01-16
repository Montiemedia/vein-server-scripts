#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: restore.sh
#
# Purpose:
#   Restores VEIN server data from a selected backup archive.
#
# Called by:
#   menu.sh, operators, Cockpit VEIN Panel (if wired)
#
# Inputs:
#   A backup tar.gz from /opt/games/vein/backups
#
# Outputs:
#   Restored server data in the configured VEIN data directories.
#
# Return codes:
#   0 = success
#   1+ = error
#
# Notes:
#   Restore is a destructive operation. Keep logic non-interactive unless explicitly intended.
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

