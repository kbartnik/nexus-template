---
description: Zero-friction inbox dump — write a thought to inbox/ without side effects
argument-hint: <thought, URL, or note>
allowed-tools: Bash(bash:*), Bash(pwsh:*)
---

Run the capture script with **$ARGUMENTS** as the thought to capture.

Detect platform and run:

**macOS / Linux / Git Bash:**
```bash
bash scripts/capture.sh "$ARGUMENTS"
```

**Windows (PowerShell):**
```powershell
& .\scripts\capture.ps1 "$ARGUMENTS"
```

To detect: try `uname 2>/dev/null` — if it returns output, use bash. Otherwise use PowerShell.

The script appends the thought to `inbox/YYYY-MM-DD-inbox.md` and updates `inbox-count` in `context.md`. Output one line from the script and stop. No analysis, no follow-up.
