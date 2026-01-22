#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: lib.sh
#
# Purpose:
#   Shared helper functions and configuration loading for VEIN server scripts.
#
# Called by:
#   start.sh, stop.sh, update.sh, logs.sh, buildid.sh, etc.
#
# Outputs:
#   None directly; provides shared functions.
#
# Return codes:
#   0 = success
#   1+ = error
# ==============================================================================

set -Eeuo pipefail

CONF="/opt/games/vein/game.conf"

die() { echo "ERROR: $*" >&2; exit 1; }

load_conf() {
  [[ -f "$CONF" ]] || die "Config fehlt: $CONF"
  # shellcheck disable=SC1090
  source "$CONF"

  : "${GAME_ROOT:?}"
  : "${INSTALLDIR:?}"
  : "${RUN_DIR:?}"
  : "${LOG_DIR:?}"
  : "${STEAMCMD:?}"
  : "${APPID:?}"
  : "${BIN_REL:?}"

  mkdir -p "$RUN_DIR" "$LOG_DIR" "$BACKUP_DIR" "$DATA_DIR" "$SAVED_DIR"
}

as_game_user() {
  # Vein will nicht als root laufen
  if [[ ${EUID:-0} -eq 0 ]]; then
    exec sudo -u vein -H bash "$0" "$@"
  fi
}
