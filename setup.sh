#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: setup.sh
#
# Purpose:
#   Prepares the VEIN dedicated server environment: directories, permissions, prerequisites.
#
# Called by:
#   Operators during initial deployment, menu.sh
#
# Outputs:
#   Creates/validates required folders and baseline configuration.
#
# Return codes:
#   0 = success
#   1+ = error
# ==============================================================================


set -Eeuo pipefail

GAME_ROOT="/opt/games/vein"
USER="vein"
GROUP="vein"

install -d -m 775 -o "$USER" -g "$GROUP" \
  "$GAME_ROOT/game" \
  "$GAME_ROOT/data" \
  "$GAME_ROOT/data/Saved" \
  "$GAME_ROOT/backups" \
  "$GAME_ROOT/logs" \
  "$GAME_ROOT/run" \
  "$GAME_ROOT/scripts"

# Saved im Installationspfad auf data/Saved umbiegen (wenn es schon existiert, vorher sichern)
SAVED_LINK="$GAME_ROOT/game/Vein/Saved"
if [[ -e "$SAVED_LINK" && ! -L "$SAVED_LINK" ]]; then
  mv "$SAVED_LINK" "$SAVED_LINK.bak.$(date -u +%Y%m%d_%H%M%S)"
fi
mkdir -p "$GAME_ROOT/game/Vein" || true
ln -sfn "$GAME_ROOT/data/Saved" "$SAVED_LINK"

chown -R "$USER":"$GROUP" "$GAME_ROOT"
echo "OK: Struktur und Saved-Symlink gesetzt."
echo "Symlink: $SAVED_LINK -> $GAME_ROOT/data/Saved"
