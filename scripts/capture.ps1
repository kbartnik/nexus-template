# Called by /capture command — appends a thought to inbox, updates count
param([Parameter(ValueFromRemainingArguments)][string[]]$Thought)
$VaultRoot = if ($env:NEXUS_VAULT_PATH) { $env:NEXUS_VAULT_PATH } else { (Get-Location).Path }
$ThoughtText = $Thought -join ' '
$Date = Get-Date -Format 'yyyy-MM-dd'
$Time = Get-Date -Format 'HH:mm'
$InboxFile = "$VaultRoot\inbox\$Date-inbox.md"

if (-not (Test-Path $InboxFile)) {
    "# Inbox $Date" | Set-Content $InboxFile
}
"- $Time — $ThoughtText" | Add-Content $InboxFile

$Count = @(Get-ChildItem -Path "$VaultRoot\inbox" -File -ErrorAction SilentlyContinue).Count
$Context = "$VaultRoot\context.md"
if (Test-Path $Context) {
    (Get-Content $Context) -replace 'inbox-count: .*', "inbox-count: $Count" | Set-Content $Context
}

Write-Output "Captured. Inbox: $Count items."
