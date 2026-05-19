---
description: Surface relevant commands — all or filtered by group
argument-hint: [wiki | session | dev | investigator | learner] (optional)
allowed-tools: Bash(echo:*), Bash(cat:*)
---

Resolve the vault root: run `echo $NEXUS_VAULT_PATH` and store the result as `$VAULT_ROOT`. If empty, stop and tell the user to set `NEXUS_VAULT_PATH` in their shell profile.

Show the command reference for **$ARGUMENTS** (or all commands if no argument).

Read `$VAULT_ROOT/CHEATSHEET.md` and display the relevant section.

- No argument → show full cheatsheet
- `wiki` → show Wiki section only
- `session` → show Session section only
- `dev` → show Developer section only
- `investigator` → show Investigator section only
- `learner` → show Learner section only

Output the table as-is. Keep it fast.
