---
description: Search the vault and synthesize an answer from accumulated knowledge
argument-hint: <question in natural language>
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*)
---

Answer **$ARGUMENTS** by consulting what's in the vault.

Strategy:

1. **Candidate search** (grep, no full reads yet):
   - Search `wiki/` first (most synthesized)
   - Expand to `dev/` if needed
   - Last resort: `archive/` (raw source material)
   - Use: `grep -r -l --include="*.md" "term" wiki/`

2. **Read `wiki/index.md`** first — it's the catalog. Identify relevant sections, then read those pages specifically.

3. **Focused reading:**
   - Read up to 10 candidate files, prioritizing `wiki/` pages
   - If more than 10 are relevant, mention it and read the most relevant

4. **Synthesize an answer:**
   - Answer in direct prose (not bullets unless the question asks for a list)
   - Cite every source via `[[wikilinks]]`: "Per [[wiki/concepts/X]], ..."
   - If inferring beyond what's literally written, signal it: "Inferring from [[X]] and [[Y]]: ..."
   - If the vault genuinely doesn't have enough: say so. Don't hallucinate.

5. **Suggest next steps** when relevant:
   - "There's no page on X yet. Want me to `/ingest` something on it?"
   - "This connects to an open investigation: [[dev/investigations/...]]"

6. **Offer to file** — if this answer is valuable and non-obvious, offer to save it as `wiki/syntheses/YYYY-MM-DD-slug.md`.

Log: append to `wiki/log.md`:
```
## [YYYY-MM-DD] query | <compressed question>
```
