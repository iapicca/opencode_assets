---
name: opencode-feedback
description: "Proposes improvements to the opencode_assets repository (agents, skills, templates) by creating a GitHub issue"
---

## What I do

- Takes improvement details as arguments
- Creates a GitHub issue in `iapicca/opencode_assets` using the `opencode-improvement` template
- Provides structured feedback on agents, skills, and templates

> **Note**: This skill works from ANY repository — it hardcodes the target as `iapicca/opencode_assets`.

## When to use me

- When analyzing a PR reveals meaningful improvements that would benefit the opencode_assets toolkit
- When users or agents want to propose enhancements to the shared OpenCode configuration

## Workflow

1. **Prepare Issue Content**: Extract from arguments:
   - `improvement_type`: agent / skill / template / documentation / other
   - `target_files`: Which files in `.opencode/` are affected
   - `current_behavior`: What currently happens
   - `expected_behavior`: What should happen
   - `rationale`: Why this improvement matters
   - `implementation_hints`: Optional suggestions
   - `impact_scope`: What this affects
   - `source_repo`: The repository where the PR was analyzed
   - `source_pr_url`: The PR URL that prompted this improvement
   - `pr_author`: The PR author

2. **Load Template**: Read `.opencode/templates/opencode-improvement.md`

3. **Replace Placeholders**:
   ```
   {{IMPROVEMENT_TYPE}}       → improvement type
   {{TARGET_FILES}}           → target file path(s)
   {{CURRENT_BEHAVIOR}}       → current behavior description
   {{EXPECTED_BEHAVIOR}}      → expected/improved behavior
   {{RATIONALE}}              → why this improvement matters
   {{IMPLEMENTATION_HINTS}}   → optional implementation suggestions
   {{IMPACT_SCOPE}}           → what this affects
   {{SOURCE_REPO}}            → repository where PR was analyzed
   {{SOURCE_PR_URL}}          → URL of the PR
   {{PR_AUTHOR}}              → PR author username
   ```

4. **Create Issue**: Use `gh issue create`:
   ```bash
   gh issue create \
     --repo iapicca/opencode_assets \
     --title "[IMPROVEMENT] <brief summary>" \
     --body "<filled template>" \
     --label improvement \
     --label opencode-assets
   ```

## Constraints

- Target repository is hardcoded: `iapicca/opencode_assets`
- Only use `gh issue create` for GitHub operations
- Always use the `opencode-improvement` template for consistency
