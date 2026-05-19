# Called by /inbox command — lists all files in inbox/
$VaultRoot = if ($env:NEXUS_VAULT_PATH) { $env:NEXUS_VAULT_PATH } else { (Get-Location).Path }
$Files = @(Get-ChildItem -Path "$VaultRoot\inbox" -File -ErrorAction SilentlyContinue | Sort-Object Name)
$Count = $Files.Count

if ($Count -eq 0) {
    Write-Output 'Inbox: empty'
} else {
    Write-Output "Inbox: $Count items"
    $Files | ForEach-Object { Write-Output "- $($_.Name)" }
    if ($Count -gt 10) { Write-Output 'Run /ingest to clear the queue.' }
}
