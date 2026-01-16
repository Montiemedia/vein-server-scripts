#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: uptime.sh
#
# Purpose:
#   Displays how long the VEIN dedicated server has been running.
#
# Called by:
#   menu.sh, operators
#
# Outputs:
#   Prints uptime information to stdout.
#
# Return codes:
#   0 = success
#   1+ = error
# ==============================================================================

set -euo pipefail

# PID finden
pid="$(pgrep -f 'VeinServer-Linux' | head -n1 || true)"
[[ -n "${pid:-}" ]] || exit 3

# Laufzeit in Sekunden (etime seconds)
# ps liefert etimes = elapsed time since the process was started, in seconds
ps -o etimes= -p "$pid" | awk '{print $1}'
exit 0
