#!/bin/bash
# Collect relevant context files from .opencode/context/

CONTEXT_DIR="${1:-.opencode/context}"
OUTPUT="${2:-./pre-plan.md}"

echo "## Relevant Context Files" >> "$OUTPUT"
echo "" >> "$OUTPUT"

if [ -d "$CONTEXT_DIR" ]; then
    find "$CONTEXT_DIR" -name "*.md" -type f 2>/dev/null | while read -r file; do
        echo "### $(basename "$file")" >> "$OUTPUT"
        echo '```' >> "$OUTPUT"
        head -100 "$file" >> "$OUTPUT"
        echo '```' >> "$OUTPUT"
        echo "" >> "$OUTPUT"
    done
else
    echo "*No context directory found at $CONTEXT_DIR*" >> "$OUTPUT"
fi

echo "Context collection complete"
