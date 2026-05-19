---
description: Ingest all items in inbox/ — classify, archive, and update the wiki
argument-hint: (no arguments needed, or pass a specific file path)
allowed-tools: Bash(grep:*), Bash(find:*), Bash(cat:*), Bash(ls:*), Bash(mv:*), Bash(wc:*), Bash(date:*), WebFetch
---

Resolve the vault root: `VAULT_ROOT="${NEXUS_VAULT_PATH:-$(pwd)}"` — uses the env var if set, otherwise the current working directory. On Windows without Git Bash/WSL, set `NEXUS_VAULT_PATH` explicitly.

If **$ARGUMENTS** is provided, ingest only that file. Otherwise, ingest all files in `$VAULT_ROOT/inbox/` in sequence (all types — `.md`, `.pdf`, `.txt`, `.html`, etc.).

Load the `obsidian-markdown` skill before writing any wiki pages.

For each file, follow this pipeline:

---

### Step 1: Determine type

Classify the file by examining its content, name, and extension:

| Type | Move to | Signals |
|------|---------|---------|
| Web clipping / article | `archive/clippings/` | Has `source-url`, scraped prose, `.html` |
| Academic paper / report | `archive/papers/` | Abstract, citations, formal structure, `.pdf` with academic content |
| Book notes | `archive/books/` | Chapter structure, author references |
| Daily note / journal | `archive/daily/` | Date-based content, personal reflection |
| Idea / fleeting note | `archive/ideas/` | Short, unstructured, single thought |
| Document / reference | `archive/docs/` | Reference material, how-to, specs, unclassified `.pdf` |

For obvious types, **skip confirmation and proceed directly**. Only pause if the type is genuinely ambiguous — then show one line: `Ambiguous type for <filename>. Clipping or paper?`

**Non-markdown files:** Read/extract content as best possible. PDFs and text files are read directly. For binary files where content extraction fails, classify as `archive/docs/` and note the limitation.

---

### Step 2: Archive the file

**Derive the slug:**
1. If the filename is already a readable kebab-case slug, use it (minus extension)
2. Otherwise derive from: `title` frontmatter → first H1 heading → first non-empty line
3. Convert to kebab-case: lowercase, spaces to hyphens, strip special characters, max 60 chars
4. Example: "The Power of Atomic Habits" → `the-power-of-atomic-habits`

Move to the appropriate subfolder with a dated slug:
```bash
mv "$VAULT_ROOT/inbox/<filename>" "$VAULT_ROOT/archive/<type>/YYYY-MM-DD-<slug>.md"
```

Non-markdown files keep their original extension in archive:
```bash
mv "$VAULT_ROOT/inbox/report.pdf" "$VAULT_ROOT/archive/papers/YYYY-MM-DD-<slug>.pdf"
```

Add frontmatter (to `.md` files only — prepend if missing, or create a companion `.md` sidecar for binary files):
```yaml
---
title: <derived from content>
type: clipping | paper | book | daily | idea | doc
captured-date: YYYY-MM-DD
source-url: <if present>
original-file: <filename if binary>
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

Update `inbox-count` in `$VAULT_ROOT/context.md` after all files are processed (count all file types, not just `.md`).
