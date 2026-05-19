# Called by SessionStart hook — injects context.md briefing into model context
$VaultRoot = if ($env:NEXUS_VAULT_PATH) { $env:NEXUS_VAULT_PATH } else { (Get-Location).Path }
$Context = "$VaultRoot\context.md"
if (-not (Test-Path $Context)) { exit 0 }

$Content = Get-Content $Context -Raw
$Focus = if ($Content -match 'current-focus: "?([^"\n]*)"?') { $Matches[1].Trim() } else { '' }
$Next  = if ($Content -match 'next-action: "?([^"\n]*)"?')  { $Matches[1].Trim() } else { '' }
$Count = if ($Content -match 'inbox-count: (\d+)')           { $Matches[1] }         else { '0' }

if (-not $Focus) { $Focus = 'nothing recorded' }
if (-not $Next)  { $Next  = 'none set' }

$ContextText = "Last focus: $Focus\nNext action: $Next\nInbox: $Count items awaiting processing"
$Output = @{
    hookSpecificOutput = @{
        hookEventName   = 'SessionStart'
        additionalContext = $ContextText
    }
} | ConvertTo-Json -Compress
Write-Output $Output
