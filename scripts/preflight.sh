#!/usr/bin/env bash
# Typecheck, test and build gates join when the app scaffold lands.
set -euo pipefail

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
command -v mise >/dev/null 2>&1 && eval "$(mise activate bash --shims)"

if ! command -v shellcheck >/dev/null 2>&1; then
  echo "preflight: shellcheck is not installed. Install it with 'brew install shellcheck'." >&2
  exit 1
fi

echo "=== Preflight ==="
echo "[1/2] Format"
pnpm exec prettier --check .
echo "[2/2] Lint"
shellcheck scripts/*.sh scripts/hooks/*.sh
echo "All preflight gates passed."
