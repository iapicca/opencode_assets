# OpenCode Skills — Reference Summary

source: https://opencode.ai/docs/skills/
generated: 2026-03-20

---

## WHAT SKILLS ARE

Reusable instruction sets loaded on-demand by agents via the native `skill` tool.
- Agent sees available skills listed in the tool description
- Agent loads a skill by calling `skill({ name: "<skill-name>" })`
- Skills are NOT pre-loaded — discovery is lazy

---

## FILE STRUCTURE

```
<skills-root>/
└── <skill-name>/
    └── SKILL.md        ← must be ALL CAPS
```

One folder per skill, one `SKILL.md` per folder.

---

## DISCOVERY PATHS (searched in order)

| Scope | Path |
|---|---|
| Project (opencode) | `.opencode/skills/<name>/SKILL.md` |
| Global (opencode) | `~/.config/opencode/skills/<name>/SKILL.md` |
| Project (Claude-compat) | `.claude/skills/<name>/SKILL.md` |
| Global (Claude-compat) | `~/.claude/skills/<name>/SKILL.md` |
| Project (agent-compat) | `.agents/skills/<name>/SKILL.md` |
| Global (agent-compat) | `~/.agents/skills/<name>/SKILL.md` |

**Walk-up behavior**: For project-local paths, OpenCode walks up from CWD to the git worktree root, loading any matching skills found along the way.

---

## SKILL.md FRONTMATTER

```yaml
---
name: git-release           # required
description: "..."          # required, 1–1024 chars
license: MIT                # optional
compatibility: opencode     # optional
metadata:                   # optional, string-to-string map
  audience: maintainers
  workflow: github
---
```

### Recognized fields

| Field | Required | Notes |
|---|---|---|
| `name` | YES | Must match the containing directory name |
| `description` | YES | 1–1024 chars; used by agent to decide when to load |
| `license` | no | e.g. `MIT` |
| `compatibility` | no | e.g. `opencode` |
| `metadata` | no | Arbitrary string-to-string map |

Unknown frontmatter fields are silently ignored.

---

## NAME VALIDATION RULES

- Length: 1–64 characters
- Allowed chars: lowercase alphanumeric + single hyphens as separators
- Must NOT start or end with `-`
- Must NOT contain `--`
- Must match the directory name containing `SKILL.md`
- Regex: `^[a-z0-9]+(-[a-z0-9]+)*$`

Valid: `git-release`, `pr-review`, `docs`
Invalid: `Git-Release`, `git--release`, `-release`, `release-`

---

## SKILL BODY (after frontmatter)

Free-form markdown. Recommended sections:
- **What I do** — concrete actions the skill performs
- **When to use me** — trigger conditions for the agent

Example:
```markdown
## What I do
- Draft release notes from merged PRs
- Propose a version bump
- Provide a copy-pasteable `gh release create` command

## When to use me
Use this when preparing a tagged release.
```

---

## HOW AGENTS SEE SKILLS

The `skill` tool description includes:
```xml
<available_skills>
  <skill>
    <name>git-release</name>
    <description>Create consistent releases and changelogs</description>
  </skill>
</available_skills>
```

Agent loads content by calling: `skill({ name: "git-release" })`

---

## PERMISSIONS

### Values
- `allow` — loads immediately, no prompt
- `deny` — hidden from agent, access rejected
- `ask` — user prompted before loading

### Global config (opencode.json)
```json
{
  "permission": {
    "skill": {
      "*": "allow",
      "pr-review": "allow",
      "internal-*": "deny",
      "experimental-*": "ask"
    }
  }
}
```

Patterns support wildcards: `internal-*` matches `internal-docs`, `internal-tools`, etc.

### Per-agent override — custom agent (frontmatter)
```yaml
---
permission:
  skill:
    "documents-*": "allow"
---
```

### Per-agent override — built-in agent (opencode.json)
```json
{
  "agent": {
    "plan": {
      "permission": {
        "skill": {
          "internal-*": "allow"
        }
      }
    }
  }
}
```

---

## DISABLING THE SKILL TOOL

Completely removes `<available_skills>` from the agent's context.

### Custom agent (frontmatter)
```yaml
---
tools:
  skill: false
---
```

### Built-in agent (opencode.json)
```json
{
  "agent": {
    "plan": {
      "tools": {
        "skill": false
      }
    }
  }
}
```

---

## TROUBLESHOOTING

| Problem | Check |
|---|---|
| Skill not appearing | `SKILL.md` must be ALL CAPS |
| Skill not appearing | Frontmatter must include both `name` and `description` |
| Skill not appearing | `name` must match directory name exactly |
| Skill not appearing | Permissions — `deny` hides skill from agent |
| Duplicate skill ignored | Skill names must be unique across all locations |

---

## KEY RULES FOR AGENTS

1. Skills are loaded lazily — call `skill({ name: "..." })` to read full content
2. `description` is what the agent uses to decide which skill to load — keep it specific
3. `name` in frontmatter must exactly match the folder name
4. Permission rules apply: `deny` = skill is completely hidden (not just blocked)
5. Walk-up discovery means skills in parent dirs of CWD are also found
6. Uniqueness: if the same skill name exists in multiple locations, behavior is undefined — avoid duplicates
