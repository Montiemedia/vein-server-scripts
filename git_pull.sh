#!/usr/bin/env bash
# ==============================================================================
# Git Helper Script
# File: git_pull.sh
#
# Purpose:
#   Fetches and pulls the latest changes from origin for the current branch (fast-forward only).
# ==============================================================================

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

echo "==============================="
echo " VEIN Git Pull Script"
echo "==============================="
echo

if [ ! -d ".git" ]; then
  echo "❌ Kein Git-Repository gefunden."
  exit 1
fi

BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")"
if [ -z "$BRANCH" ]; then
  echo "❌ Konnte aktuellen Branch nicht ermitteln."
  exit 1
fi

echo "Repo: $REPO_DIR"
echo "Branch: $BRANCH"
echo

echo "➡️  Fetch..."
git fetch --prune

LOCAL="$(git rev-parse HEAD)"
REMOTE="$(git rev-parse "origin/$BRANCH")"

if [ "$LOCAL" = "$REMOTE" ]; then
  echo "ℹ️  Bereits aktuell (origin/$BRANCH)."
  exit 0
fi

echo "➡️  Pull von origin/$BRANCH..."
git pull --ff-only

echo
echo "✅ Pull erfolgreich abgeschlossen."
