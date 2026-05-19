# Called by Stop hook and /wrap command — updates last-session date and inbox-count
$VaultRoot = if ($env:NEXUS_VAULT_PATH) { $env:NEXUS_VAULT_PATH } else { (Get-Location).Path }
$Today = Get-Date -Format 'yyyy-MM-dd'
$Count = @(Get-ChildItem -Path "$VaultRoot\inbox" -File -ErrorAction SilentlyContinue).Count
$Context = "$VaultRoot\context.md"
if (Test-Path $Context) {
    (Get-Content $Context) `
        -replace 'last-session: .*', "last-session: `"$Today`"" `
        -replace 'inbox-count: .*', "inbox-count: $Count" |
        Set-Content $Context
}
