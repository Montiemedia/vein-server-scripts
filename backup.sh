#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: backup.sh
# Updated: 2025-12-26
#
# Purpose:
#   Manual backup entrypoint for the panel. Uses backup_core.sh with minimal side-effects.
#
# Called by:
#   veinctl backup, Cockpit VEIN Panel
#
# Outputs:
#   A tar.gz in /opt/games/vein/backups
#
# Return codes:
#   0 on success, non-zero on error.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -Eeuo pipefail

echo "[backup] Manuelles Backup (Server läuft ggf.)"
"/opt/games/vein/scripts/backup_core.sh"
echo "[backup] Fertig"
