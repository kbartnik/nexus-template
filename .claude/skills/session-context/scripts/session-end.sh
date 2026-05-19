#!/bin/bash
# Called by Stop hook and /wrap command — updates last-session date and inbox-count
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
TODAY=$(date +%Y-%m-%d)
COUNT=$(find "$VAULT_ROOT/inbox" -maxdepth 1 -type f 2>/dev/null | wc -l | tr -d ' ')
CONTEXT="$VAULT_ROOT/context.md"
[ -f "$CONTEXT" ] || exit 0
TMPFILE=$(mktemp)
sed "s/last-session: .*/last-session: \"$TODAY\"/" "$CONTEXT" | \
sed "s/inbox-count: .*/inbox-count: $COUNT/" > "$TMPFILE"
mv "$TMPFILE" "$CONTEXT"
