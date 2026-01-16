#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: restart.sh
#
# Purpose:
#   Restarts the VEIN dedicated server (stop then start).
#
# Called by:
#   menu.sh, operators, Cockpit panel (if wired)
#
# Outputs:
#   Writes progress and status information to stdout.
#
# Return codes:
#   0 = success
#   1+ = error
# ==============================================================================


set -Eeuo pipefail
/opt/games/vein/scripts/stop.sh || true
sleep 2
/opt/games/vein/scripts/start.sh
