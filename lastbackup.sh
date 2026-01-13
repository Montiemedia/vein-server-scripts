#!/usr/bin/env bash

set -euo pipefail

DIR="/opt/games/vein/backups"

# Wir akzeptieren alte und neue Namensschemata:
# - vein_YYYYMMDD_HHMMSS.tar.gz
# - vein_full_YYYYMMDD_HHMMSS.tar.gz (Altbestand)
# - saved_YYYYMMDD_HHMMSS.tar.gz (Altbestand)
#
# Ausgabeformat fuer das Panel:
#   "<dd.mm.yyyy HH:MM Uhr>|<voller Pfad>"
# Wenn nichts gefunden wird:
#   "||"

shopt -s nullglob
candidates=( "$DIR"/vein_*.tar.gz "$DIR"/vein_full_*.tar.gz "$DIR"/saved_*.tar.gz )
shopt -u nullglob

latest=""
if ((${#candidates[@]})); then
  # Sortiere nach mtime, neuestes zuerst
  latest="$(ls -1t "${candidates[@]}" 2>/dev/null | head -n 1 || true)"
fi

if [[ -z "${latest}" ]]; then
  echo "||"
  exit 0
fi

base="$(basename "$latest")"

human=""
if [[ "$base" =~ ^(vein|saved|vein_full)_([0-9]{8})_([0-9]{6})\.tar\.gz$ ]]; then
  d="${BASH_REMATCH[2]}"
  t="${BASH_REMATCH[3]}"
  yyyy="${d:0:4}"
  mm="${d:4:2}"
  dd="${d:6:2}"
  HH="${t:0:2}"
  MI="${t:2:2}"
  human="${dd}.${mm}.${yyyy} ${HH}:${MI} Uhr"
else
  # Fallback: mtime vom Dateisystem
  # Beispiel: "2025-12-26 15:40:17.000000000 +0000"
  mt="$(stat -c '%y' "$latest" 2>/dev/null || true)"
  human="${mt:-?}"
fi

echo "${human}|${latest}"
