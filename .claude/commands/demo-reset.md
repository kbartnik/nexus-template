---
description: Create a clean demo branch from demo-start — leaves real data untouched
argument-hint: (no arguments needed)
allowed-tools: Bash(git:*)
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

Create an isolated demo branch from the `demo-start` tag. Real data on `main` is never touched.

```bash
cd "$VAULT_ROOT"

# Stash any uncommitted work on the current branch
git stash --include-untracked

# Delete existing demo branch if present, then create fresh from tag
git branch -D demo 2>/dev/null || true
git checkout -b demo demo-start
```

Obsidian now shows the clean demo vault: sample wiki pages, inbox seed present, context blanked.

Confirm in one line: `Demo branch ready. Run /demo-cleanup when done.`

> Note: If the `demo-start` tag doesn't exist, run `git tag demo-start` from a clean vault state first.
