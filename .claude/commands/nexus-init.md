---
description: Detect platform, validate setup, and configure scripts for this machine
argument-hint: (no arguments needed)
allowed-tools: Bash(uname:*), Bash(bash:*), Bash(find:*), Bash(ls:*), Bash(chmod:*), Bash(git config:*), Bash(git tag:*), Bash(git fetch:*)
---

Run the vault initialization check. This validates setup and stores configuration so commands work correctly on this machine. Run once after cloning.

## Step 1: Detect platform

Run `uname 2>/dev/null`. Expected output: `Darwin` (macOS), `Linux`, or `MINGW*` / `MSYS*` (Git for Windows). All use bash.

## Step 2: Resolve vault root

```bash
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
```

Note whether NEXUS_VAULT_PATH was set explicitly or fell back to CWD.

## Step 3: Make scripts executable

```bash
chmod +x "$VAULT_ROOT/scripts/"*.sh 2>/dev/null || true
```

## Step 4: Verify scripts exist

Check that `scripts/` contains `.sh` files. Report the count.

## Step 5: Test a script

```bash
bash "$VAULT_ROOT/scripts/inbox-list.sh"
```

If this succeeds, scripts are working.

## Step 6: Write shell config to `.claude/settings.local.json`

Write or update `.claude/settings.local.json`:

```json
{
  "defaultShell": "bash"
}
```

Merge with any existing content — do not overwrite other settings.

## Step 7: Git user identity

Run `git config user.name` and `git config user.email`.

If either is empty, obsidian-git commits will fail silently. Record as ✗ and show the fix:
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Step 8: demo-start tag

Run: `git tag --list demo-start`

If missing, demo commands fail. Record as ✗ and show the fix:
```bash
git fetch --tags
```

## Step 9: NEXUS_VAULT_PATH profile hint

Always print the exact line to add to the shell profile, whether or not CWD fallback is active:

```bash
export NEXUS_VAULT_PATH="<resolved vault root>"
```

Add to `~/.zshrc`, `~/.bashrc`, or `~/.bash_profile` (MINGW: `~/.bashrc`).

## Step 10: Report

```
NEXUS VAULT INIT

Platform:       <macOS | Linux | Windows/MINGW> (bash)
Vault root:     <path> (from NEXUS_VAULT_PATH | CWD fallback)
Scripts:        ✓ <N> .sh files found
inbox-list:     ✓ <script output>
Shell saved:    ✓ defaultShell = bash in .claude/settings.local.json
Git identity:   ✓ Name <email> | ✗ Not set — run: git config --global ...
demo-start tag: ✓ found | ✗ missing — run: git fetch --tags

NEXUS_VAULT_PATH profile line:
  export NEXUS_VAULT_PATH="<path>"   ← add to ~/.zshrc / ~/.bashrc

Setup complete. | N items need attention (see ✗ above).
```
