#!/bin/bash
# Called by PostToolUse hooks — updates inbox-count in context.md
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
COUNT=$(find "$VAULT_ROOT/inbox" -maxdepth 1 -type f 2>/dev/null | wc -l | tr -d ' ')
CONTEXT="$VAULT_ROOT/context.md"
[ -f "$CONTEXT" ] || exit 0
TMPFILE=$(mktemp)
sed "s/inbox-count: .*/inbox-count: $COUNT/" "$CONTEXT" > "$TMPFILE"
mv "$TMPFILE" "$CONTEXT"
