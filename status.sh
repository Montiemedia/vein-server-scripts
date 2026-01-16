#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: status.sh
#
# Purpose:
#   Shows current VEIN server status (process state, basic health info).
#
# Called by:
#   menu.sh, operators, monitoring checks
#
# Outputs:
#   Prints status information to stdout.
#
# Return codes:
#   0 = running/ok (depending on implementation)
#   1+ = not running/error
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

