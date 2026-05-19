---
description: List everything sitting in inbox/ — one line per file
argument-hint: (no arguments needed)
allowed-tools: Bash(find:*), Bash(ls:*), Bash(wc:*), Bash(echo:*)
---

Resolve the vault root: run `echo $NEXUS_VAULT_PATH` and store the result as `$VAULT_ROOT`. If empty, stop and tell the user to set `NEXUS_VAULT_PATH` in their shell profile.

List all files in `$VAULT_ROOT/inbox/`.

```bash
find "$VAULT_ROOT/inbox" -name "*.md" | sort
```

Output one line per file — filename only, no paths:
```
Inbox: N items
- filename-one.md
- filename-two.md
```

If inbox is empty: `Inbox: empty`

Do not read file contents. Do not analyze. Do not suggest actions unless inbox has more than 10 items, in which case add one line: `Run /ingest to clear the queue.`
