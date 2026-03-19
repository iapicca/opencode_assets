---
name: gh-issue
description: Creates GitHub issues using the gh cli and possibly leveraging templates for "feature"s, "story"-ies and "task"s.
permission:
  bash:
    "gh *": allow
    "*": deny
---

## What I do

- Detect the GitHub repository from git remote.
- Load issue templates (feature, story, task).
- Create GitHub issues sequentially using the `gh` CLI.
- Format issue titles with appropriate prefixes.

## When to use me

- When you need to transform a plan into actionable GitHub issues.
- When you want to ensure consistent issue formatting using project templates.

## Workflow

1. **Detect Repository**: Get GitHub repo from git remote:
   ```bash
   git remote get-url origin
   ```

2. **Load Templates**: Load issue templates from `~/.opencode/lib/templates/` (feature.json, story.json, task.json).

3. **Load Gh Aliases**: Load from `~/.opencode/lib/gh-aliases.sh` to minimize token usage.

4. **Create Issues**: For each item:
   - Map to appropriate template.
   - Format title with `[Feature]`, `[Story]`, or `[Task]` prefix.
   - Use `gh cli` to create the issue.
