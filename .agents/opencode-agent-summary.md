# OpenCode Agents — Reference Summary

source: https://opencode.ai/docs/agents/
generated: 2026-03-20

---

## AGENT TYPES

### primary
- Interacted with directly by the user
- Cycled via `Tab` or `switch_agent` keybind
- Built-in: `build` (all tools), `plan` (restricted: write/bash = ask)
- Hidden system primaries: `compaction`, `title`, `summary` (auto-run only)

### subagent
- Invoked by primary agents via Task tool OR manually via `@mention`
- Built-in: `general` (full tools except todo), `explore` (read-only)
- Can be hidden from autocomplete via `hidden: true`

### all
- Default mode when `mode` is not specified
- Usable both as primary and subagent

---

## DEFINITION FORMATS

### JSON (opencode.json)
```json
{
  "agent": {
    "<agent-id>": {
      "description": "...",
      "mode": "primary|subagent|all",
      "model": "provider/model-id",
      "prompt": "{file:./path/to/prompt.txt}",
      "temperature": 0.0,
      "steps": 10,
      "top_p": 0.9,
      "color": "#hex or theme-name",
      "disable": false,
      "hidden": false,
      "permission": { ... },
      "tools": { ... }
    }
  }
}
```

### Markdown (.opencode/agents/<name>.md or ~/.config/opencode/agents/<name>.md)
```yaml
---
description: <required>
mode: subagent
model: provider/model-id
temperature: 0.1
tools:
  write: false
  edit: false
  bash: false
permission:
  edit: deny
  bash:
    "*": ask
    "git diff": allow
  webfetch: deny
---
<system prompt body>
```
- File name becomes agent ID (e.g., `review.md` → `@review`)

---

## CONFIG OPTIONS

| Option | Type | Notes |
|---|---|---|
| `description` | string | Required. Used by models to decide when to invoke |
| `mode` | `primary\|subagent\|all` | Defaults to `all` |
| `model` | string | Format: `provider/model-id`. Subagents inherit parent model if unset |
| `prompt` | string | Path relative to config file: `{file:./prompts/x.txt}` |
| `temperature` | float 0.0–1.0 | 0–0.2 deterministic, 0.3–0.5 balanced, 0.6–1.0 creative |
| `top_p` | float 0.0–1.0 | Alternative to temperature |
| `steps` | int | Max agentic iterations before forced text-only response |
| `disable` | bool | Set `true` to disable |
| `hidden` | bool | Hides from `@` autocomplete; subagent-only |
| `color` | string | Hex or theme key: `primary\|secondary\|accent\|success\|warning\|error\|info` |
| extra fields | any | Passed through to provider (e.g., `reasoningEffort`, `textVerbosity`) |

---

## PERMISSIONS

### Values
- `allow` — run without approval
- `ask` — prompt user before running
- `deny` — tool disabled

### Scope: global → agent override
```json
{
  "permission": { "edit": "deny" },
  "agent": {
    "build": { "permission": { "edit": "ask" } }
  }
}
```

### Configurable tools
- `edit` — file edits/patches
- `bash` — shell commands (supports glob patterns + wildcard `*`)
- `webfetch` — web fetching
- `task` — controls which subagents this agent can invoke

### Bash permission rules
- Last matching rule wins
- Put `"*"` first, specific rules after to give them priority
```json
"bash": {
  "*": "ask",
  "git status *": "allow"
}
```

### Task permissions (controls subagent invocation)
```json
"permission": {
  "task": {
    "*": "deny",
    "orchestrator-*": "allow",
    "code-reviewer": "ask"
  }
}
```
- When denied, subagent is removed from Task tool description entirely
- Users can always manually `@mention` any subagent regardless of task permissions

---

## TOOLS (deprecated, prefer permission)

- `true` → `{"*": "allow"}`
- `false` → `{"*": "deny"}`
- Supports glob: `"mymcp_*": false`
- Agent-level config overrides global config

---

## FILE PATHS

| Scope | Path |
|---|---|
| Global agents | `~/.config/opencode/agents/` |
| Project agents | `.opencode/agents/` |
| Prompt files | relative to config file location |

---

## INVOCATION PATTERNS

- Primary: `Tab` to cycle, or configured `switch_agent` keybind
- Subagent (manual): `@agent-name message`
- Subagent (automatic): primary agent delegates via Task tool based on `description`
- Child session navigation: `<Leader>+Down` (enter), `Right/Left` (cycle), `Up` (return to parent)

---

## AGENT CREATION CLI

```sh
opencode agent create
```
Interactive: scope (global/project) → description → generates prompt + ID → select tools → writes `.md` file

---

## COMMON PATTERNS

### Read-only analyst
```yaml
permission:
  edit: deny
  bash:
    "*": deny
  webfetch: deny
```

### Reviewer with selective bash
```yaml
permission:
  edit: deny
  bash:
    "*": ask
    "git diff": allow
    "git log*": allow
    "grep *": allow
```

### Orchestrator controlling subagents
```json
"permission": {
  "task": {
    "*": "deny",
    "worker-*": "allow"
  }
}
```

### High-reasoning OpenAI agent
```json
{
  "model": "openai/gpt-5",
  "reasoningEffort": "high",
  "textVerbosity": "low"
}
```

---

## KEY RULES FOR AGENTS

1. `description` is required and influences when a subagent is auto-invoked
2. `mode` defaults to `all` if omitted
3. Subagents inherit the invoking primary agent's model if no `model` set
4. Permission rules: last matching rule wins (order matters for bash globs)
5. `hidden: true` only affects autocomplete visibility, not Task tool invocability
6. `steps` limit triggers a summarization prompt, not a hard stop
7. `tools` field is deprecated — use `permission` instead
8. `prompt` path is relative to the config file containing it
