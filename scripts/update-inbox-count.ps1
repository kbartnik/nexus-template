# Called by PostToolUse hooks — updates inbox-count in context.md
$VaultRoot = if ($env:NEXUS_VAULT_PATH) { $env:NEXUS_VAULT_PATH } else { (Get-Location).Path }
$Count = @(Get-ChildItem -Path "$VaultRoot\inbox" -File -ErrorAction SilentlyContinue).Count
$Context = "$VaultRoot\context.md"
if (Test-Path $Context) {
    (Get-Content $Context) -replace 'inbox-count: .*', "inbox-count: $Count" | Set-Content $Context
}
