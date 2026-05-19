---
title: Vault Zones
type: concept
tags: [vault-structure, knowledge-management]
created: 2026-05-18
updated: 2026-05-18
sources: []
status: active
---

# Vault Zones

The vault is divided into four zones. Each zone has a single owner and a clear rule about what Claude can and cannot do there.

## The Zones

### `inbox/` — Capture only

The zero-friction drop zone. Anything can go here: pasted URLs, quick thoughts, downloaded files, voice memo transcriptions. No classification required at capture time.

**Claude's role:** Reads files here only during `/ingest`, then moves them out. Never creates or edits files here.

**You add things by:** Running `/capture <thought>`, or dropping files directly into the folder.

### `archive/` — Processed source material

Permanent home for everything that has been ingested. Organized into subfolders by type: `clippings/`, `papers/`, `books/`, `daily/`, `ideas/`, `docs/`.

**Claude's role:** Moves files here from `inbox/` during ingestion. Never touches them after.

**You add things by:** Running `/ingest`. The classification and move happen automatically.

### `wiki/` — Knowledge base

The living knowledge graph. Claude owns this zone entirely — creates pages, adds cross-links, keeps the index current.

**Claude's role:** Creates and updates concept pages, entity pages, and syntheses. Maintains `wiki/index.md` and `wiki/log.md`.

**You add things by:** Running `/ingest`, `/read`, `/learn`, or asking Claude to synthesize something.

### `dev/` — Working area

Your workspace: decisions, investigations, learning tracks, project notes. Claude assists but never edits without your approval.

**Claude's role:** Creates new files when asked (via `/adr`, `/debrief`, etc.). Proposes edits. Never modifies existing files silently.

**You add things by:** Running `/adr`, `/debrief`, starting a learning track with `/learn`, or creating files directly.

## Why This Separation Matters

The zones eliminate a common failure mode in personal knowledge systems: the tool becomes the obstacle. By separating capture (no decisions) from archiving (automatic) from synthesis (Claude-owned) from work (you-owned), each action has exactly one right place to land.

See also: [[Wikilink-Conventions]], [[Getting-Started]]
