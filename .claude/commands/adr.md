---
description: Create a new Architecture Decision Record in dev/adr/
argument-hint: <decision title>
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*)
---

Create a new ADR for **$ARGUMENTS**.

Load the `adr-writing` skill first.

1. **Auto-number:** find the highest existing ADR number in `dev/adr/` and increment by 1. If none exist, start at 0001.

2. **Check for conflicts** — search the vault for related concepts, existing ADRs, or investigations:
   ```
   grep -r -l --include="*.md" "keyword" dev/ wiki/
   ```

3. **Create `dev/adr/ADR-NNNN-slug.md`** with all frontmatter pre-filled:
   ```yaml
   ---
   title: <derived from $ARGUMENTS>
   type: adr
   tags: []
   created: YYYY-MM-DD
   updated: YYYY-MM-DD
   sources: []
   status: proposed
   decision-date: ""
   supersedes: []
   superseded-by: []
   ---
   ```

4. **Pre-fill body sections** with what the vault already knows:
   - Context: vault research on the decision area
   - Decision: `[To be filled after evaluation]`
   - Alternatives: any alternatives visible from vault research
   - References: links to related wiki concepts and ADRs

5. **Report** what was created and ask: "Want to add more context, or start evaluating alternatives?"
