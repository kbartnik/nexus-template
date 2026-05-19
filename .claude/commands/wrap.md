---
description: End the session — update context.md, log the session, report summary
argument-hint: (no arguments needed)
allowed-tools: Bash(bash:*)
---

End the session. The Stop hook updates timestamps automatically — this command adds the LLM-authored content fields.

**Step 1: Run the session-end script** (handles last-session date + inbox-count):

```bash
bash .claude/skills/session-context/session-end.sh
```

**Step 2: Update content fields** in `context.md`:
- `current-focus`: what was actually worked on this session (1–5 words, action-oriented)
- `next-action`: single most concrete next step — action verb, specific target, no ambiguity
- `parked-ideas`: append any new parked ideas (do not remove old ones)

Load the `session-context` skill for guidance on writing a good `next-action`.

**Step 3: Append to `wiki/log.md`:**
```
## [YYYY-MM-DD] session-end | <2-word summary>
```

**Step 4: Report 3-line summary:**
```
Done: <what was accomplished>
Next: <next-action value>
Parked: <any new parked ideas, or "nothing">
```

Stop after the summary.
