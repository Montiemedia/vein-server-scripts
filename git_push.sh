#!/usr/bin/env bash
# ==============================================================================
# Git Helper Script
# File: git_push.sh
#
# Purpose:
#   Adds changes, creates a commit message interactively, runs secret scan, and pushes to origin.
# ==============================================================================

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$REPO_DIR"

# Pre-Commit Secret Check
./precommit_secrets_check.sh || exit 1


echo "==============================="
echo " VEIN Git Push Script"
echo " Repo: $REPO_DIR"
echo "==============================="
echo

# Prüfen ob wir in einem Git Repo sind
if [ ! -d ".git" ]; then
  echo "❌ Kein Git-Repository gefunden."
  exit 1
fi

# Status anzeigen
echo "Aktueller Git-Status:"
git status
echo

# Prüfen ob es Änderungen gibt
if git diff --quiet && git diff --cached --quiet; then
  echo "ℹ️  Keine Änderungen zum Committen."
  exit 0
fi

# Commit Message abfragen
read -rp "Commit-Beschreibung eingeben: " COMMIT_MSG

if [ -z "$COMMIT_MSG" ]; then
  echo "❌ Commit-Beschreibung darf nicht leer sein."
  exit 1
fi

echo
echo "➡️  Dateien werden hinzugefügt..."
git add -A

echo "➡️  Commit wird erstellt..."
git commit -m "$COMMIT_MSG"

echo "➡️  Push zu origin/main..."
git push

echo
echo "✅ Push erfolgreich abgeschlossen."
