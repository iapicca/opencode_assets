#!/bin/bash
# Summarize user request

INPUT="$1"
OUTPUT="${2:-./pre-plan.md}"

cat > "$OUTPUT" << 'EOF'
# Pre-Plan

## Request Summary

EOF

if [ -n "$INPUT" ]; then
    echo "**Goal**: $INPUT" >> "$OUTPUT"
fi

echo "" >> "$OUTPUT"
echo "## Collected Context" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "*To be filled by collect.sh*" >> "$OUTPUT"

echo "Pre-plan template created at $OUTPUT"
