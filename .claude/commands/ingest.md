---
description: Ingest all items in inbox/ — classify, archive, and update the wiki
argument-hint: (no arguments needed, or pass a specific file path)
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*), Bash(mv:*), Bash(wc:*), Bash(date:*), WebFetch
---

Resolve the vault root: run `echo $NEXUS_VAULT_PATH` and store the result as `$VAULT_ROOT`. If empty, stop and tell the user to set `NEXUS_VAULT_PATH` in their shell profile.

If **$ARGUMENTS** is provided, ingest only that file. Otherwise, ingest all `.md` files in `$VAULT_ROOT/inbox/` in sequence.

Load the `obsidian-markdown` skill before writing any wiki pages.

For each file, follow this pipeline:

---

### Step 1: Determine type

Classify the file by examining its content and name:

| Type | Move to | Signals |
|------|---------|---------|
| Web clipping / article | `archive/clippings/` | Has `source-url`, scraped prose |
| Academic paper / report | `archive/papers/` | Abstract, citations, formal structure |
| Book notes | `archive/books/` | Chapter structure, author references |
| Daily note / journal | `archive/daily/` | Date-based content, personal reflection |
| Idea / fleeting note | `archive/ideas/` | Short, unstructured, single thought |
| Document / reference | `archive/docs/` | Reference material, how-to, specs |

For obvious types, **skip confirmation and proceed directly**. Only pause if the type is genuinely ambiguous — then show one line: `Ambiguous type for <filename>. Clipping or paper?`

---

### Step 2: Archive the file

Move to the appropriate subfolder with a dated slug:
```
mv "$VAULT_ROOT/inbox/<filename>" "$VAULT_ROOT/archive/<type>/YYYY-MM-DD-slug.md"
```

Add frontmatter if missing:
```yaml
---
title: <derived from content>
type: clipping | paper | book | daily | idea | doc
captured-date: YYYY-MM-DD
source-url: <if present>
---
```

---

### Step 3: Analyze

- Identify 3–7 key concepts
- Identify 1–3 entities (people, orgs, tools)
- Check `wiki/concepts/` and `wiki/entities/` for existing pages to update vs. create

---

### Step 4: Update wiki (no confirmation needed)

Create or update wiki pages. Every new page must have required frontmatter. Add wikilinks bidirectionally.

---

### Step 5: Log and report

Append to `$VAULT_ROOT/wiki/log.md`:
```
## [YYYY-MM-DD] ingest | <source title>
```

Report one line per file processed:
```
✓ <filename> → archive/<type>/YYYY-MM-DD-slug.md | wiki: +N pages, ~M updated
```

Update `inbox-count` in `$VAULT_ROOT/context.md` after all files are processed.
