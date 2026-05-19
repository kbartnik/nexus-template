---
description: List everything sitting in inbox/ — one line per file
argument-hint: (no arguments needed)
allowed-tools: Bash(find:*), Bash(ls:*), Bash(wc:*), Bash(echo:*)
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

List all files in `$VAULT_ROOT/inbox/` — all types, not just `.md`.

```bash
find "$VAULT_ROOT/inbox" -maxdepth 1 -type f | sort
```

Output one line per file — filename only, no paths:
```
Inbox: N items
- filename-one.md
- report.pdf
- note.txt
```

If inbox is empty: `Inbox: empty`

Do not read file contents. Do not analyze. Do not suggest actions unless inbox has more than 10 items, in which case add one line: `Run /ingest to clear the queue.`
