---
description: Process a source deeply — extract real understanding, not just a summary
argument-hint: <URL | file path>
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*), WebFetch
---

Do a deep read of **$ARGUMENTS**.

Load the `source-annotation` skill first. Load the `defuddle` skill if this is a URL.

This is different from `/ingest` — the goal is understanding, not filing.

1. **Fetch / read the source**
   - URL: use `defuddle` for clean extraction
   - File: read directly

2. **Save to archive** (if not already there):
   - `archive/clippings/YYYY-MM-DD-slug.md` with frontmatter

3. **Extract understanding** (per `source-annotation` skill):
   - Key insight (1–3 sentences)
   - What surprised me
   - Open questions
   - Wikilink candidates

4. **Check for open investigations** this might inform:
   ```
   grep -r -l "status: open" dev/investigations/
   ```
   If relevant, offer to add evidence.

5. **Present findings** in the source-annotation format

6. **Offer next steps** (pick the most relevant 1–2):
   - "Update [[wiki/concepts/X]] with new nuance"
   - "Add evidence to [[dev/investigations/Y]]"
   - "Open new investigation: this raises the question of Z"
   - "Create concept page for [[New Concept]]"

7. **Log:**
   ```
   ## [YYYY-MM-DD] ingest | deep-read: <source title>
   ```
