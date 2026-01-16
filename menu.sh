#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: menu.sh
#
# Purpose:
#   Interactive administration menu for common VEIN server operations.
#
# Called by:
#   Operators (manual usage)
#
# Actions:
#   Starts/stops/restarts server, triggers updates, backups/restores, shows status/logs/build info.
#
# Return codes:
#   0 = normal exit
#   1+ = error
#
# Notes:
#   This script is interactive by design. Most other scripts should remain non-interactive.
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
