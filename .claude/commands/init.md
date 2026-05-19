---
description: Detect platform, validate setup, and configure scripts for this machine
argument-hint: (no arguments needed)
allowed-tools: Bash(uname:*), Bash(bash:*), Bash(pwsh:*), Bash(find:*), Bash(ls:*), Bash(chmod:*), Bash(git config:*), Bash(git tag:*), Bash(git fetch:*)
---

Run the vault initialization check. This detects your platform, verifies the setup, and stores the configuration so other commands know which scripts to use without re-detecting each time.

## Step 1: Detect platform

Run `uname 2>/dev/null`. If it returns output (Darwin, Linux, etc.), you are on **bash** (macOS/Linux/Git Bash). If it errors or returns nothing, you are on **PowerShell** (Windows).

## Step 2: Resolve vault root

`VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` (bash) or `$VaultRoot = if ($env:NEXUS_VAULT_PATH) { $env:NEXUS_VAULT_PATH } else { (Get-Location).Path }` (PowerShell).

Note whether NEXUS_VAULT_PATH was set explicitly or fell back to CWD.

## Step 3: Make bash scripts executable (bash only)

```bash
chmod +x "$VAULT_ROOT/scripts/"*.sh 2>/dev/null || true
```

## Step 4: Verify scripts exist

Check that `scripts/` contains both `.sh` and `.ps1` files. Report the count.

## Step 5: Test the platform-appropriate script

**bash:** `bash "$VAULT_ROOT/scripts/inbox-list.sh"`
**PowerShell:** `& "$VaultRoot\scripts\inbox-list.ps1"`

If this succeeds, scripts are working.

## Step 6: Write platform to `.claude/settings.local.json`

Write or update `.claude/settings.local.json` with `defaultShell` so all hooks and future commands use the right shell without re-detecting:

**bash:**
```json
{
  "defaultShell": "bash"
}
```

**PowerShell:**
```json
{
  "defaultShell": "powershell"
}
```

Merge with any existing content in `settings.local.json` — do not overwrite other settings.

## Step 7: PowerShell execution policy (PowerShell only)

Run: `Get-ExecutionPolicy -Scope CurrentUser`

If result is `Restricted` or `AllSigned`, `.ps1` scripts cannot run. Record as ✗ and show the fix:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

If `RemoteSigned`, `Unrestricted`, or `Bypass`, record as ✓.

## Step 8: Git user identity

Run:
- bash: `git config user.name` and `git config user.email`
- PowerShell: `git config user.name` and `git config user.email`

If either is empty, obsidian-git commits will fail silently. Record as ✗ and show the fix:
```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Step 9: demo-start tag

Run: `git tag --list demo-start`

If the tag is missing (e.g. fresh clone where tags weren't fetched), demo commands fail. Record as ✗ and show the fix:
```
git fetch --tags
```

## Step 10: NEXUS_VAULT_PATH profile hint

Always print the exact line to add to their shell profile, regardless of whether CWD fallback is active:

**bash** — add to `~/.zshrc` or `~/.bashrc`:
```bash
export NEXUS_VAULT_PATH="<resolved vault root>"
```

**PowerShell** — add to `$PROFILE`:
```powershell
$env:NEXUS_VAULT_PATH = "<resolved vault root>"
```

Note whether it is currently set or using the CWD fallback.

## Step 11: Report

Print a full checklist:
```
NEXUS VAULT INIT

Platform:       <macOS (bash) | Windows (PowerShell) | Linux (bash)>
Vault root:     <path> (from NEXUS_VAULT_PATH | CWD fallback)
Scripts:        ✓ <N> files found
inbox-list:     ✓ <script output>
Shell saved:    ✓ defaultShell = bash|powershell in .claude/settings.local.json
PS policy:      ✓ RemoteSigned | ✗ Restricted — run: Set-ExecutionPolicy ...
Git identity:   ✓ Name <email> | ✗ Not set — run: git config --global ...
demo-start tag: ✓ found | ✗ missing — run: git fetch --tags

NEXUS_VAULT_PATH profile line:
  export NEXUS_VAULT_PATH="<path>"   ← add to ~/.zshrc or ~/.bashrc

Setup complete. | N items need attention (see ✗ above).
```

Show only the PS policy line on Windows. Show all other lines on all platforms.
