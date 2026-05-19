# Called by /demo-reset command — creates a clean demo branch from demo-start tag
$VaultRoot = if ($env:NEXUS_VAULT_PATH) { $env:NEXUS_VAULT_PATH } else { (Get-Location).Path }
Set-Location $VaultRoot
git stash --include-untracked 2>$null
git branch -D demo 2>$null
git checkout -b demo demo-start
Write-Output 'Demo branch ready. Run /demo-cleanup when done.'
