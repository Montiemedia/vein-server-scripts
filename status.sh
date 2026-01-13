#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: status.sh
# Updated: 2025-12-26
#
# Purpose:
#   Checks whether the server is running and prints uptime seconds and start timestamp.
#
# Called by:
#   veinctl status, Cockpit VEIN Panel auto-refresh
#
# Outputs:
#   If running: "<seconds>|<start time>"; if not running: exits with code 3
#
# Return codes:
#   0 if running, 3 if not running, other on error.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -euo pipefail

# Prozess finden. Wir suchen explizit nach dem VEIN Dedicated Server Binary.
pid="$(pgrep -f "VeinServer-Linux" | head -n 1 || true)"

if [[ -z "${pid}" ]]; then
  # 3 = "nicht aktiv" (wird vom Panel als gestoppt interpretiert)
  exit 3
fi

# Sekunden seit Start (etimes)
etimes="$(ps -o etimes= -p "$pid" 2>/dev/null | tr -d ' ' || true)"
# Startzeit als lesbarer String (lstart)
lstart="$(ps -o lstart= -p "$pid" 2>/dev/null || true)"

if [[ -z "${etimes}" || -z "${lstart}" ]]; then
  exit 2
fi

echo "${etimes}|${lstart}"

