#!/bin/bash
# Called by SessionStart hook — injects context.md briefing into model context
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
CONTEXT="$VAULT_ROOT/context.md"
[ -f "$CONTEXT" ] || exit 0

FOCUS=$(grep -m1 'current-focus:' "$CONTEXT" | sed 's/current-focus: *//' | tr -d '"' | xargs)
NEXT=$(grep -m1 'next-action:' "$CONTEXT" | sed 's/next-action: *//' | tr -d '"' | xargs)
COUNT=$(grep -m1 'inbox-count:' "$CONTEXT" | sed 's/inbox-count: *//' | xargs)

[ -z "$FOCUS" ] && FOCUS="nothing recorded"
[ -z "$NEXT" ] && NEXT="none set"
[ -z "$COUNT" ] && COUNT="0"

printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"Last focus: %s\\nNext action: %s\\nInbox: %s items awaiting processing"}}' \
  "$FOCUS" "$NEXT" "$COUNT"
