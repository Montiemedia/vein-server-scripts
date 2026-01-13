#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: update.sh
# Updated: 2025-12-26
#
# Purpose:
#   Updates the game server (SteamCMD).
#
# Called by:
#   Manual admin use
#
# Outputs:
#   Update logs
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

echo "==== $(date -u) UPDATE $GAME_NAME (INTERAKTIV) ====" | tee -a "$LOG_DIR/update.log"

read -r -p "Steam Benutzername: " STEAM_USER
read -r -s -p "Steam Passwort: " STEAM_PASS
echo
read -r -p "Steam Guard Code (leer wenn nicht benötigt): " STEAM_GUARD

# Stop vorher
/opt/games/vein/scripts/stop.sh || true

# SteamCMD live anzeigen (kein tee in /var/log root-only, wir loggen in $LOG_DIR)
if [[ -n "${STEAM_GUARD:-}" ]]; then
  sudo -u vein -H "$STEAMCMD" \
    +force_install_dir "$INSTALLDIR" \
    +login "$STEAM_USER" "$STEAM_PASS" "$STEAM_GUARD" \
    +app_update "$APPID" validate \
    +quit | tee -a "$LOG_DIR/update.log"
else
  sudo -u vein -H "$STEAMCMD" \
    +force_install_dir "$INSTALLDIR" \
    +login "$STEAM_USER" "$STEAM_PASS" \
    +app_update "$APPID" validate \
    +quit | tee -a "$LOG_DIR/update.log"
fi

unset STEAM_USER STEAM_PASS STEAM_GUARD

echo "BuildID danach:"
/opt/games/vein/scripts/buildid.sh

echo "Starte Server neu..."
/opt/games/vein/scripts/start.sh
