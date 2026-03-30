---
name: opencode-researcher
description: Efficiently researches OpenCode documentation using webfetch and extracts configuration patterns
license: MIT
compatibility: opencode
metadata:
  audience: agents
  workflow: research
---

## What I do

- Fetch OpenCode documentation pages using webfetch
- Extract relevant configuration examples and patterns
- Parse YAML frontmatter from documentation
- Identify validation rules and constraints
- Provide structured research output

## When to use me

Use this skill when you need to:
- Research OpenCode agent configuration options
- Find skill creation patterns and validation rules
- Look up permission configuration syntax
- Verify official documentation for any OpenCode feature
- Fetch and analyze https://opencode.ai/docs/agents and related pages

## Research Approach

1. Use `webfetch` to fetch relevant documentation pages
2. Extract specific configuration examples
3. Note frontmatter field requirements
4. Identify validation constraints
5. Provide actionable code snippets

## Fetch Priority

Primary pages to fetch:
- https://opencode.ai/docs/agents
- https://opencode.ai/docs/skills
- https://opencode.ai/docs/config
- https://opencode.ai/docs/permissions
- https://opencode.ai/docs/tools

Secondary pages:
- https://opencode.ai/docs/rules
- https://opencode.ai/docs/models
- https://opencode.ai/docs/providers
