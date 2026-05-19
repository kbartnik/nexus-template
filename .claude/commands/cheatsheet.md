---
description: Surface relevant commands — all or filtered by group
argument-hint: [wiki | session | dev | investigator | learner] (optional)
allowed-tools: Bash(echo:*), Bash(cat:*)
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

Show the command reference for **$ARGUMENTS** (or all commands if no argument).

Read `$VAULT_ROOT/CHEATSHEET.md` and display the relevant section.

- No argument → show full cheatsheet
- `wiki` → show Wiki section only
- `session` → show Session section only
- `dev` → show Developer section only
- `investigator` → show Investigator section only
- `learner` → show Learner section only

Output the table as-is. Keep it fast.
