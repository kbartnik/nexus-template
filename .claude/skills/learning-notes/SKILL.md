---
name: learning-notes
description: Self-directed learning track management for Nexus vault. Consult before creating or updating files in dev/learning/. Curiosity-led, no deadlines or course structure. Focus on what surprised you and what you now understand.
---

# Skill: Learning Notes

A learning track is how you follow a sustained curiosity over time — whether it's a programming language, a domain, a craft, a tool, or an idea you keep coming back to. It's not a course. There's no syllabus, no deadline, no grade. Just structured accumulation of what you're learning.

## When to Create a Track

- You've read 2+ things on the same topic and want them to compound
- You're actively working through a resource (book, video series, tutorial)
- You find yourself returning to the same topic across sessions
- An investigation answered and left you wanting to go deeper

## Directory Structure

```
dev/learning/<topic-slug>/
├── index.md         ← track overview, updated as the topic grows
└── YYYY-MM-DD.md   ← individual session notes (one or more per topic)
```

Topic slug: kebab-case, descriptive — `rust-async`, `distributed-systems`, `coffee-brewing`, `type-theory`.

## Track Index (index.md)

```yaml
---
title: Learning: <Topic Name>
type: learning
topic: <topic-slug>
status: active | paused | complete
tags: [tag1, tag2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

```markdown
# Learning: <Topic Name>

## What I Want to Understand

2–3 sentences. What is the question or goal that drew me to this topic?

## Sources Consumed

- [[raw/clippings/YYYY-MM-DD-slug]] — <one-line takeaway>
- [[raw/books/book-title]] — <chapters / status>

## Key Concepts (so far)

- [[wiki/concepts/Concept-A]] — my current understanding in one sentence
- [[wiki/concepts/Concept-B]]

## What I Now Understand

*Updated as the track grows.* Honest summary of current comprehension. Not what the sources said — what I actually understand now.

## Open Questions

- <what I still don't understand>
- <what I want to explore next>

## What to Explore Next

- [ ] Resource or question
- [ ] Resource or question
```

## Session Note (YYYY-MM-DD.md)

```yaml
---
title: <Topic>: <what this session covered>
type: learning
topic: <topic-slug>
source: <raw/ path or URL>
created: YYYY-MM-DD
---
```

```markdown
# <Topic>: <what this session covered>

**Source:** [[raw/...]] or <URL>
**Time spent:** ~X minutes

## Key Insight

<1–3 sentences. The most important thing I learned today.>

## What Surprised Me

<What contradicted my prior understanding or was unexpected.>

## Connections

<How this connects to things I already know.>
[[wiki/concepts/Related-Concept]]
[[dev/investigations/related-question]]

## Open Questions from This Session

- <question>
- <question>
```

## After Creating a Session Note

1. Update the track's `index.md`: add source to "Sources Consumed", update "What I Now Understand" if it changed, add new open questions
2. Check if any key concepts should become or update `[[wiki/concepts/]]` pages — offer to create them
3. Check if any open questions warrant opening an investigation in `dev/investigations/`

## Review Mode (`/topic-review`)

When the user wants a synthesis of a track, read all files in `dev/learning/<topic>/` and produce:

1. "What I now know about X" — honest, first-person synthesis of current understanding
2. Key concepts and how they relate
3. What's still unclear or worth investigating
4. Offer to save this as a `wiki/syntheses/` page
