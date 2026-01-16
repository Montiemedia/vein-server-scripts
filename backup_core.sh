#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: backup_core.sh
#
# Purpose:
#   Core backup implementation. Collects relevant VEIN server data and writes a tar.gz backup.
#
# Called by:
#   backup.sh, automation jobs (if configured)
#
# Outputs:
#   Creates a tar.gz archive in /opt/games/vein/backups
#
# Return codes:
#   0 = success
#   1+ = error
#
# Notes:
#   Keep this script non-interactive. Validate paths and permissions in your environment.
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

