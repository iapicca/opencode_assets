---
name: markdown-writer
description: Creates properly formatted OpenCode markdown files with valid YAML frontmatter for agents and skills
license: MIT
compatibility: opencode
metadata:
  audience: agents
  workflow: writing
---

## What I do

- Write valid YAML frontmatter for OpenCode files
- Create agent markdown files in `.opencode/agents/<name>.md`
- Create skill markdown files in `.opencode/skills/<name>/SKILL.md`
- Validate naming conventions before writing
- Ensure proper YAML syntax

## When to use me

Use this skill when you need to:
- Create a new OpenCode agent
- Create a new OpenCode skill
- Update existing agent or skill files
- Validate frontmatter format
- Ensure compliance with OpenCode standards

## Frontmatter Templates

### Agent Template
```yaml
---
description: <1-1024 chars describing the agent>
mode: primary|subagent|all
model: <provider/model-id>
temperature: <0.0-1.0>
steps: <max iterations>
prompt: <inline or "{file:path}">
permission:
  edit: allow|deny|ask
  bash: allow|deny|ask
  skill:
    "<pattern>": allow|deny|ask
tools:
  skill: true|false
hidden: true|false
color: "#<hex>"|<theme-color>
top_p: <0.0-1.0>
---
```

### Skill Template
```yaml
---
name: <must match directory name>
description: <1-1024 chars>
license: <optional>
compatibility: opencode
metadata:
  <key>: <value>
---
```

## Validation Rules

### Agent/Skill Names
- Length: 1-64 characters
- Pattern: `^[a-z0-9]+(-[a-z0-9]+)*$`
- No leading/trailing hyphens
- No consecutive hyphens

### Descriptions
- Length: 1-1024 characters
- Be specific enough for agent selection

### YAML Best Practices
- Use lowercase for boolean values (true/false)
- Quote strings with special characters
- Use consistent indentation (2 spaces)
