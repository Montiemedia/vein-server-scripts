#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: start.sh
# Updated: 2025-12-26
#
# Purpose:
#   Starts the VEIN server process and writes the PID and logfile path.
#
# Called by:
#   veinctl start, restart.sh, backup_core.sh (after backup), Cockpit VEIN Panel
#
# Outputs:
#   Console messages, /opt/games/vein/run/server.pid, /opt/games/vein/run/server.log
#
# Return codes:
#   0 on success, non-zero on error.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -Eeuo pipefail
# shellcheck disable=SC1091
source /opt/games/vein/scripts/lib.sh

load_conf
as_game_user "$@"

BIN="$INSTALLDIR/$BIN_REL"
BIN_DIR="$(dirname "$BIN")"

[[ -x "$BIN" ]] || die "Binary nicht ausführbar/gefunden: $BIN"

cd "$BIN_DIR"
export LD_LIBRARY_PATH="$BIN_DIR:${LD_LIBRARY_PATH:-}"
export SteamAppId="$STEAM_APPID_RUNTIME"

echo "==== $(date -u) START $GAME_NAME ====" | tee -a "$RUN_DIR/server.log"

nohup "$BIN" Vein \
  -ServerName="$SERVER_NAME" \
  -Port="$PORT" \
  -QueryPort="$QUERYPORT" \
  -MaxPlayers="$MAXPLAYERS" \
  -IsPublic="$ISPUBLIC" \
  -Password="$PASSWORD" \
  -AdminPassword="$ADMINPASSWORD" \
  -SavedDir=/opt/games/vein/data/Saved \
  -GameServerLoginToken="$GSLT" \
  "$@" >>"$RUN_DIR/server.log" 2>&1 &

echo $! >"$RUN_DIR/server.pid"
echo "PID: $(cat "$RUN_DIR/server.pid")"
echo "Log: $RUN_DIR/server.log"
