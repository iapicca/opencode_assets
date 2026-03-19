---
name: organizer
description: Creates GitHub issues from plan.md using gh cli and templates
---

# Organizer Skill

This skill parses the plan and creates GitHub issues.

## Usage
Invoke this skill after planner has created `./plan.md`.

## Workflow
1. Read `./plan.md`
2. Detect GitHub repo from git remote
3. Load issue templates
4. Create issues via gh cli
5. Generate summary report

## Scripts
- `create-issues.sh`: Parses plan.md and creates GH issues

## Templates
- `~/.opencode/lib/templates/feature.json`
- `~/.opencode/lib/templates/story.json`
- `~/.opencode/lib/templates/task.json`

## Gh Aliases
- `~/.opencode/lib/gh-aliases.sh`

## Output
- Console summary of created issues
