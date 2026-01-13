#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: menu.sh
# Updated: 2025-12-26
#
# Purpose:
#   CLI menu wrapper (legacy).
#
# Called by:
#   Manual admin use
#
# Outputs:
#   Menu prompts
#
# Return codes:
#   0 on success.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -Eeuo pipefail

while true; do
  echo
  echo "VEIN Menu"
  echo "1 Start"
  echo "2 Stop"
  echo "3 Restart"
  echo "4 Update interaktiv"
  echo "5 Backup Saved"
  echo "6 Show BuildID"
  echo "7 Logs ansehen"
  echo "0 Exit"
  read -r -p "Auswahl: " C

  case "$C" in
    1) /opt/games/vein/scripts/start.sh ;;
    2) /opt/games/vein/scripts/stop.sh ;;
    3) /opt/games/vein/scripts/restart.sh ;;
    4) /opt/games/vein/scripts/update.sh ;;
    5) /opt/games/vein/scripts/backup.sh ;;
    6) /opt/games/vein/scripts/buildid.sh ;;
    7) /opt/games/vein/scripts/logs.sh ;;
    0) exit 0 ;;
    *) echo "Ungültig." ;;
  esac
done
