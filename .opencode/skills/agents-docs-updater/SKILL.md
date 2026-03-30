---
name: agents-docs-updater
description: Parses ./root/.opencode/agents files and updates the agents.md summary table and workflow diagram
license: MIT
compatibility: opencode
metadata:
  audience: housekeeper
  workflow: documentation
---

## What I do

I scan all agent files in `root/.opencode/agents/` and update `.opencode/agents.md` with a refreshed summary table and workflow diagram.

## When to use me

Use this skill when:
- Agent-Builder has created new agents in `./root/`
- Agent-Builder has modified existing agents in `./root/`
- Documentation needs to be synced with actual `./root` template state

## Important

This skill monitors `./root/.opencode/agents/` and `./root/.opencode/skills/` - NOT `.opencode/agents/` or `.opencode/skills/`

## How I work

1. **Scan agents**: Use bash `ls root/.opencode/agents/*.md` to get all agent files
2. **Scan skills**: Use bash `ls root/.opencode/skills/*/SKILL.md` to get all skill directories
3. **Parse frontmatter**: Read each file and extract:
   - `description` field
   - `mode` field (primary|subagent|all)
   - For skills: `name` and `description`
4. **Generate summary table**: Update the Agent Summary Table in `agents.md`
5. **Update directory structure**: Refresh the Directory Structure section if files changed
6. **Update workflow diagram**: Refresh the Mermaid diagram if agent invocations changed

## Summary Table Format

```markdown
| Agent | Mode | Description |
|-------|------|-------------|
| <name> | <mode> | <description> |
```

## Workflow Diagram Rules

- Primary agents get user input
- Subagents are invoked by other agents
- Use skill invocations for documentation flow
- Keep colors consistent with existing theme

## Output

Edit `.opencode/agents.md` in place, preserving:
- Project Overview section (except Directory Structure)
- Templates Reference section
- Any user-added deep-dive content

Only refresh:
- Directory Structure section
- Agent Summary Table
- Workflow Diagram
- Skills Summary section
