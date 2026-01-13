#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: logs.sh
# Updated: 2025-12-26
#
# Purpose:
#   Shows the last lines of server log.
#
# Called by:
#   Manual admin use
#
# Outputs:
#   Tail output
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

while true; do
  echo
  echo "LOGS: $GAME_NAME"
  echo "1) tail -n 200 -f $RUN_DIR/server.log"
  echo "2) tail -n 200 -f $LOG_DIR/update.log"
  echo "3) tail -n 200 -f $LOG_DIR/backup.log"
  echo "0) Zurück"
  read -r -p "Auswahl: " C
  case "$C" in
    1) tail -n 200 -f "$RUN_DIR/server.log" ;;
    2) tail -n 200 -f "$LOG_DIR/update.log" ;;
    3) tail -n 200 -f "$LOG_DIR/backup.log" ;;
    0) exit 0 ;;
    *) echo "Ungültig." ;;
  esac
done
