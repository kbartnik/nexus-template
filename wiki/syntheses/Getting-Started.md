---
title: Getting Started
type: synthesis
tags: [vault-structure, onboarding, knowledge-management]
created: 2026-05-18
updated: 2026-05-18
sources: []
status: active
---

# Getting Started

A practical orientation for your first few sessions with this vault.

## Day One

**Set your vault path first.** Claude can't find your files without it:

```bash
export NEXUS_VAULT_PATH="/path/to/this/vault"
```

Add this to `~/.zshrc` or `~/.bashrc` and restart Claude Code.

**Open Claude Code in the vault directory.** It reads `CLAUDE.md` automatically and runs the session start protocol — you'll see a 3-line briefing. On day one it'll be empty. That's expected.

## The Core Loop

The daily workflow has three moments:

1. **Capture** — drop things in `inbox/` without thinking about where they go
2. **Ingest** — run `/ingest` to classify, archive, and update the wiki
3. **Query** — ask `/query` anything; it searches the wiki and cites sources

Everything else — ADRs, investigations, learning tracks — is built on top of this loop.

## Common Command Sequences

**Starting a session:**
```
/resume
```
Shows last focus, next action, and inbox count. No setup needed.

**Quick capture mid-work:**
```
/capture look into progressive summarization for note-taking
```
Drops the thought in inbox and returns you to what you were doing.

**Processing the inbox:**
```
/inbox         ← see what's waiting
/ingest        ← process everything, no decisions required
```

**Exploring what you know:**
```
/query what do I know about event-driven architecture?
```

**Starting an investigation:**
```
/adr should we use SQLite or PostgreSQL for local storage?
```

## Session Protocol

At the start of every session, Claude presents a 3-line briefing — last focus, next action, inbox count — and waits. You don't need to do anything special; just respond with what you want to work on.

At the end of a session, tell Claude you're done. It updates `context.md` with a concrete next action and appends a log entry.

## The Graph View

Open Obsidian's graph view (Ctrl/Cmd+G) after a few ingestions. You'll see the wiki pages Claude created and how they link to each other. New concepts appear as nodes; each ingestion pulls them tighter into the network.

## What Claude Won't Do

- Edit your source files in `archive/` after ingesting them
- Touch any file in `dev/` without asking you first
- Push to git — you manage that manually (or obsidian-git handles auto-commits)
- Edit `CLAUDE.md` — all convention changes go through you

See also: [[Vault Zones]], [[Wikilink-Conventions]]
