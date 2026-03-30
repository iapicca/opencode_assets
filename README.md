## What's this?

[OpenCode](https://opencode.ai) bootstrap template — a multi-agent system for transforming GitHub issues into implementation plans and pull requests through an agile-inspired pipeline.

## Architecture

```mermaid
flowchart TD
    Request([User Request]) --> PrePlanner[pre-planner]
    PrePlanner -->|pre-plan.md| Planner[planner]
    Planner -->|plan.md| SpecGen[spec-generator]
    Planner -->|plan.md| Organizer[organizer]
    Organizer -->|GitHub Issues| Coder[coder]
    Coder -->|tmp/implementation-plan.md| ImplPlanner[implementation-planner]
    ImplPlanner --> Coder
    Coder --> PRWriter[pr-writer]
    PRWriter -->|PR Merged| SpecVerifier[spec-verifier]
    SpecVerifier --> Coach[opencode-coach]
```

## Agent Roles

| Agent | Role |
|-------|------|
| **pre-planner** | Analyzes request, generates pre-plan with diagrams |
| **planner** | Converts pre-plan into Feature → Story → Task hierarchy |
| **spec-generator** | Creates/updates spec docs from plan |
| **organizer** | Creates GitHub issues from plan |
| **implementation-planner** | Creates detailed implementation plans for issues |
| **coder** | Implements code from issue |
| **pr-writer** | Commits changes and creates PRs |
| **spec-verifier** | Verifies specs against merged PR |
| **opencode-coach** | Proposes improvements to this toolkit |

## Models

- `minimax/MiniMax-M2.7` — primary model
- `opencode/big-pickle` — for resource-intensive tasks

## Requirements

- OpenCode CLI
- Git
- GitHub CLI (`gh`) authenticated

## Installation

```bash
git clone https://github.com/iapicca/opencode_assets /tmp/opencode_assets && \
cp -R /tmp/opencode_assets/root/. . && \
rm -rf /tmp/opencode_assets
```
