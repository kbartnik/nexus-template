# CLAUDE.md — Nexus Vault

You are operating inside an Obsidian vault powered by Claude Code. This file is read every session and defines how you behave. It is the single source of truth for zone rules, conventions, and workflows.

---

## Session Start Protocol

**Every session, before responding to anything else:**

1. Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, `NEXUS_VAULT_PATH` must be set explicitly.
2. Load the `session-context` skill
3. Read `$VAULT_ROOT/context.md`
4. Present a 3-line briefing — no preamble, no follow-up question, just stop and wait:
   - **Last focus:** `current-focus` value (or "nothing recorded")
   - **Next action:** `next-action` value (or "none set")
   - **Inbox:** `inbox-count` items in `inbox/` awaiting processing
5. Increment `session-count` in `context.md`
6. If `session-count` is divisible by 3: append one muscle-memory nudge (see `session-context` skill for rotation order)

Do not skip this protocol even if the user's first message looks urgent.

---

## Zone Structure

The vault has four zones with strictly different rules. Never cross them.

### Zone 1a — `inbox/` (CAPTURE ONLY)

Zero-friction drop zone. Everything lands here first.

- **Claude reads files here only to move them OUT during ingestion**
- Never edit content in `inbox/`
- Claude never creates files here — `/capture` does that, and the user can drop files directly

### Zone 1b — `archive/` (SOURCE MATERIAL)

Permanent home for processed source material. Organized by type after ingestion.

- Subfolders: `clippings/`, `papers/`, `books/`, `daily/`, `ideas/`, `docs/`
- Claude moves files here from `inbox/` during ingestion — never edits them afterward
- Named `YYYY-MM-DD-slug.md`

### Zone 2 — `wiki/` (LLM-MAINTAINED)

You own this zone entirely. Create, update, and cross-link freely.

- Every page **must** have frontmatter (see Frontmatter Conventions)
- Every page **must** have at least one `[[wikilink]]` to another wiki page
- Never delete a wiki page — mark stale pages with `status: archived`
- Subfolders:
  - `wiki/concepts/` — concept pages, Title Case filenames (`Optimistic-Locking.md`)
  - `wiki/entities/` — people, orgs, tools (`Martin-Fowler.md`, `Anthropic.md`)
  - `wiki/syntheses/` — cross-document analyses, comparisons, long-form explorations
  - `wiki/index.md` — master catalog, updated on every ingest
  - `wiki/log.md` — append-only event log, never modify old entries

### Zone 3 — `dev/` (COLLABORATIVE)

User drives, you co-pilot. Never edit existing files without explicit approval.

- **NEVER edit an existing file in `dev/` without asking first**
- You may suggest rephrasings, propose wikilinks, flag gaps
- Subfolders:
  - `dev/adr/` — Architecture Decision Records (see `adr-writing` skill)
  - `dev/debriefs/` — incident and debugging post-mortems (see `debrief-writing` skill)
  - `dev/snippets/` — reusable code patterns
  - `dev/projects/` — project documentation
  - `dev/investigations/` — question-driven deep dives (see `investigation-tracking` skill)
  - `dev/learning/` — self-directed topic tracks (see `learning-notes` skill)

---

## Ingestion Workflow

When the user runs `/ingest`:

1. **Find all `.md` files in `inbox/`** — process each in sequence
2. **Classify by type** — clipping, paper, book, daily, idea, or doc
   - For obvious types: proceed without asking
   - For ambiguous: one-line prompt, e.g. `Clipping or paper?`
3. **Move to archive** — `mv inbox/<file> archive/<type>/YYYY-MM-DD-slug.md`
4. **Add frontmatter** if missing (`title`, `type`, `captured-date`, `source-url`)
5. **Analyze** — identify 3–7 key concepts, 1–3 entities
6. **Update wiki** — create or update pages, add wikilinks bidirectionally
7. **Log** — append to `wiki/log.md`: `## [YYYY-MM-DD] ingest | <source title>`
8. **Update `inbox-count`** in `context.md`

---

## Wikilink Conventions

- **Always use `[[wikilinks]]`** for internal links. Never `[text](file.md)`.
- Concepts: Title Case — `[[Optimistic Locking]]`, `[[Event Sourcing]]`
- Entities: Full name — `[[Martin Fowler]]`, `[[Anthropic]]`
- Dev files: Use the full path — `[[dev/adr/ADR-0001-three-zone-model]]`
- Tags in frontmatter: kebab-case, comma-separated — `tags: [knowledge-management, note-taking]`

When creating a wikilink to a page that doesn't exist yet, create the page. Orphan links degrade the graph.

---

## Frontmatter Conventions

Every page you create must have frontmatter. Minimum required fields:

```yaml
---
title: <title>
type: concept | entity | synthesis | adr | debrief | snippet | investigation | learning | index
tags: [tag1, tag2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: []
---
```

Additional fields by type:

**concept / entity / synthesis:**
- `status: active | archived`

**adr:**
- `status: proposed | accepted | superseded`
- `decision-date: YYYY-MM-DD`
- `supersedes: []`
- `superseded-by: []`

**debrief:**
- `incident-date: YYYY-MM-DD`
- `severity: low | medium | high | critical`

**investigation:**
- `question: <the core question being investigated>`
- `status: open | answered | shelved`
- `confidence: low | medium | high`

