---
title: "ADR-0001: Three-Zone Vault Model"
type: adr
tags: [vault-structure, architecture]
created: 2026-05-18
updated: 2026-05-18
sources: []
status: accepted
decision-date: 2026-05-18
supersedes: []
superseded-by: []
---

# ADR-0001: Three-Zone Vault Model

## Status

Accepted

## Context

A personal knowledge vault accumulates several distinct types of content: raw source material (articles, papers, notes), synthesized knowledge (concept pages, entities, cross-linked ideas), and active work (decisions, investigations, learning tracks, projects). Without clear separation, these types blur together. Claude edits things it shouldn't. The user can't tell what's safe to delete. The knowledge graph fills with noise.

The core tension is between capture friction (you want to drop things in quickly) and knowledge quality (you want structured, cross-linked, reliable pages). A single zone forces a choice between the two. Multiple zones let each area have the right rules.

## Decision

Separate the vault into three logical zones with distinct ownership and editing rules:

- **Zone 1 (inbox + archive):** Source material. Claude moves files from inbox to archive during ingestion; never edits content. The inbox is zero-friction — no classification at capture time.
- **Zone 2 (wiki):** Synthesized knowledge. Claude owns this zone entirely — creates, updates, and cross-links freely.
- **Zone 3 (dev):** Active work. User drives; Claude co-pilots. No edits without approval.

## Alternatives Considered

**Single flat structure** — simpler to explain, but Claude has no clear boundary for what it can modify. Breaks down as the vault grows.

**Two zones (source / knowledge)** — eliminates the dev zone ambiguity, but mixes architectural decisions with fleeting investigations, which have very different lifecycles.

**Fully manual organization** — no Claude-owned zone. Puts all classification burden on the user. Defeats the purpose of the integration.

## Consequences

- **Positive:** Claude never silently modifies source material. Zone boundaries are checkable rules, not guidelines.
- **Positive:** Capture is zero-friction — inbox/ accepts anything without classification.
- **Positive:** The wiki can be trusted as Claude-maintained and internally consistent.
- **Negative:** Users must learn three zones rather than one. Mitigated by the session start briefing and this ADR.
- **Negative:** Ingestion (inbox → archive) is a required step; skipping it leaves items stranded in inbox/.

## References

- [[Vault Zones]] — concept page explaining the zones to end users
- [[Getting Started]] — day-one guide referencing this model
