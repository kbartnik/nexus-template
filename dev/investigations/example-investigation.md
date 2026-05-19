---
title: "What note-taking workflows reduce capture friction?"
type: investigation
tags: [knowledge-management, note-taking, capture]
created: 2026-05-18
updated: 2026-05-18
sources: []
question: What note-taking workflows reduce capture friction?
status: answered
confidence: medium
---

# Investigation: What Note-Taking Workflows Reduce Capture Friction?

## The Question

Capture friction — the resistance between having a thought and recording it — is the primary failure mode of personal knowledge systems. Most systems die not from bad organization but from the cost of the first step. What workflows minimize this cost?

## Evidence

**Inbox-first patterns** (GTD, Zettelkasten fast-lane): Separate capture from classification. Drop anything into a single inbox without deciding where it goes. Process the inbox in dedicated review sessions rather than at capture time.

**Progressive summarization** (Tiago Forte): Capture first, highlight later, summarize last. The first pass is zero-cost; the work happens only when you return to a note because it turned out to be important.

**Plain text + timestamps**: The lower the tool overhead at capture time, the more likely capture happens. A timestamped append-only file (like this vault's `/capture` command) removes all friction except typing.

**Automated classification**: If the tool can make reasonable classification decisions without asking, friction drops further. The `/ingest` command in this vault does this — obvious cases are filed without prompting.

## Answer

The highest-leverage pattern is **separating the moment of capture from the moment of classification**. Any system that requires a decision at capture time will accumulate abandoned items or just not get used. The second-highest leverage is **automation** — if the tool can make reasonable decisions on your behalf, don't make the user do it.

This vault's inbox + `/ingest` workflow applies both patterns.

## Open Questions

- At what inbox size does the backlog become its own friction source?
- Does progressive summarization work better for reference material than for decisions?

## References

- [[Vault Zones]] — the inbox/archive design this investigation informed
- [[Getting Started]] — practical application of these patterns
