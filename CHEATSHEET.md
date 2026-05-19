# Nexus Cheatsheet

## Wiki

| Command | What it does |
|---------|-------------|
| `/ingest` | Process all `inbox/` items — classify, archive, update wiki |
| `/query <question>` | Synthesize an answer from accumulated knowledge |
| `/lint` | Full vault health-check: orphans, stale pages, gaps |
| `/read <URL or file>` | Deep-process a source for real understanding |

## Session

| Command | What it does |
|---------|-------------|
| `/resume` | Restore context — show last focus, next action, inbox count |
| `/capture <thought>` | Zero-friction dump to inbox/ |
| `/inbox` | Quick list of what's in inbox/ |
| `/park <idea>` | Shelve a derailing idea, return to focus |
| `/focus` | Check current focus vs. what was planned |
| `/next <topic>` | Break a topic into 3 concrete first steps |
| `/wrap` | End the session — update context, log, report summary |
| `/cheatsheet [group]` | Show this reference |

## Developer

| Command | What it does |
|---------|-------------|
| `/adr <title>` | Create a pre-filled Architecture Decision Record |
| `/debrief <what happened>` | Create a pre-filled debrief / post-mortem |

## Investigator

| Command | What it does |
|---------|-------------|
| `/query <question>` | Ask anything — cites vault sources |
| `/read <source>` | Deep annotation with open questions and wikilink candidates |

## Learner

| Command | What it does |
|---------|-------------|
| `/learn <topic> [source]` | File learning notes for a topic |
| `/review <topic>` | Synthesize all notes on a topic into a coherent understanding |

## Demo

| Command | What it does |
|---------|-------------|
| `/demo-reset` | Create a clean `demo` branch from `demo-start` — real data untouched |
| `/demo-cleanup` | Return to `main`, restore stashed work, delete `demo` branch |
