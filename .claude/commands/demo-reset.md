---
description: Create a clean demo branch from demo-start — leaves real data untouched
argument-hint: (no arguments needed)
allowed-tools: Bash(bash:*), Bash(pwsh:*), Bash(git checkout:*), Bash(git stash:*), Bash(git branch:*)
---

Run the demo-reset script to create an isolated demo branch.

Detect platform and run:

**macOS / Linux / Git Bash:**
```bash
bash scripts/demo-reset.sh
```

**Windows (PowerShell):**
```powershell
& .\scripts\demo-reset.ps1
```

The script stashes any uncommitted work, deletes any existing `demo` branch, and creates a fresh one from `demo-start`. Output the script result and stop.
