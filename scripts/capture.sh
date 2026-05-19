#!/bin/bash
# Called by /capture command — appends a thought to inbox, updates count
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
THOUGHT="$*"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)
INBOX_FILE="$VAULT_ROOT/inbox/$DATE-inbox.md"

[ -f "$INBOX_FILE" ] || printf '# Inbox %s\n' "$DATE" > "$INBOX_FILE"
printf '- %s — %s\n' "$TIME" "$THOUGHT" >> "$INBOX_FILE"

COUNT=$(find "$VAULT_ROOT/inbox" -maxdepth 1 -type f 2>/dev/null | wc -l | tr -d ' ')
CONTEXT="$VAULT_ROOT/context.md"
if [ -f "$CONTEXT" ]; then
  TMPFILE=$(mktemp)
  sed "s/inbox-count: .*/inbox-count: $COUNT/" "$CONTEXT" > "$TMPFILE"
  mv "$TMPFILE" "$CONTEXT"
fi

printf 'Captured. Inbox: %s items.\n' "$COUNT"
