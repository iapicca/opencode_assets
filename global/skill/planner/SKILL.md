---
name: planner
description: Creates detailed agile plan from pre-plan.md, exports to plan.md
---

# Planner Skill

This skill transforms the pre-plan into a comprehensive agile plan.

## Usage
Invoke this skill after pre-planner has created `./pre-plan.md`.

## Workflow
1. Read `./pre-plan.md`
2. Analyze requirements
3. Break down into Features → Stories → Tasks
4. Export to `./plan.md`

## Scripts
- `create-plan.sh`: Generates the agile plan document

## Output
- `./plan.md` - The complete agile plan with Features, Stories, and Tasks
