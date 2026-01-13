#!/usr/bin/env bash
# ==============================================================================
# VEIN Dedicated Server Script
# File: stop.sh
# Updated: 2025-12-26
#
# Purpose:
#   Stops the VEIN server process gracefully, waits for exit, then makes a safety backup.
#
# Called by:
#   veinctl stop, restart.sh, backup_core.sh (when it needs a consistent backup), Cockpit VEIN Panel
#
# Outputs:
#   Console messages and a backup archive in /opt/games/vein/backups
#
# Return codes:
#   0 on success, non-zero on error.
#
# Notes:
#   - These scripts are designed to be called non-interactively (Cockpit panel).
#   - Do not add prompts (read/echo y/n) unless you also update the panel logic.
# ==============================================================================

set -Eeuo pipefail
# shellcheck disable=SC1091
source /opt/games/vein/scripts/lib.sh

load_conf

PIDFILE="$RUN_DIR/server.pid"
PROC_RE='VeinServer-Linux-Test'

echo "[stop] Stoppe VEIN Server..."

# 1) Sauber per PIDfile (falls vorhanden)
PID=""
if [[ -f "$PIDFILE" ]]; then
  PID="$(cat "$PIDFILE" 2>/dev/null || true)"
fi

if [[ -n "${PID:-}" ]] && kill -0 "$PID" 2>/dev/null; then
  echo "[stop] Sende TERM an PID $PID"
  kill "$PID" 2>/dev/null || true

  # bis zu 30s warten, damit Save sauber geschrieben wird
  for i in {1..30}; do
    if ! kill -0 "$PID" 2>/dev/null; then
      break
    fi
    sleep 1
  done

  # Falls immer noch da: härter
  if kill -0 "$PID" 2>/dev/null; then
    echo "[stop] PID $PID reagiert nicht, sende KILL"
    kill -9 "$PID" 2>/dev/null || true
  fi
fi

# 2) Fallback: Prozessname prüfen und ggf. beenden
if pgrep -u vein -f "$PROC_RE" >/dev/null 2>&1; then
  echo "[stop] Fallback: pkill TERM ($PROC_RE)"
  pkill -u vein -f "$PROC_RE" 2>/dev/null || true

  # nochmal warten
  for i in {1..20}; do
    if ! pgrep -u vein -f "$PROC_RE" >/dev/null 2>&1; then
      break
    fi
    sleep 1
  done

  # Notfalls KILL
  if pgrep -u vein -f "$PROC_RE" >/dev/null 2>&1; then
    echo "[stop] Fallback: pkill KILL ($PROC_RE)"
    pkill -9 -u vein -f "$PROC_RE" 2>/dev/null || true
  fi
fi

# 3) Jetzt erst: final sicherstellen, dass Server wirklich aus ist
if pgrep -u vein -f "$PROC_RE" >/dev/null 2>&1; then
  echo "[stop] FEHLER: Serverprozess läuft noch, Backup wird NICHT erstellt."
  exit 1
fi

# PIDFILE erst jetzt entfernen
rm -f "$PIDFILE" || true

echo "[stop] OK: gestoppt."
echo "[stop] Erstelle Sicherheitsbackup NACH dem Stop..."
/opt/games/vein/scripts/backup_core.sh
echo "[stop] Backup abgeschlossen."