**learning:**
- `topic: <topic slug>`
- `source: <archive/ path or URL>`

**snippet:**
- `language: <programming language>`
- `tested-with: <version or environment>`

---

## Strict Limits

- **NEVER delete a file** without explicit confirmation ("delete X")
- **NEVER run git push** — the user does that manually
- **NEVER edit `CLAUDE.md`** — ask the user to make changes
- **If an operation affects more than 5 files**, show the plan first and wait for approval
- **If unsure which zone a file belongs to**, ask before creating
- **If you find a contradiction** between two wiki pages or ADRs, flag it — do not silently resolve it

---

## Session End Protocol

When the user says they're done:

1. Update `context.md`:
   - `last-session`: today's date
   - `current-focus`: what was worked on
   - `next-action`: the single most concrete next step (action verb, specific)
   - `parked-ideas`: append any new parked ideas
   - `inbox-count`: count all files in `inbox/` and update
2. Append a `session-end` entry to `wiki/log.md`
3. Report a 3-line session summary: done / next / parked

---

## Available Skills

| Skill | When to use |
|-------|-------------|
| `session-context` | Session start/end protocols, context restoration |
| `adr-writing` | Before creating or editing any file in `dev/adr/` |
| `debrief-writing` | Before creating any file in `dev/debriefs/` |
| `source-annotation` | Before running `/read` on any source |
| `investigation-tracking` | Before creating or updating files in `dev/investigations/` |
| `learning-notes` | Before creating or updating files in `dev/learning/` |
| `obsidian-markdown` | Whenever writing Obsidian-specific syntax |
| `defuddle` | Before fetching any URL for ingestion |
| `obsidian-bases` | Before creating `.base` files |
| `json-canvas` | Before creating `.canvas` files |

---

## Available Commands

| Command | Purpose |
|---------|---------|
| `/ingest` | Process all inbox/ items — classify, archive, update wiki |
| `/query` | Synthesize an answer from vault contents |
| `/lint` | Health-check the vault |
| `/read` | Process a source deeply |
| `/learn` | File self-directed learning notes |
| `/review` | Synthesize what you know about a topic |
| `/capture` | Zero-friction inbox dump |
| `/resume` | Restore session context |
| `/park` | Park a derailing idea cleanly |
| `/focus` | Check current focus vs. planned focus |
| `/next` | Break a topic into 3 concrete first steps |
| `/inbox` | Quick list of inbox/ contents |
| `/adr` | Create a pre-filled Architecture Decision Record |
| `/debrief` | Create a pre-filled debrief / post-mortem |
| `/cheatsheet` | Surface all commands |
| `/wrap` | End the session — update context, log, report summary |
| `/nexus-init` | Detect platform, validate scripts, store shell config — run once after cloning |
| `/nexus-purge` | Remove all default template content, reset to pristine vault |
| `/nexus-demo-reset` | Create a clean demo branch from demo-start tag |
| `/nexus-demo-cleanup` | Return to main, delete demo branch |

---

## Setup

**macOS / Linux / WSL / Git Bash:**

`NEXUS_VAULT_PATH` is optional — if Claude Code is opened in the vault folder, it falls back to the current working directory automatically. To set it explicitly:

```bash
export NEXUS_VAULT_PATH="/path/to/this/vault"
```

Add to `~/.zshrc` or `~/.bashrc` and restart Claude Code.

**Windows (MINGW / Git for Windows):**

All scripts use bash. Install [Git for Windows](https://git-scm.com/download/win) — it includes MINGW64 and Git Bash, which provides a full bash environment.

Set the env var in `~/.bashrc`:
```bash
export NEXUS_VAULT_PATH="/c/Users/you/path/to/vault"
```

---

## Scripts and Hooks

Mechanical operations that don't require LLM reasoning are implemented as bash scripts stored alongside their relevant commands (`.claude/commands/*.sh`) and skills (`.claude/skills/session-context/*.sh`).

| Script | Purpose | Called by |
|--------|---------|-----------|
| `capture` | Append thought to inbox, update count | `/capture` command |
| `inbox-list` | List all inbox files | `/inbox` command |
| `update-inbox-count` | Recount inbox, update context.md | PostToolUse hook |
| `session-start` | Read context.md, emit briefing as additionalContext | SessionStart hook |
| `session-end` | Update last-session date and inbox-count | Stop hook + `/wrap` |
| `demo-reset` | Create demo branch from demo-start tag | `/demo-reset` command |
| `demo-cleanup` | Return to main, delete demo branch | `/demo-cleanup` command |

**Lifecycle hooks** (configured in `.claude/settings.json`):

| Hook | Event | Effect |
|------|-------|--------|
| PostToolUse (Write\|Bash) | After any write or bash | inbox-count stays current automatically |
| SessionStart | Session open | Briefing injected into model context before first response |
| Stop | Session close | last-session date and inbox-count updated automatically |

Each hook has both a bash and PowerShell variant. The wrong-platform one fails silently.

---

## Extensibility

To add a new area:
1. Add a subfolder under `dev/` (e.g., `dev/finance/`)
2. Add one paragraph here under Zone 3 describing conventions
3. Optionally add a skill: `.claude/skills/<area>/SKILL.md`
4. Optionally add a command: `.claude/commands/<action>.md`
5. Update `CHEATSHEET.md`

To retire a workflow: delete the skill/command file, remove its entry from this file and `CHEATSHEET.md`.
