---
name: debrief-writing
description: Debrief / post-mortem writing for Nexus vault. Consult BEFORE creating any file in dev/debriefs/. Blameless format focused on extracting generalizable learning.
---

# Skill: Debrief Writing

Debriefs document what went wrong (or unexpectedly right) so the learning survives. The goal is never blame — it's extracting the pattern so it doesn't repeat.

## When to Create a Debrief

- Bug that took more than 2 hours to diagnose
- Incident in any environment
- A decision that was made, implemented, and had to be reverted
- A project or sprint that ended — even if it went well

## File Naming

`dev/debriefs/YYYY-MM-DD-short-slug.md`

Use the date the incident occurred (or was resolved), not today's date.

## Frontmatter

```yaml
---
title: <What happened, one sentence>
type: debrief
incident-date: YYYY-MM-DD
severity: low | medium | high | critical
duration-minutes: 0
tags: [relevant, tags]
related-projects: []
related-adrs: []
sources: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

## Section Structure

```markdown
# Debrief: <title>

## TL;DR

3 sentences. What happened. What the impact was. Root cause in plain language.

## Timeline

Chronological list. Use consistent timezone.

- HH:MM — Event description
- HH:MM — Event description

## Root Cause

Honest technical analysis. No softened language. Name the actual cause.

## What Worked

3–5 bullets. What helped during diagnosis or recovery?

## What Didn't Work

3–5 bullets. No people names — describe the system or process that failed.

## Action Items

Numbered checklist. Each item links to the project or ADR where it will be executed.

- [ ] 1. Do specific thing in [[dev/projects/Project-X]]
- [ ] 2. Update [[dev/adr/ADR-NNNN-related]]

## Generalizable Learning

**This is the most important section.** 1–2 paragraphs.

What does this incident reveal that applies beyond this specific case?
Aim for a sentence of the form: "Systems that X must Y, or Z will happen."
This is the insight that belongs in the wiki — offer to create a concept page for it.
```

## After Writing

Check whether the generalizable learning deserves a `[[wiki/concepts/]]` page. If so, offer to create one and link back to this debrief as a source. That's how debriefs compound into durable knowledge.
