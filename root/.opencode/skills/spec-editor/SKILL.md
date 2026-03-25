---
name: spec-editor
description: Creates and edits spec documentation files in .opencode/specs/ based on read-only templates from .opencode/templates/specs/
---

## What I do

- Read templates from `.opencode/templates/specs/` (read-only source)
- Create new `.md` files in `.opencode/specs/` based on templates
- Edit existing `.md` files in `.opencode/specs/`

## When to use me

- When you need to document architecture, coding standards, project structure, tech stack, or project vision
- When following the project convention for spec documentation

## Available Templates

| Template | Purpose |
|----------|---------|
| `architecture.md` | System overview, data flow, ADRs |
| `coding-standards.md` | Code style, testing, git conventions |
| `project-structure.md` | Directory layout, modules, naming |
| `tech-stack.md` | Language, frameworks, dependencies |
| `project-vision.md` | Purpose, goals, success metrics |

## Workflow

1. **Identify template**: Determine which template fits the task
2. **Read template**: Load from `.opencode/templates/specs/<template>.md`
3. **Fill placeholders**: Replace `{{PLACEHOLDER}}` values with actual content
4. **Ensure directory**: Run `mkdir -p .opencode/specs/` if creating new files
5. **Write/Edit**: Save output to `.opencode/specs/<filename.md>`

## Permissions

- **Read**: `.opencode/templates/specs/**` and `.opencode/specs/**`
- **Write**: `.opencode/specs/**` only
- **Bash**: `mkdir -p .opencode/specs/` only
