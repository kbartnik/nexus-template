---
name: investigation-tracking
description: Question-driven deep dive tracking for Nexus vault. Consult before creating or updating files in dev/investigations/. Informal, not academic. Lifecycle: open → answered | shelved.
---

# Skill: Investigation Tracking

An investigation is a question you've decided to actually answer — not just wonder about. It's a structured container that accumulates evidence, tracks your current best answer, and records when you've changed your mind.

## What Warrants an Investigation

- "Which X should I use for Y?" (tool/technology decisions)
- "How does X actually work under the hood?"
- "Is X worth learning / doing / trying?"
- "Why does X happen and what should I do about it?"
- Anything you've asked twice and don't have a satisfying answer for

## File Naming

`dev/investigations/YYYY-MM-DD-question-slug.md`

Use the date you opened the investigation. The slug should be the compressed form of the question: `which-db-for-this-project`, `how-does-raft-consensus-work`, `is-rust-worth-learning-for-cli-tools`.

## Frontmatter

```yaml
---
title: <The question, written out in full>
type: investigation
question: <same as title — the exact question being investigated>
status: open | answered | shelved
confidence: low | medium | high
tags: [relevant, tags]
sources: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

**confidence** reflects how sure you are of the current best answer, not the question itself.

**shelved** means: question is still interesting, but you're not actively investigating it. Not abandoned — just paused.

## Section Structure

```markdown
# Investigation: <The question>

## Current Best Answer

*Updated as evidence comes in. Start with "Unknown" and refine over time.*

One paragraph. Plain language. No hedging beyond what the evidence actually warrants.

## Evidence For

- <finding> — source: [[raw/clippings/...]]
- <finding> — source: [[raw/papers/...]]

## Evidence Against / Complicating Factors

- <finding that complicates the answer> — source: [[...]]

## Open Threads

Things that would significantly change the answer if you knew them.

- [ ] Try X and measure Y
- [ ] Read [[raw/papers/...]] for Z perspective
- [ ] Ask /wiki-query about related concept [[...]]

## Conclusion (when status → answered)

What's the answer? One paragraph. What would you tell someone who asked this question?
Link to any ADR or decision that came from this investigation.
```

## Workflow

When a `/wiki-ingest` or `/deep-read` produces evidence relevant to an open investigation, **always** offer to add it to the evidence sections. This is how investigations close — by accumulating enough evidence to tip confidence to `high` and write the conclusion.

When confidence reaches `high` and the Current Best Answer feels stable:
1. Change `status: answered`
2. Write the Conclusion section
3. Offer to update any wiki concept page this conclusion informs
4. If a decision follows from it, offer to create an ADR

## Don't

- Don't force academic rigor — "evidence" can be a benchmark you ran, a Reddit thread that was convincing, a book chapter, or direct experience
- Don't keep investigations open forever — shelve them if they've stalled, answer them if they're done
