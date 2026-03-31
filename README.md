## What's this?

[OpenCode](https://opencode.ai) bootstrap template — a multi-agent system for transforming GitHub issues into implementation plans and pull requests through an agile-inspired pipeline.

## Architecture

```mermaid
flowchart TB
    subgraph "Planning Flow"
        User([User Request]) -->|Issue URL| pre-planner[pre-planner]
        pre-planner -->|tmp/pre-plan.md| planner[planner]
        planner -->|tmp/plan.md| spec-generator[spec-generator]
        planner -->|tmp/plan.md| organizer[organizer]
    end
    
    subgraph "Implementation Flow"
        User -->|Issue URL| coder[coder]
        coder -->|delegate| implementation-planner[implementation-planner]
        implementation-planner -->|tmp/implementation-plan.md| coder
        coder -->|invoke| pr-writer[pr-writer]
    end
    
    subgraph "Verification Flow"
        User -->|PR URL| spec-verifier[spec-verifier]
        spec-verifier -->|invoke| opencode-coach[opencode-coach]
    end
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
