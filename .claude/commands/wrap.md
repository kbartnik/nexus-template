---
description: End the session — update context.md, log the session, report summary
argument-hint: (no arguments needed)
allowed-tools: Bash(bash:*), Bash(pwsh:*), Bash(find:*), Bash(ls:*), Bash(wc:*)
---

End the session. The Stop hook handles timestamps and counts automatically — this command adds the LLM-authored summary.

**Step 1: Run the session-end script** (handles last-session date + inbox-count):

macOS / Linux / Git Bash:
```bash
bash scripts/session-end.sh
```

Windows (PowerShell):
```powershell
& .\scripts\session-end.ps1
```

**Step 2: LLM — fill in the content fields** in `context.md`:
- `current-focus`: what was actually worked on this session (1–5 words, action-oriented)
- `next-action`: the single most concrete next step — action verb, specific target, no ambiguity
- `parked-ideas`: append any new ideas parked this session (do not remove old ones)

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
