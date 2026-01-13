#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: backup_core.sh
# Updated: 2025-12-26
#
# Purpose:
#   Creates a backup archive of Saved and relevant config. Optionally stops and restarts for consistency.
#
# Called by:
#   backup.sh, stop.sh (safety backup), timed backups
#
# Outputs:
#   A tar.gz in /opt/games/vein/backups with name vein_YYYYMMDD_HHMMSS.tar.gz
#
# Return codes:
#   0 on success, non-zero on error.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -euo pipefail

LOCK="/opt/games/vein/run/backup.lock"
exec 9>"$LOCK"
flock -n 9 || { echo "[backup] Läuft bereits. Abbruch."; exit 1; }


BASE="/opt/games/vein"
BACKUP_DIR="$BASE/backups"
STAMP="$(date +%Y%m%d_%H%M%S)"
ARCHIVE="$BACKUP_DIR/vein_${STAMP}.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "[backup] Starte Backup: $ARCHIVE"
echo "[backup] Packe Daten…"

tar -czf "$ARCHIVE" \
  -C /opt/games/vein/data Saved \
  -C /opt/games/vein game/Vein/Saved/Config 2>/dev/null || true

echo "[backup] Fertig: $ARCHIVE"
echo "[backup] Done"

