---
description: Create a debrief / post-mortem in dev/debriefs/
argument-hint: <what happened — one sentence>
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*)
---

Create a debrief for **$ARGUMENTS**.

Load the `debrief-writing` skill first.

1. **Auto-fill incident date** — use today unless the argument specifies a different date.

2. **Search for related context** — find relevant ADRs, projects, or concepts:
   ```
   grep -r -l --include="*.md" "keyword" dev/ wiki/
   ```

3. **Create `dev/debriefs/YYYY-MM-DD-slug.md`** with all frontmatter pre-filled:
   ```yaml
   ---
   title: <derived from $ARGUMENTS>
   type: debrief
   tags: []
   created: YYYY-MM-DD
   updated: YYYY-MM-DD
   sources: []
   incident-date: YYYY-MM-DD
   severity: medium
   ---
   ```

4. **Pre-fill body sections:**
   - TL;DR, Timeline, Root Cause, Action Items (with `[ ]` checkboxes)
   - Generalizable Learning — intentionally blank for the user to fill
   - References: wikilinks to any related ADRs or projects found

5. **Report** what was created, then prompt: "The Generalizable Learning section is the most valuable part — what pattern does this reveal beyond this specific incident?"
