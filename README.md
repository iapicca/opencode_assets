## What's this?

My personal opencode workflow

## Installation

From the project folder run this
```bash
git clone https://github.com/iapicca/opencode_assets /tmp/opencode_assets && /
cp -R /tmp/opencode_assets/root . && /
rm -rf /tmp/opencode_assets
```

## Requirements

- OpenCode CLI
- Git
- GitHub CLI (`gh`) authenticated

## Note on OpenCode Zen

Use Big Pickle (free) from OpenCode Zen for lightweight subagent tasks to save tokens.

- Sign in at [OpenCode Zen](https://opencode.ai/auth) and get your API key
- Run `/connect` in the TUI, select OpenCode Zen, and paste your API key
- Add to opencode:
```json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "minimax/MiniMax-M2.7",
  "agent": {
    "pre-planner": { "model": "opencode/big-pickle" },
    "organizer": { "model": "opencode/big-pickle" },
    "planner": { "model": "minimax/MiniMax-M2.7" },
    "implementation-planner": { "model": "opencode/big-pickle" },
    "pr-writer": { "model": "opencode/big-pickle" },
    "coder": { "model": "minimax/MiniMax-M2.7" }
  }
}
```
