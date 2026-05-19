#!/bin/bash
# Called by /nexus-purge — removes all default template content, resets vault to pristine state
VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"
cd "$VAULT_ROOT" || exit 1

TODAY=$(date +%Y-%m-%d)

echo "Removing default template content..."

git rm inbox/knowledge-management-primer.md 2>/dev/null || true
git rm wiki/concepts/Vault-Zones.md 2>/dev/null || true
git rm wiki/concepts/Wikilink-Conventions.md 2>/dev/null || true
git rm wiki/syntheses/Getting-Started.md 2>/dev/null || true
git rm dev/adr/ADR-0001-three-zone-model.md 2>/dev/null || true
git rm dev/investigations/example-investigation.md 2>/dev/null || true

echo "Resetting structural files..."

cat > wiki/index.md << EOF
---
title: Wiki Index
type: index
tags: [index]
created: $TODAY
updated: $TODAY
sources: []
---

# Wiki Index

Master catalog of all pages in this vault.

---

## Concepts

*(none yet)*

---

## Entities

*(none yet)*

---

## Syntheses

*(none yet)*

---

## Open Questions

*(parked ideas and questions worth investigating — added via \`/park\`)*
EOF

cat > wiki/log.md << 'EOF'
# Wiki Log

Append-only. Never edit existing entries.

---
EOF

cat > context.md << 'EOF'
---
last-session: ""
current-focus: ""
active-projects: []
next-action: ""
parked-ideas: []
inbox-count: 0
session-count: 0
last-nudged-command: ""
---
EOF

git add wiki/index.md wiki/log.md context.md
git commit -m "Remove default template content — vault ready for use"

echo ""
echo "PURGE COMPLETE"
echo ""
echo "Removed:"
echo "  inbox/knowledge-management-primer.md"
echo "  wiki/concepts/Vault-Zones.md"
echo "  wiki/concepts/Wikilink-Conventions.md"
echo "  wiki/syntheses/Getting-Started.md"
echo "  dev/adr/ADR-0001-three-zone-model.md"
echo "  dev/investigations/example-investigation.md"
echo ""
echo "Reset:"
echo "  wiki/index.md   — empty catalog"
echo "  wiki/log.md     — header only"
echo "  context.md      — blank defaults"
echo ""
echo "Vault is pristine. Run /nexus-init to complete setup for this machine."
