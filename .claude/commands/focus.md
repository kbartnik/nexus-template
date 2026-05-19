---
description: Check current focus vs. what was planned — catch drift early
argument-hint: (no arguments needed)
allowed-tools: Bash(echo:*), Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*)
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

Check current focus status.

1. **Read `$VAULT_ROOT/context.md`** — get `current-focus` and `next-action`
2. **Read last 10 entries of `$VAULT_ROOT/wiki/log.md`** — what has this session actually touched?

3. **Report:**

   ```
   FOCUS CHECK

   Planned focus: <current-focus from context.md>
   Planned next action: <next-action>

   This session touched:
   - <topics or files from log>

   Assessment: On track / Drifted into <topic>
   ```

4. **If drifted**, offer three options:
   - "Park the drift topic and return to [current-focus]" — use `/park`
   - "Switch official focus to [drift topic]" — update `$VAULT_ROOT/context.md`
   - "Keep going — this drift is actually important" — update `next-action` to reflect reality

No judgment. The goal is to make the choice explicit.
