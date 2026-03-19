---
name: pre-planner
description: Summarizes user requests and collects relevant context files, exports to pre-plan.md
---

# Pre-Planner Skill

This skill executes the pre-planning workflow to prepare for agile planning.

## Usage
Invoke this skill when the user wants to prepare a request for planning.

## Workflow
1. Summarize the user's request
2. Collect relevant .md files from `.opencode/context/`
3. Export to `./pre-plan.md`

## Scripts
- `summarize.sh`: Creates a summary of the user's request
- `collect.sh`: Collects relevant context files

## Context Directories
- `.opencode/context/core/`
- `.opencode/context/project-intelligence/`

## Output
- `./pre-plan.md` - The pre-plan document
