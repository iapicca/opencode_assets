#!/bin/bash
# Create agile plan from pre-plan.md

INPUT="${1:-./pre-plan.md}"
OUTPUT="${2:-./plan.md}"

if [ ! -f "$INPUT" ]; then
    echo "Error: $INPUT not found"
    exit 1
fi

cat > "$OUTPUT" << 'EOF'
# Agile Plan

## Features

### Feature 1: [Feature Name]
**Description**: 

**Stories**:

#### Story 1.1: [Story Title]
**Description**: 
**Requirements**:
- 
**Dependencies**: None
**Acceptance Criteria**:
- [ ] 

**Tasks**:

##### Task 1.1.1: [Task Title]
**Description**: 
**Technical Notes**:
**Estimated Effort**: 

##### Task 1.1.2: [Task Title]
**Description**: 
**Technical Notes**:
**Estimated Effort**: 

---

## Issue Summary

| Type | Count |
|------|-------|
| Features | 1 |
| Stories | 1 |
| Tasks | 2 |

---

*Edit this template to customize your plan*
EOF

echo "Plan created at $OUTPUT"
