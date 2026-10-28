#!/usr/bin/env bash
set -euo pipefail

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
command -v mise >/dev/null 2>&1 && eval "$(mise activate bash --shims)"

if ! command -v shellcheck >/dev/null 2>&1; then
  echo "preflight: shellcheck is not installed. Install it with 'brew install shellcheck'." >&2
  exit 1
fi

# The Mintlify CLI runs through npx, not as a dependency: its own dependency tree
# carries high advisories that would fail the audit, and none of it reaches readers.
MINT="npx -y mint@4.2.993"

echo "=== Preflight ==="
echo "[1/4] Format"
pnpm exec prettier --check .
echo "[2/4] Lint"
shellcheck scripts/*.sh scripts/hooks/*.sh
echo "[3/4] Mintlify build"
$MINT validate
echo "[4/4] Links"
$MINT broken-links --check-anchors
echo "All preflight gates passed."
