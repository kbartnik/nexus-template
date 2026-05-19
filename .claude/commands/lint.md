---
description: Health-check the vault — find orphans, contradictions, stale pages, and gaps
argument-hint: (no arguments needed)
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*), Bash(wc:*)
---

Resolve the vault root: run `echo $NEXUS_VAULT_PATH` and store the result as `$VAULT_ROOT`. If empty, stop and tell the user to set `NEXUS_VAULT_PATH` in their shell profile.

Health-check the vault. Do not make changes — report findings and ask which to address.

Run all checks, then present a prioritized list of issues.

**Check 1: Orphan pages**
Find wiki pages with no inbound wikilinks from other pages.
Report: pages in `wiki/concepts/` and `wiki/entities/` that no other file links to.

**Check 2: Missing concept pages**
Find `[[wikilinks]]` in wiki pages that point to files that don't exist.
Report: links that resolve to nothing — these are stubs waiting to be created.

**Check 3: Inbox backlog**
Count `.md` files in `$VAULT_ROOT/inbox/`. If more than 5, flag as needing processing.

**Check 4: Stale investigations**
Find `dev/investigations/` files with `status: open` older than 30 days (check `created` frontmatter). These may need to be shelved.

**Check 5: Answered investigations without wiki pages**
Find `dev/investigations/` files with `status: answered`. Check if their conclusion has been reflected in `wiki/concepts/` or `wiki/syntheses/`. If not, flag for synthesis.

**Check 6: ADR consistency**
Check `dev/adr/` for:
- ADRs in `proposed` status older than 14 days (might need a decision)
- `superseded` ADRs that are missing `superseded-by` links

**Check 7: Index completeness**
Find wiki pages not listed in `wiki/index.md`.

**Check 8: Frontmatter completeness**
Sample-check 5 random wiki pages for required frontmatter fields (title, type, tags, created, updated, sources).

---

After all checks, report:

```
LINT REPORT — [YYYY-MM-DD]

Critical (broken links, missing pages):
- ...

Needs attention (stale investigations, inbox backlog):
- ...

Low priority (orphan pages, index gaps):
- ...

Suggested next: <most impactful single thing to fix>
```

Log: append to `$VAULT_ROOT/wiki/log.md`:
```
## [YYYY-MM-DD] lint | <N issues found>
```
