#!/bin/bash
# Called by /demo-cleanup command — returns to main and deletes demo branch
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
cd "$VAULT_ROOT" || exit 1
git checkout main
git stash pop 2>/dev/null || true
git branch -D demo
echo "Back on main. Demo branch deleted."
