---
name: "Commit Message"
about: "Template for meaningful commit messages"
---

## Commit Message Format

```
<type>: <short summary>

<body (optional)>

<footer (optional)>
```

## Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding or updating tests
- **chore**: Changes to the build process or auxiliary tools

## Rules

1. **Subject line**: Max 72 characters, start with lowercase, no trailing period
2. **Body**: Explain the "why", not the "what". Max 100 characters per line.
3. **Footer**: Reference issues/tickets with `Fixes #<number>` or `Closes #<number>`

## Examples

```
feat: add user authentication via OAuth

Implement OAuth 2.0 flow for GitHub login.
The previous session-based auth had scalability issues.

Closes #123
```

```
fix: resolve memory leak in image loader

The bitmap pool was not being cleared on activity destroy.
This caused OOM errors on low-memory devices.

Fixes #456
```

```
docs: update API documentation for v2 endpoints

Clarify response format for paginated endpoints.
Add examples for rate limit headers.
```
