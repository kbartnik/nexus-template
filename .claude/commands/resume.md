---
description: Restore session context — read context.md and reconstruct where you were
argument-hint: (no arguments needed)
allowed-tools: Bash(echo:*), Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*), Bash(wc:*)
---

Resolve the vault root: run `echo $NEXUS_VAULT_PATH` and store the result as `$VAULT_ROOT`. If empty, stop and tell the user to set `NEXUS_VAULT_PATH` in their shell profile.

Restore session context from `$VAULT_ROOT/context.md`.

Load the `session-context` skill first.

1. **Read `$VAULT_ROOT/context.md`** — extract all fields
2. **Read `$VAULT_ROOT/wiki/log.md`** — find the last 5 entries to understand recent activity
3. **If `current-focus` points to a dev/ or wiki/ file**, read that file to reconstruct state
4. **Present the full context picture:**

   ```
   SESSION RESUME

   Last session: <last-session date>
   Focus: <current-focus>
   Next action: <next-action>

   Recent activity (from log):
   - <last 3 log entries>

   Parked ideas:
   - <parked-ideas list, or "none">

   Inbox: <inbox-count> items in inbox/
   ```

5. **Surface the next action directly** — do not ask a follow-up question. State what's ready to go:
   `Ready to: <next-action>`

If `$VAULT_ROOT/context.md` is empty (first session), say so briefly and wait.
