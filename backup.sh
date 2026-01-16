#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: backup.sh
#
# Purpose:
#   Manual backup entrypoint. Delegates to backup_core.sh with minimal side effects.
#
# Called by:
#   veinctl backup, Cockpit VEIN Panel
#
# Outputs:
#   Creates a tar.gz archive in /opt/games/vein/backups
#
# Return codes:
#   0 = success
#   1+ = error
#
# Notes:
#   Designed for non-interactive execution. Avoid prompts unless panel logic is updated.
# ==============================================================================


set -Eeuo pipefail

echo "[backup] Manuelles Backup (Server läuft ggf.)"
"/opt/games/vein/scripts/backup_core.sh"
echo "[backup] Fertig"
