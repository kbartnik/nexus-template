#!/bin/bash
# Called by /demo-reset command — creates a clean demo branch from demo-start tag
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
cd "$VAULT_ROOT" || exit 1
git stash --include-untracked 2>/dev/null || true
git branch -D demo 2>/dev/null || true
git checkout -b demo demo-start
echo "Demo branch ready. Run /nexus-demo-cleanup when done."
