---
description: Zero-friction inbox dump — write a thought to inbox/ without side effects
argument-hint: <thought, URL, or note>
allowed-tools: Bash(echo:*), Bash(date:*), Bash(ls:*), Bash(wc:*)
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

Capture **$ARGUMENTS** to the inbox. No wiki edits. No analysis. No questions. Just write and return.

1. Get today's date: `YYYY-MM-DD`
2. Append to `$VAULT_ROOT/inbox/YYYY-MM-DD-inbox.md` (create if it doesn't exist):
   ```
   - HH:MM — $ARGUMENTS
   ```
3. Update `inbox-count` in `$VAULT_ROOT/context.md` (count all files in `$VAULT_ROOT/inbox/`)
4. Confirm in one line: `Captured. Inbox: N items.`
5. Return immediately to whatever was happening before.

That's it. Do not analyze, do not suggest follow-up actions, do not ask questions.
