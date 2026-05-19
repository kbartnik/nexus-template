---
title: Wikilink Conventions
type: concept
tags: [vault-structure, obsidian, wikilinks]
created: 2026-05-18
updated: 2026-05-18
sources: []
status: active
---

# Wikilink Conventions

Wikilinks are how this vault stays navigable as it grows. Consistent conventions mean Claude and Obsidian's graph view agree on what connects to what.

## Syntax

Always use `[[double brackets]]`. Never use Markdown links (`[text](path.md)`) for internal references.

```
✓ See [[Vault Zones]] for how the zones work.
✗ See [Vault Zones](wiki/concepts/Vault-Zones.md) for how the zones work.
```

## Naming by Type

| Type | Convention | Example |
|------|-----------|---------|
| Concept | Title Case, spaces | `[[Optimistic Locking]]` |
| Entity (person) | Full name | `[[Martin Fowler]]` |
| Entity (org/tool) | Official name | `[[Anthropic]]`, `[[Obsidian]]` |
| Dev file | Full path, no extension | `[[dev/adr/ADR-0001-three-zone-model]]` |

## Missing Pages

When you create a wikilink to a page that doesn't exist yet, **create the page**. An unresolved link shows up as a broken node in the graph view and degrades navigability over time.

Claude will create the stub page automatically when it writes a new link. If you write a wikilink manually and the page doesn't exist, ask Claude to create it.

## Bidirectional Links

When Claude adds a link from page A to page B, it also adds a reference from B back to A. This keeps the graph navigable in both directions and means the "backlinks" pane in Obsidian is always useful.

## Tags vs. Links

- **Tags** (`tags: [kebab-case]` in frontmatter) — for broad categories and filtering
- **Wikilinks** (`[[Page Name]]`) — for specific relationships between pages

Use both. Tags help you find groups; links help you navigate between related ideas.

See also: [[Vault Zones]], [[Getting-Started]]
