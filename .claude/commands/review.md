---
description: Synthesize what you know about a topic from all learning notes
argument-hint: <topic slug>
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*)
---

Synthesize everything in the vault about **$ARGUMENTS**.

Load the `learning-notes` skill for the review mode section.

1. **Locate the learning track:** `dev/learning/$ARGUMENTS/`
   - If not found, search by keyword: `grep -r -l --include="*.md" "$ARGUMENTS" dev/learning/`

2. **Read all files** in the track directory (index.md + all session notes)

3. **Also search the wiki** for related concepts:
   ```
   grep -r -l --include="*.md" "$ARGUMENTS" wiki/concepts/ wiki/syntheses/
   ```

4. **Synthesize:**

   ```
   TOPIC REVIEW: <Topic Name>

   What I now understand:
   <First-person synthesis. What would I tell someone who asked me about this?>

   Key concepts and how they relate:
   - [[Concept A]] — <my current model of it>
   - [[Concept B]] — <how it connects to A>

   What's still unclear:
   - <genuine gap in understanding>

   What I'd investigate next:
   - <specific question worth opening as an investigation>
   ```

5. **Offer to save** as `wiki/syntheses/YYYY-MM-DD-<topic>-synthesis.md`.

6. **Log:**
   ```
   ## [YYYY-MM-DD] query | topic-review: <topic>
   ```
