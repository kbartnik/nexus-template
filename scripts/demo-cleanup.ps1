# Called by /demo-cleanup command — returns to main and deletes demo branch
$VaultRoot = if ($env:NEXUS_VAULT_PATH) { $env:NEXUS_VAULT_PATH } else { (Get-Location).Path }
Set-Location $VaultRoot
git checkout main
git stash pop 2>$null
git branch -D demo
Write-Output 'Back on main. Demo branch deleted.'
