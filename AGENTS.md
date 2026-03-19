# AGENTS.md

This repository contains OpenCode configuration files, agents, skills, and templates for personal workflow automation. It is not a code project—there are no build, lint, or test commands.

## Repository Structure

```
root/
├── opencode.json              # OpenCode CLI configuration
└── .opencode/
    ├── agents/                # Agent definitions
    │   ├── organizer.md       # Creates GitHub issues from plans
    │   ├── planner.md        # Creates agile plans from pre-plans
    │   └── pre-planner.md     # Analyzes requests, scans context
    ├── skills/                # Skill definitions
    │   ├── gh-issue/          # Creates GitHub issues via gh CLI
    │   └── tmp-file/          # Manages temporary markdown files
    └── templates/github/      # GitHub issue templates
        ├── feature.md
        └── story.md
```

## Agent Definition Conventions

Agents use YAML frontmatter with these fields:

```yaml
---
description: <short description>
mode: <subagent|mainagent>
permission:
  skill: <skill-name>
  write: <allow|deny|ask>
  edit: <allow|deny|ask>
  read: <allow|deny|ask>
  glob: <allow|deny>
  grep: <allow|deny>
  bash:
    "<pattern>": <allow|deny>
    "*": <deny>
---
```

## Skill Definition Conventions

Skills use YAML frontmatter with these fields:

```yaml
---
name: <skill-name>
description: <what the skill does>
permission:
  write: <allow|deny>
  bash:
    "<command pattern>": <allow|deny>
    "*": <deny>
---
```

## Template Conventions

GitHub issue templates use YAML frontmatter:

```yaml
---
name: "<Template Name>"
about: "<Description>"
title: "[PREFIX] <Title>"
---
```

Templates must include these sections:
- **Metadata** - Target component, LLM context hints
- **Executive Summary** - 1-2 sentence overview
- **User Story** - As a/I want to/So that format
- **Functional Requirements** - Bullet points with checkboxes
- **Acceptance Criteria** - Given/When/Then format
- **Technical Implementation Details** - Existing logic, data model changes, dependencies
- **Definition of Done** - Checklist items

## File Naming

- Agent files: lowercase with hyphens (e.g., `pre-planner.md`)
- Skill directories: lowercase with hyphens (e.g., `gh-issue/`)
- Template files: lowercase with hyphens (e.g., `feature.md`)

## Content Guidelines

### Agent Instructions
- Use `## Workflow` for sequential steps
- Use `## Constraints` for limitations and rules
- Start with "You are the [Role] agent"
- Use numbered lists for sequential processes
- Use bullet points for parallel or non-sequential items

### Markdown Formatting
- Use ATX-style headers (`##` not `==="`)
- Use code fences with language hints for examples
- Use `**bold**` for emphasis in instructions
- Use `> blockquotes` for important notes
- Maximum line length: 120 characters

### YAML Frontmatter
- Use 2-space indentation
- Always quote strings containing special characters
- Use lowercase for boolean values
- Separate frontmatter from content with blank line

## Workflow Patterns

### Creating Issues
1. Use `organizer.md` agent to transform plans into issues
2. Leverage `gh-issue` skill for GitHub interaction
3. Use templates from `.opencode/templates/github/`
4. Create issues sequentially to avoid rate limits

### Planning Workflow
1. `pre-planner.md` analyzes request and scans context
2. `planner.md` creates detailed agile plan
3. `organizer.md` creates GitHub issues from plan

### File Management
- Use `tmp-file` skill for temporary markdown files in `./tmp`
- Create `./tmp` directory with `mkdir -p ./tmp` before writing
- Write files with descriptive names (e.g., `pre-plan.md`, `plan.md`)

## Context Scanning

When analyzing project context:
1. Find `.md` files in `./opencode/context/**`
2. Use grep to search for relevant keywords
3. Extract only relevant sections, not entire files
4. Prioritize: core system definitions, business domain, technical domain, architectural decisions

## Common Patterns

### Permission Patterns
- Subagents typically have limited bash permissions (only specific commands)
- Skills have narrow permission scopes
- Use `"<pattern>"` for glob-style bash command matching

### Diagram Generation
- Use Mermaid syntax for visual diagrams
- Diagram 1: Pre-Plan Structure
- Diagram 2: Component Interaction

## Notes

- The `gh` CLI must be authenticated for issue creation
- Local LLM (ollama with qwen3-7b) is used for planning agents to save tokens
