---
description: File self-directed learning notes for a topic
argument-hint: <topic> [optional: source URL or file]
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*), WebFetch
---

File learning notes for **$ARGUMENTS**.

Load the `learning-notes` skill first.

Parse the argument: the first word/phrase is the topic slug; anything after it is the source.

1. **Check for existing track** — look for `dev/learning/<topic-slug>/index.md`
   - If it exists: this is an update to an ongoing track
   - If not: create a new track (index.md + first session note)

2. **Create session note** at `dev/learning/<topic-slug>/YYYY-MM-DD.md` with:
   - Source field populated
   - Key Insight, What Surprised Me, Connections, Open Questions sections

3. **Update track index** (`dev/learning/<topic-slug>/index.md`):
   - Add source to "Sources Consumed"
   - Update "What I Now Understand" if understanding shifted
   - Add new open questions

4. **Check for concept page opportunities:**
   - Any key concept without a `wiki/concepts/` page? Offer to create one.
   - Any open question that warrants an investigation? Offer to open one.

5. **Report:** what was filed, what was updated, any suggestions for follow-up.
