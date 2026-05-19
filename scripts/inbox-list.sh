#!/bin/bash
# Called by /inbox command — lists all files in inbox/
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
FILES=$(find "$VAULT_ROOT/inbox" -maxdepth 1 -type f 2>/dev/null | sort)
COUNT=$(echo "$FILES" | grep -c . 2>/dev/null || echo 0)
[ -z "$FILES" ] && COUNT=0

if [ "$COUNT" -eq 0 ]; then
  echo "Inbox: empty"
else
  echo "Inbox: $COUNT items"
  while IFS= read -r f; do
    [ -n "$f" ] && echo "- $(basename "$f")"
  done <<< "$FILES"
  [ "$COUNT" -gt 10 ] && echo "Run /ingest to clear the queue."
fi
