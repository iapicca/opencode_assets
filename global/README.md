# Global OpenCode Workflow System

A 3-agent system for structured agile planning with AI assistance.

## Installation

```bash
cp -r ./global ~/opencode
```

This creates:
- `~/opencode/agent/` - Agent definitions
- `~/opencode/skill/` - Skill modules
- `~/opencode/lib/` - Utilities and templates
- `~/opencode/context/` - Reference materials

## Workflow

### 1. Pre-Planner
Summarizes user request and collects relevant context.

```bash
# In target project
opencode
> Use pre-planner to prepare my request: [your request]
```

Output: `./pre-plan.md`

### 2. Planner
Creates detailed agile plan from pre-plan.

```bash
> Use planner to create the plan
```

Output: `./plan.md` (Features → Stories → Tasks)

### 3. Organizer
Creates GitHub issues from plan.

```bash
> Use organizer to create issues
```

Creates issues with `[Feature]`, `[Story]`, `[Task]` prefixes.

## Structure

```
~/opencode/
├── agent/
│   ├── pre-planner.md
│   ├── planner.md
│   └── organizer.md
├── skill/
│   ├── pre-planner/
│   ├── planner/
│   └── organizer/
├── lib/
│   ├── gh-aliases.sh
│   └── templates/
└── context/
    └── rules/
        └── agile-patterns.md
```

## Requirements

- OpenCode CLI
- Git CLI
- GitHub CLI (`gh`) authenticated

## Inspired By

- OAC (OpenAgents Control) Framework
- BMad v6 Methodology
- Senior Engineer AI Workflows
