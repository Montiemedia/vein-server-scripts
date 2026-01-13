#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: restart.sh
# Updated: 2025-12-26
#
# Purpose:
#   Stops then starts the server (wrapper around stop.sh and start.sh).
#
# Called by:
#   veinctl restart, Cockpit VEIN Panel
#
# Outputs:
#   Console messages
#
# Return codes:
#   0 on success, non-zero on error.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -Eeuo pipefail
/opt/games/vein/scripts/stop.sh || true
sleep 2
/opt/games/vein/scripts/start.sh
