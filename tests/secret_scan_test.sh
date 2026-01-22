#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$ROOT_DIR/git_precommit_secrets_check.sh"

TMP_DIR="$(mktemp -d)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

cp "$SCRIPT" "$TMP_DIR/"
cp "$ROOT_DIR/git_push.sh" "$TMP_DIR/"

cd "$TMP_DIR"
git init -q

git add git_precommit_secrets_check.sh git_push.sh
if ! bash ./git_precommit_secrets_check.sh >/dev/null; then
  echo "Expected secret scan to pass when only helper scripts are staged."
  exit 1
fi

echo "password=supersecret" > secrets.env
git add secrets.env
if bash ./git_precommit_secrets_check.sh >/dev/null; then
  echo "Expected secret scan to fail when a secret pattern is staged."
  exit 1
fi

echo "OK: secret scan test passed."
