---
name: tmp-file
description: Creates .md files in ./tmp folder.
permission:
  write: allow
  bash:
    "mkdir *": allow
    "*": deny
---

## What I do

- Create the `./tmp` directory if it doesn't exist.
- Generate and write Markdown (`.md`) files into the `./tmp` folder.

## When to use me

- When you need to store temporary plans, pre-plans, or reports before they are finalized or approved.
- When you need a scratch space for markdown-based documentation.

## Workflow

1. **Ensure Directory**: Run `mkdir -p ./tmp`.
2. **Write File**: Write the markdown content to the specified filename within `./tmp`.
