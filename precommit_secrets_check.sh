#!/bin/bash

# Pre-Commit Secret Scan for VEIN scripts
# Author: Montiemedia

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

echo "==============================="
echo " VEIN Pre-Commit Secret Check"
echo "==============================="

if [ ! -d ".git" ]; then
  echo "❌ Kein Git-Repository"
  exit 1
fi

FILES=$(
  { git diff --cached --name-only --diff-filter=ACMR
    git ls-files --others --exclude-standard; } | sort -u
)

if [ -z "$FILES" ]; then
  echo "ℹ️  Keine Dateien zum Prüfen (nichts staged/untracked)."
  exit 0
fi

PATTERN='pass(w(or)?d)?|token|api[_-]?key|secret|bearer|authorization|discord|webhook|ssh-rsa|BEGIN (RSA|OPENSSH) PRIVATE KEY'

FOUND=0
while IFS= read -r f; do
  [ -f "$f" ] || continue

  # Dateien ignorieren, die zwangsläufig das Pattern enthalten
  case "$f" in
    precommit_secrets_check.sh|git_push.sh) continue ;;
  esac

  # Treffer suchen, aber Zeilen ignorieren, die nur Script-Namen enthalten
  MATCHES="$(grep -nI -E "$PATTERN" "$f" | grep -vE "precommit_secrets_check\.sh|git_push\.sh" || true)"
  if [ -n "$MATCHES" ]; then
    echo
    echo "❌ Treffer in: $f"
    echo "$MATCHES" | sed 's/^/ /'
    FOUND=1
  fi
done <<< "$FILES"

if [ "$FOUND" -ne 0 ]; then
  echo
  echo "Abbruch. Bitte Treffer bereinigen oder in .env auslagern und ignorieren."
  exit 1
fi

echo "✅ Kein Secret-Muster in den zu commitenden Dateien gefunden."
