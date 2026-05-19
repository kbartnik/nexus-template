---
description: Remove the demo branch and return to real vault state on main
argument-hint: (no arguments needed)
allowed-tools: Bash(bash:*), Bash(pwsh:*), Bash(git checkout:*), Bash(git stash:*), Bash(git branch:*)
---

Run the demo-cleanup script to return to main and remove the demo branch.

Detect platform and run:

**macOS / Linux / Git Bash:**
```bash
bash scripts/demo-cleanup.sh
```

**Windows (PowerShell):**
```powershell
& .\scripts\demo-cleanup.ps1
```

The script checks out `main`, pops any stashed work, and deletes the `demo` branch. Output the script result and stop.
