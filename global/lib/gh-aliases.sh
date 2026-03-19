#!/bin/bash
# Gh CLI Aliases for Token-Efficient Issue Creation
# Source this file or add to your shell profile

# Create a feature issue
gh-create-feature() {
    local REPO="$1"
    local TITLE="$2"
    local BODY="$3"
    gh issue create --repo "$REPO" --title "[Feature] $TITLE" --body "$BODY"
}

# Create a story issue
gh-create-story() {
    local REPO="$1"
    local TITLE="$2"
    local BODY="$3"
    gh issue create --repo "$REPO" --title "[Story] $TITLE" --body "$BODY"
}

# Create a task issue
gh-create-task() {
    local REPO="$1"
    local TITLE="$2"
    local BODY="$3"
    gh issue create --repo "$REPO" --title "[Task] $TITLE" --body "$BODY"
}

# List issues by type
gh-list-features() {
    local REPO="$1"
    gh issue list --repo "$REPO" --search "[Feature]" --limit 50
}

gh-list-stories() {
    local REPO="$1"
    gh issue list --repo "$REPO" --search "[Story]" --limit 50
}

gh-list-tasks() {
    local REPO="$1"
    gh issue list --repo "$REPO" --search "[Task]" --limit 50
}

# Get current repo from git
gh-current-repo() {
    git remote get-url origin | sed 's|.*github.com/||' | sed 's|\.git||'
}
