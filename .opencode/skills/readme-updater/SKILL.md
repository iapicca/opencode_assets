---
name: readme-updater
description: Updates README.md to reflect agent changes while preserving installation and requirements sections
license: MIT
compatibility: opencode
metadata:
  audience: housekeeper
  workflow: documentation
---

## What I do

I update `./README.md` based on changes to `.opencode/agents.md`, keeping the public documentation in sync with actual agents while preserving critical sections.

## When to use me

Use this skill when:
- New agents have been added
- Agent roles or descriptions have changed
- Agent workflow has been modified

## Critical Rules

### NEVER Modify
- **Installation section** (lines 60-64 in original): The `git clone` and `cp -R` commands
- **Requirements section**: OpenCode CLI, Git, GitHub CLI requirements
- **Model section**: Model information

### MAY Update
- Architecture diagram (simplify if needed)
- Agent Roles table (sync with agents.md)
- Any other non-critical content

### Brevity Guidelines
- Target: 40-50 lines total
- Keep explanations concise
- Use tables for agent roles (not paragraphs)
- Simplify diagram if agents changed significantly

## How I work

1. **Read current README.md** and `agents.md`
2. **Identify changes** in agent list from `agents.md`
3. **Preserve critical sections**:
   - Installation commands (lines 60-64)
   - Requirements
   - Models
4. **Refresh Agent Roles table** with current agents
5. **Simplify architecture diagram** if agent count changed significantly

## Target README Structure

```markdown
## What's this?
Brief one-liner about the multi-agent system

## Architecture
Mermaid diagram (simplified)

## Agent Roles
Table: Agent | Role

## Models
Current model info

## Requirements
Bulleted list

## Installation
Code block (PRESERVE THIS EXACTLY)
```

## Output

Edit `README.md` in place, maintaining:
- Installation section exactly as-is
- Requirements section exactly as-is
- Models section exactly as-is
