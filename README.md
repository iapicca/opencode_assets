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

## Optional

Save tokens run 7b mobdel locally (works on my macbook air M1 2020)

- install ollama `brew install ollama`
- pull a model (eg: `ollama pull qwen3-coder:7b`)
- run `ollama run qwen3-coder:7b` and save
```bash
/save qwen3-7b
/bye
```
- add to opencode
```json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "ollama/qwen3-7b",
  "provider": {
    "ollama": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama Local",
      "options": {
        "baseURL": "http://localhost:11434/v1"
      },
      "models": {
        "qwen3-7b": {
          "name": "Qwen3 Coder Ollama",
          "tools": true
        }
      }
    }
  }
}
```
