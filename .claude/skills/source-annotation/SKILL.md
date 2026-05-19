---
name: source-annotation
description: Deep-reading any source (article, book chapter, video transcript, paper) for Nexus vault. Consult before running /deep-read. Extracts key insight, surprises, open questions, and wikilink candidates. No academic framing.
---

# Skill: Source Annotation

Source annotation is what happens when you've already ingested something (`/wiki-ingest`) but want to go *deeper* — extracting real understanding rather than just filing it. Use when a source deserves more than a summary.

## When to Use This

- A source you want to genuinely understand, not just reference
- A video, talk, or long-form article where you're watching/reading actively
- A book chapter you just read with highlights
- A source that feels important but you haven't processed what it means yet

## What to Extract

For any source, extract:

**Key insight** (1–3 sentences)
What is the single most important thing this source says? If you had to explain it to someone in a coffee shop, what would you say?

**What surprised me**
What contradicted something I believed? What did I not expect? Surprises are where real learning happens.

**Open questions**
What does this source raise that it doesn't answer? What do I now want to investigate?

**Wikilink candidates**
What concepts, entities, or existing wiki pages does this connect to? List them — even if the pages don't exist yet.

**Connections**
Does this connect to anything already in the vault? Check `wiki/concepts/` and `dev/investigations/` for existing pages this might inform or contradict.

## Output Format

Create a reading note at `raw/clippings/YYYY-MM-DD-slug.md` (if not already there), then add a `## Deep Read` section:

```markdown
## Deep Read

**Key insight:** <1-3 sentences>

**What surprised me:** <1-2 sentences>

**Open questions:**
- <question>
- <question>

**Connects to:** [[Concept A]], [[Concept B]], [[dev/investigations/YYYY-MM-DD-question]]
```

Then offer to:
- Update relevant wiki concept pages with the new nuance
- Add evidence to any open investigation this informs
- Create a new concept page if a significant idea lacks one

## What NOT to Do

- Don't extract academic metadata (authors, citations, methodology sections) unless directly relevant
- Don't summarize the source's structure — extract understanding, not outline
- Don't create a new page if the insight fits naturally into an existing one
