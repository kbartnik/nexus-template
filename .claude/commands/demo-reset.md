---
description: Reset vault to clean demo state by checking out the demo-start tag
argument-hint: (no arguments needed)
allowed-tools: Bash(git:*)
---

Resolve the vault root: run `echo $NEXUS_VAULT_PATH` and store the result as `$VAULT_ROOT`. If empty, stop and tell the user to set `NEXUS_VAULT_PATH` in their shell profile.

Reset the vault to the clean demo state.

```bash
cd "$VAULT_ROOT" && git checkout demo-start -- .
```

This restores all tracked files to the state at the `demo-start` tag without changing the branch or losing any commits. The inbox seed file and blanked context.md are restored.

Confirm in one line: `Reset to demo-start. Vault is ready for another run.`

> Note: If the `demo-start` tag doesn't exist, create it first by running:
> `git tag demo-start` at a clean vault state.
