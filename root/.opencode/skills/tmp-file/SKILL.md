---
name: tmp-file
description: Creates .md files in ./tmp folder.
---

## What I do

- Create the `./tmp` directory inside `.opencode` if it doesn't already exist.
- Create and edit markdown (`.md`) files inside `./tmp/` only.
- Only create files explicitly named in the agent's description (e.g., `pre-plan.md`, `plan.md`, `implementation-plan.md`).

> **Permissions**: While this skill's description is broad, permissions are restricted to the specific files named in each agent's description. Each agent that uses this skill declares only the permissions for the specific file it needs.

## Permissions Summary

| Command | Scope | Purpose |
|---------|-------|---------|
| `mkdir -p ./tmp` | `./tmp` | Create the tmp directory |
| `touch tmp/<file>.md` | Agent-specified file | Create empty file |
| `echo "" > tmp/<file>.md` | Agent-specified file | Write/overwrite file |
| `echo "" >> tmp/<file>.md` | Agent-specified file | Append to file |

## File Naming Conventions

Each agent declares the specific file(s) it works with:

| Agent | File |
|-------|------|
| pre-planner | `tmp/pre-plan.md` |
| planner | `tmp/plan.md` |
| implementation-planner | `tmp/implementation-plan.md` |

## When to use me

- When you need to store temporary plans, pre-plans, or reports before they are finalized or approved.
- When you need a scratch space for markdown-based documentation.
- When the agent description specifies the exact filename to write.

## Workflow

1. **Ensure Directory**: Run `mkdir -p ./tmp` to create the `./tmp` directory inside `.opencode`.
2. **Write File**: Write the markdown content to the specified filename within `./tmp`.

## Constraints

- Only write to `./tmp/` folder inside `.opencode`
- Only create files explicitly named in the agent's description
- Only use `mkdir -p ./tmp` for directory creation
- Do not run arbitrary bash commands
