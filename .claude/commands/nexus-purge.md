---
description: Remove all default template content and reset to a pristine vault
argument-hint: (no arguments needed)
allowed-tools: Bash(bash:*)
---

Run the purge script to remove all default template content and reset the vault to a blank state ready for real use.

```bash
bash .claude/commands/nexus-purge.sh
```

This removes the six default content files (wiki pages, ADR, investigation, inbox seed), resets `wiki/index.md`, `wiki/log.md`, and `context.md` to blank templates, and commits the result.

**This operation is permanent.** The `demo-start` tag still points to the pre-purge state — you can still run `/nexus-demo-reset` to demo from the original content on a separate branch.
