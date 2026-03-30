# OpenCode Agents — Permission Convention

## Principle

**Agents are entitled ONLY to the permissions specified in the skills they invoke.**

This means:
- An agent may only use bash commands that are declared in the frontmatter `permission` section of the skills it uses
- An agent may not use any additional bash commands beyond what its skills require
- If an agent has no skills, it should have no bash permissions (or only very specific ones as explicitly needed)

## Convention

1. **Skills declare their permissions** — Each skill's `SKILL.md` frontmatter must contain a `permission` block declaring all bash commands it requires
2. **Agents mirror skill permissions** — When an agent invokes a skill, the agent's `permission` block must include all bash permissions that the skill needs
3. **No extra permissions** — Agents should not have bash permissions that aren't required by their skills

## File Naming

- Agent files live in `.opencode/agents/<name>.md`
- The file name (without `.md`) becomes the agent ID
- Example: `organizer.md` → agent ID `@organizer`

## Skill Invocation

Agents invoke skills using the `skill` tool:

```
skill({ name: "<skill-name>" })
```

When a skill is loaded, the agent should use ONLY the bash commands declared in that skill's `permission` frontmatter.

## Example

If `gh-issue` skill declares:
```yaml
permission:
  bash:
    "gh issue *": allow
    "git remote get-url *": allow
```

Then the `organizer` agent that uses `gh-issue` must have:
```yaml
permission:
  bash:
    "gh issue *": allow
    "git remote get-url *": allow
  skill:
    "gh-issue": allow
```
