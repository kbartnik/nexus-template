---
name: session-context
description: Session protocols for Nexus vault. Defines session start/end procedures, context.md format, and muscle-memory nudge rotation. Consult at the start and end of every session.
---

# Skill: Session Context

This skill governs how every session opens and closes. Its job is to eliminate the "where was I?" problem and reduce session startup cost to near zero.

## Step 0: Resolve Vault Root

Before doing anything else, run:

```bash
echo $NEXUS_VAULT_PATH
```

Store the output as `$VAULT_ROOT` for all subsequent file references in this skill.

If the output is empty, stop and report:

> **NEXUS_VAULT_PATH is not set.** Add `export NEXUS_VAULT_PATH="/path/to/your/vault"` to your shell profile (`.zshrc`, `.bashrc`), then restart Claude Code.

Do not proceed with session start or end protocols until the variable resolves.

---

## Session Start Protocol

Execute this BEFORE responding to the user's first message:

1. **Read `$VAULT_ROOT/context.md`** — extract `last-session`, `current-focus`, `next-action`, `inbox-count`, `session-count`, `last-nudged-command`

2. **Present the briefing** (3 lines, no preamble, no follow-up question — stop and wait):
   ```
   Last focus: <current-focus or "nothing recorded">
   Next action: <next-action or "none set">
   Inbox: <inbox-count> items awaiting processing
   ```

3. **Increment `session-count`** in `$VAULT_ROOT/context.md` (write the file now)

4. **Muscle-memory nudge** — if the new `session-count` is divisible by 3:
   - Find the command that comes AFTER `last-nudged-command` in the cheatsheet rotation order (see rotation list below)
   - Append to the briefing: `Tip: /command-name — <one-sentence description>`
   - Update `last-nudged-command` to the command you just surfaced

### Nudge Rotation Order

Rotate through these commands in order, wrapping around:
`/ingest` → `/query` → `/lint` → `/capture` → `/park` → `/next` → `/focus` → `/read` → `/learn` → `/review` → `/adr` → `/debrief` → `/cheatsheet` → (back to `/ingest`)

If `last-nudged-command` is empty, start with `/ingest`.

---

## Session End Protocol

When the user signals they're done, or when you reach a natural stopping point:

1. **Update `$VAULT_ROOT/context.md`** — write ALL fields:
   - `last-session`: today's date (YYYY-MM-DD)
   - `current-focus`: what was actually worked on this session (1–5 words)
   - `next-action`: the single most concrete next step — action verb, specific target, no ambiguity
   - `parked-ideas`: append any new ideas parked this session (do not remove old ones)
   - `inbox-count`: count `.md` files in `$VAULT_ROOT/inbox/` right now and update
   - `session-count`: already incremented at start, leave as-is
   - `last-nudged-command`: already updated if nudge ran, leave as-is

2. **Append to `$VAULT_ROOT/wiki/log.md`**:
   ```
   ## [YYYY-MM-DD] session-end | <2-word summary of what was done>
   ```

3. **Report 3-line session summary**:
   ```
   Done: <what was accomplished>
   Next: <next-action value>
   Parked: <any new parked ideas, or "nothing">
   ```

---

## context.md Format

```yaml
---
last-session: ""             # YYYY-MM-DD of last session
current-focus: ""            # 1-5 word description of active focus
active-projects: []          # list of project names being actively worked
next-action: ""              # single concrete next step, action verb first
parked-ideas: []             # ideas shelved to prevent focus drift
inbox-count: 0               # number of files in inbox/
session-count: 0             # total sessions, drives nudge rotation
last-nudged-command: ""      # last command surfaced in muscle-memory nudge
---
```

---

## When to Update context.md Mid-Session

Update `next-action` and `parked-ideas` mid-session whenever:
- The user parks an idea via `/park`
- The user explicitly says what they're focusing on
- A `/next` command runs and produces a new first step

Do not wait until session end for these — they matter for context recovery.
