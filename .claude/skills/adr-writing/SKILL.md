---
name: adr-writing
description: Architecture Decision Records for Nexus vault. Consult BEFORE creating or editing any file in dev/adr/. Defines numbering, frontmatter, section structure, and status transitions.
---

# Skill: ADR Writing

ADRs record technical decisions so future-you understands not just what was decided, but why. Concise, honest, and permanent.

## Numbering

Files: `dev/adr/ADR-NNNN-short-slug.md`. NNNN is zero-padded (0001, 0002, ...).

**Before creating a new ADR:**
1. Read all files in `dev/adr/` to find the next number
2. Check whether an ADR on this topic already exists — if so, update it (if proposed) or supersede it (if accepted)

## Frontmatter

```yaml
---
title: <Imperative title — "Use X for Y", not "X vs Y">
type: adr
status: proposed | accepted | superseded
decision-date: YYYY-MM-DD
tags: [relevant, tags]
supersedes: []
superseded-by: []
sources: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

## Section Structure

```markdown
# ADR-NNNN: <Short imperative title>

## Context

2–4 paragraphs. What problem prompted this? What constraints exist?
Include [[wikilinks]] to related projects or concepts.

## Decision

One direct paragraph. "We will use X." No adjectives. No "after careful analysis."

## Consequences

### Positive
- Short bullet

### Negative / trade-offs
- Short bullet

### Neutral
- Short bullet

## Alternatives Considered

For each alternative: name it, then one sentence on why rejected.

## References

- [[dev/adr/ADR-NNNN-related]]
- [[wiki/concepts/Relevant-Concept]]
- External URLs when relevant
```

## Status Rules

- **proposed**: draft, still being evaluated. Can be freely edited.
- **accepted**: decision made. **IMMUTABLE** except for status change.
- **superseded**: replaced by a newer ADR. Update `superseded-by` field. Never delete.

If the user asks to change an accepted ADR's content (not status), ask whether they want to supersede it with a new ADR instead.

## Zone 3 Rule

Never edit an existing ADR without explicit permission. "Can I update ADR-0003?" — always ask. This is a hard rule from `CLAUDE.md`.
