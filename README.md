# Nexus Vault Template

An Obsidian vault template with deep Claude Code integration. Zero-friction capture, structured knowledge management, and session context that survives interruptions.

## What This Is

A starting point for a personal knowledge vault where Claude Code acts as a co-pilot: ingesting sources, building a cross-linked wiki, tracking decisions and investigations, and resuming exactly where you left off each session.

## Quick Start

1. **Clone this repo** to your local machine
2. **Open the folder as an Obsidian vault** (File → Open Folder as Vault)
3. **Install community plugins** listed in `.obsidian/community-plugins.json` (Obsidian will prompt)
4. **Set the vault path** in your shell profile:
   ```bash
   export NEXUS_VAULT_PATH="/path/to/this/vault"
   ```
5. **Open Claude Code** in the vault directory — it reads `CLAUDE.md` automatically
6. **First session:** Claude will show a blank briefing and wait for your first focus

## Zone Structure

| Zone | Path | Purpose |
|------|------|---------|
| Capture | `inbox/` | Drop anything here — no classification needed |
| Archive | `archive/` | Processed source material, organized by type |
| Knowledge | `wiki/` | Cross-linked knowledge base, Claude-maintained |
| Work | `dev/` | ADRs, investigations, learning tracks, projects |

## Commands

Run any of these in Claude Code:

| Command | Purpose |
|---------|---------|
| `/ingest` | Process everything in inbox/ |
| `/capture <thought>` | Quick capture without interrupting focus |
| `/query <question>` | Ask anything — answer cites vault sources |
| `/resume` | Restore session context |
| `/cheatsheet` | Full command reference |

See `CHEATSHEET.md` for the complete list.

## Plugins

This template includes:
- **obsidian-git** — auto-commits every 10 minutes and on vault close
- **notebook-navigator** — outline navigation
- **obsidian-minimal-settings** — Minimal theme extras
- **obsidian-style-settings** — Theme customization

## Configuration

All behavior is defined in `CLAUDE.md`. Edit it to add new zones, change conventions, or adjust workflows. The template is designed to be forked and customized — see the Extensibility section in `CLAUDE.md`.
