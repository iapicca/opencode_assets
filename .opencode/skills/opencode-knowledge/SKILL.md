---
name: opencode-knowledge
description: Core knowledge of OpenCode conventions, standards, and best practices for agents and skills
license: MIT
compatibility: opencode
metadata:
  audience: agents
  workflow: knowledge
---

## What I do

I provide core knowledge about OpenCode conventions and standards for creating agents and skills.

## Directory Structure

```
.opencode/
├── agents/
│   └── <name>.md          # Agent definition files
├── skills/
│   └── <name>/
│       └── SKILL.md        # Skill definition files
└── opencode.json           # Configuration file
```

Global locations:
```
~/.config/opencode/
├── agents/
│   └── <name>.md
├── skills/
│   └── <name>/
│       └── SKILL.md
└── opencode.json
```

## Agent Modes

| Mode | Description |
|------|-------------|
| `primary` | Main agent, switchable via Tab key |
| `subagent` | Invoked via @ mention or Task tool |
| `all` | Default mode if not specified |

## Built-in Agents

- **Build** (primary): Default agent with all tools
- **Plan** (primary): Read-only analysis agent
- **General** (subagent): Research and multi-step tasks
- **Explore** (subagent): Fast read-only exploration

## Skill Discovery

OpenCode searches these paths:
- `.opencode/skills/<name>/SKILL.md` (project)
- `~/.config/opencode/skills/<name>/SKILL.md` (global)
- `.claude/skills/<name>/SKILL.md` (Claude-compatible)
- `.agents/skills/<name>/SKILL.md` (agent-compatible)

## Permission Values

| Value | Behavior |
|-------|----------|
| `allow` | Permitted without confirmation |
| `deny` | Blocked |
| `ask` | Prompts for confirmation |

Permission patterns support wildcards: `internal-*`, `git *`

## Naming Convention

Regex: `^[a-z0-9]+(-[a-z0-9]+)*$`

Valid: `code-review`, `my-agent`, `git-helper`
Invalid: `CodeReview`, `my_agent`, `-invalid`, `double--hyphen`

## Frontmatter Fields

### Agent Fields
- **description** (required): What the agent does
- **mode** (required): primary|subagent|all
- **model**: Override default model
- **temperature**: 0.0-1.0
- **steps**: Max iterations
- **prompt**: System prompt
- **permission**: Permission overrides
- **tools**: Tool availability
- **hidden**: Hide from autocomplete
- **color**: UI color
- **top_p**: Alternative to temperature

### Skill Fields
- **name** (required): Must match directory
- **description** (required): 1-1024 chars
- **license** (optional): License identifier
- **compatibility** (optional): opencode
- **metadata** (optional): Custom key-value pairs
