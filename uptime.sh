#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: uptime.sh
# Updated: 2025-12-26
#
# Purpose:
#   Prints server uptime seconds (simple helper).
#
# Called by:
#   status.sh or manual debugging
#
# Outputs:
#   Seconds as integer, or exits 3 if not running
#
# Return codes:
#   0 if running, 3 if not running.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -euo pipefail

# PID finden
pid="$(pgrep -f 'VeinServer-Linux' | head -n1 || true)"
[[ -n "${pid:-}" ]] || exit 3

# Laufzeit in Sekunden (etime seconds)
# ps liefert etimes = elapsed time since the process was started, in seconds
ps -o etimes= -p "$pid" | awk '{print $1}'
exit 0
