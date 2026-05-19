# Live Demo Script

A 5-minute walkthrough of the Nexus vault. Run through this in order.

---

## Before the Audience Arrives

1. Ensure `NEXUS_VAULT_PATH` is set in your shell
2. Run `/demo-reset` — this creates a fresh `demo` branch from the `demo-start` tag (your real vault on `main` is untouched)
3. Open the vault in Obsidian — you're now on the clean demo branch
4. Navigate to `vault-architecture.canvas` for the opening visual
5. Open Claude Code in the vault directory
6. Verify inbox seed is present: `ls inbox/`

---

## The Script

### Opening (~1 min)

Show `vault-architecture.canvas` in Obsidian.

> "This is the zone model. Everything starts in the inbox — no decisions required at capture time. Claude handles classification and wiki updates during ingestion. The dev zone is collaborative — Claude assists but doesn't touch things without asking."

### Step 1: Session start (~30 sec)

Claude auto-runs the session protocol. Show the 3-line briefing.

> "Every session opens with this briefing — last focus, next action, inbox count. No setup, no 'where was I?' — it's just there."

### Step 2: `/inbox` (~30 sec)

```
/inbox
```

> "There's one item waiting. I dropped a note there earlier without stopping to classify it."

### Step 3: `/ingest` (~1.5 min)

```
/ingest
```

Watch Claude:
- Classify the inbox item
- Move it to `archive/clippings/`
- Create a wiki concept page
- Update `wiki/index.md`
- Log the event

> "No confirmation dialog for an obvious case. It just does it. The wiki page is live and cross-linked."

### Step 4: `/query` (~1 min)

```
/query what does this vault know about knowledge management?
```

> "It already found the page we just created. The answer cites sources via wikilinks — you can trace every claim back to where it came from."

### Step 5: `/capture` (~30 sec)

```
/capture follow up on the idea about progressive summarization
```

> "That thought is now in inbox, timestamped. I didn't break flow. It'll get processed next time I run ingest."

---

## After the Demo

```
/demo-cleanup
```

Returns to `main` (your real vault), restores any stashed work, and deletes the `demo` branch. Nothing from the demo is left behind.

For a repeat run: `/demo-reset` creates a fresh `demo` branch again from the same clean tag.

---

## Notes

- The demo works best when Claude Code is already open and warmed up
- If anything goes wrong mid-demo, `/demo-reset` creates a fresh branch and you restart from Step 1
- The canvas is the strongest visual — spend time on it before running commands
- `/demo-reset` and `/demo-cleanup` are safe to run as many times as needed — they never touch `main`
