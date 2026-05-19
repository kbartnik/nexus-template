---
description: Zero-friction inbox dump — write a thought to inbox/ without side effects
argument-hint: <thought, URL, or note>
allowed-tools: Bash(bash:*)
---

Run the capture script:

```bash
bash scripts/capture.sh "$ARGUMENTS"
```

Output the one-line result from the script and stop. No analysis, no follow-up.
