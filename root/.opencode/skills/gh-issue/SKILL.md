---
name: gh-issue
description: Creates GitHub issues using the gh cli and possibly leveraging templates for "feature"s, "story"-ies and "task"s.
---

## What I do

- Detect the GitHub repository from git remote.
- Load issue templates (feature, story, task).
- Create GitHub issues sequentially using the `gh` CLI.
- Format issue titles with appropriate prefixes.

> **Permissions**: Bash: `gh issue *`, `git remote get-url *`

## When to use me

- When you need to transform a plan into actionable GitHub issues.
- When you want to ensure consistent issue formatting using project templates.

## Workflow

1. **Detect Repository**: Get GitHub repo from git remote:
   ```bash
   git remote get-url origin
   ```

2. **Load Templates**: Read issue templates from `.opencode/templates/github/` (`feature.md`, `story.md`, `task.md`).

3. **Create Issues**: For each item:
   - Map to the appropriate template.
   - Format title with `[Feature]`, `[Story]`, or `[Task]` prefix.
   - Use `gh issue create` to create the issue.
