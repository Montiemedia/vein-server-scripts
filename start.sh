#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: start.sh
#
# Purpose:
#   Starts the VEIN dedicated server process.
#
# Called by:
#   menu.sh, Cockpit VEIN Panel, operators
#
# Outputs:
#   Starts server and writes basic status/progress to stdout.
#
# Return codes:
#   0 = success
#   1+ = error
#
# Notes:
#   Designed for non-interactive execution when called by panels/automation.
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
