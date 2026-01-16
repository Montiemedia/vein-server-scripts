#!/usr/bin/env bash
# ==============================================================================
# Git Helper Script
# File: git_status.sh
#
# Purpose:
#   Shows repository path, remote, current branch, last commit, and whether the working tree is clean.
# ==============================================================================


REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR" || exit 1

echo "==============================="
echo " VEIN Git Status"
echo "==============================="

if [ ! -d ".git" ]; then
  echo "❌ Kein Git-Repository"
  exit 1
fi

REPO_NAME="$(basename "$(git rev-parse --show-toplevel)")"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
REMOTE="$(git remote get-url origin 2>/dev/null || echo '—')"
LAST_COMMIT="$(git log -1 --pretty=format:'%h | %s | %an | %ad' --date=short)"

echo "Repo   : $REPO_NAME"
echo "Pfad   : $REPO_DIR"
echo "Remote : $REMOTE"
echo "Branch : $BRANCH"
echo "Commit : $LAST_COMMIT"

if ! git diff --quiet || ! git diff --cached --quiet; then
  echo
  echo "⚠️  Uncommitted Änderungen vorhanden"
else
  echo
  echo "✅ Working Tree sauber"
fi
