---
description: Break a topic into 3 concrete first steps — the smallest possible starting points
argument-hint: <topic or project>
allowed-tools: Bash(echo:*), Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*)
---

Resolve the vault root: run `echo $NEXUS_VAULT_PATH` and store the result as `$VAULT_ROOT`. If empty, stop and tell the user to set `NEXUS_VAULT_PATH` in their shell profile.

Find the first steps for **$ARGUMENTS**.

1. **Search the vault** for relevant pages:
   - `grep -r -l --include="*.md" "keyword" $VAULT_ROOT/wiki/ $VAULT_ROOT/dev/`
   - Read any open investigations, ADRs, learning tracks, or project notes related to this topic

2. **Identify the current state** — what's already known, decided, or done?

3. **Output exactly 3 next actions:**

   ```
   NEXT ACTIONS for: <topic>

   1. [action verb] <specific, concrete step> — takes ~X minutes
   2. [action verb] <specific, concrete step> — takes ~X minutes
   3. [action verb] <specific, concrete step> — takes ~X minutes

   Smallest first step: action 1.
   ```

Rules for good next actions:
- Start with an action verb (Run, Read, Write, Open, Ask, Check, Try)
- Be specific enough that there's no ambiguity about what to do
- Make step 1 the smallest possible thing — the one you could do in under 5 minutes
- No vague goals ("learn more about X") — only concrete actions

4. **Update `$VAULT_ROOT/context.md`** — set `next-action` to step 1.
