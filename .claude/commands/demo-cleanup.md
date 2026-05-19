---
description: Remove the demo branch and return to real vault state on main
argument-hint: (no arguments needed)
allowed-tools: Bash(git:*)
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

Return to the real vault and clean up the demo branch.

```bash
cd "$VAULT_ROOT"

# Return to main (real vault)
git checkout main

# Restore any stashed work from before the demo
git stash pop 2>/dev/null || true

# Delete the demo branch
git branch -D demo
```

Obsidian now shows your real vault. The demo branch is gone.

Confirm in one line: `Back on main. Demo branch deleted.`
