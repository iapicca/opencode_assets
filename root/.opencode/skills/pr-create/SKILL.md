---
name: pr-create
description: Creates pull requests using gh CLI with project templates
---

## What I do

- Detects the GitHub repository from git remote
- Loads the PR template from `.opencode/templates/github/pr.md`
- Creates a pull request using `gh pr create`

## When to use me

- After committing changes and ready to create a PR
- When following a standardized PR template

## Workflow

1. **Detect Repository**: Get GitHub repo from git remote:
   ```bash
   git remote get-url origin
   ```

2. **Load Template**: Read `.opencode/templates/github/pr.md` for the template structure

3. **Prepare PR Details**:
   - Title: Clear, descriptive title (feature/fix name)
   - Body: Fill template with changes, testing notes, screenshots if relevant
   - Base: Usually `main` or `master` (detect from existing PRs or use default)

4. **Create PR**: Use `gh pr create`:
   ```bash
   gh pr create --title "<title>" --body "<body>" --base <base-branch>
   ```