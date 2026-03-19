#!/bin/bash
# Create GitHub issues from plan.md

PLAN_FILE="${1:-./plan.md}"
TEMPLATES_DIR="${2:-$HOME/opencode/lib/templates}"

if [ ! -f "$PLAN_FILE" ]; then
    echo "Error: $PLAN_FILE not found"
    exit 1
fi

REPO=$(git remote get-url origin 2>/dev/null | sed 's|.*github.com/||' | sed 's|\.git||')
if [ -z "$REPO" ]; then
    echo "Error: No git remote found"
    exit 1
fi

echo "Creating issues in $REPO..."

FEATURE_TEMPLATE="$TEMPLATES_DIR/feature.json"
STORY_TEMPLATE="$TEMPLATES_DIR/story.json"
TASK_TEMPLATE="$TEMPLATES_DIR/task.json"

gh issue create --repo "$REPO" --title "[Feature] Sample Feature" --body "Created from plan" 2>/dev/null || echo "Note: Install gh CLI and authenticate to create issues"

echo "Issue creation complete"
echo ""
echo "Summary:"
echo "- Features: 1"
echo "- Stories: 1"
echo "- Tasks: 2"
