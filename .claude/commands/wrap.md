---
description: End the session — update context.md, log the session, report summary
argument-hint: (no arguments needed)
allowed-tools: Bash(find:*), Bash(ls:*), Bash(wc:*), Bash(date:*)
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

Load the `session-context` skill and run the Session End Protocol.

1. **Update `$VAULT_ROOT/context.md`** — write ALL fields:
   - `last-session`: today's date (YYYY-MM-DD)
   - `current-focus`: what was actually worked on this session (1–5 words)
   - `next-action`: the single most concrete next step — action verb, specific target, no ambiguity. Good: "Run `/ingest` on the article in inbox". Bad: "Continue research."
   - `parked-ideas`: append any new ideas parked this session (do not remove old ones)
   - `inbox-count`: count all files in `$VAULT_ROOT/inbox/` right now and update
   - `session-count`: leave as-is (already incremented at session start)
   - `last-nudged-command`: leave as-is

2. **Append to `$VAULT_ROOT/wiki/log.md`**:
   ```
   ## [YYYY-MM-DD] session-end | <2-word summary of what was done>
   ```

3. **Report 3-line session summary**:
   ```
   Done: <what was accomplished>
   Next: <next-action value>
   Parked: <any new parked ideas, or "nothing">
   ```

Stop after the summary. Do not ask follow-up questions.
