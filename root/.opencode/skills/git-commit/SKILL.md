---
name: git-commit
description: Creates meaningful git commits following project conventions
---

## What I do

- Stages relevant files for commit
- Creates commits with meaningful messages following conventional commits format
- Ensures commit messages describe the WHY, not just the WHAT

## When to use me

- When you need to commit changes with a clear, descriptive message
- When following a conventional commits standard

## Workflow

1. **Review Changes**: Run `git status` and `git diff` to understand what changed
2. **Determine Message**: Follow format: `<type>: <description>`
   - Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
   - Description: concise summary (under 50 chars if possible)
3. **Stage Files**: `git add <files>` for relevant changes
4. **Commit**: `git commit -m "<type>: <description>"`

## Commit Message Format

```
<type>: <short summary>

<optional body with more detail>

<optional footer with issue refs>
```

Examples:
- `feat: add user authentication via OAuth`
- `fix: resolve null pointer in user profile`
- `docs: update API documentation for /users endpoint`