#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script Library
# File: lib.sh
#
# Purpose:
#   Shared helper functions and common variables used across VEIN admin scripts.
#
# Used by:
#   start.sh, stop.sh, restart.sh, update.sh, backup/restore scripts, menu.sh, etc.
#
# Notes:
#   Keep functions stable and backward compatible. Avoid interactive prompts in library code.
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
