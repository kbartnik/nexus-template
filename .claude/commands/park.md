---
description: Park a derailing idea — shelve it cleanly and return to current focus
argument-hint: <idea to park>
allowed-tools: Bash(echo:*), Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*)
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

Park **$ARGUMENTS** and return to current focus.

1. **Append to `$VAULT_ROOT/context.md` `parked-ideas` list:**
   ```yaml
   - "[YYYY-MM-DD] $ARGUMENTS"
   ```

2. **Create a question stub** if warranted:
   - If it's a question worth investigating later: add a brief note to `$VAULT_ROOT/wiki/index.md` under Open Questions
   - Keep it minimal — just enough to find it later

3. **Name the return target** — read `$VAULT_ROOT/context.md` for `current-focus`:
   ```
   Parked: "$ARGUMENTS"
   Back to: <current-focus>
   ```

4. Return in one line. No elaboration on the parked idea.

The idea is now safe. Retrieve it later with `/query` or find it in the Parked Ideas section of `$VAULT_ROOT/context.md`.
