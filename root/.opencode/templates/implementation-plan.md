---
name: "Implementation Plan"
about: "Detailed implementation plan for a GitHub issue or PR follow-up"
---

## Task Summary
> Brief description of what needs to be built/implemented/fixed

**Source:** [GitHub Issue URL] or [GitHub PR Comment URL]
**Goal:** [What problem are we solving?]
**Issue Type:** [Feature / Story / Task]

---

## Branch Strategy

- **Working Branch:** `task/<issue-number>-<slug>` (branched from Parent Branch)
- **Target Branch:** `story/<parent-issue-number>-<slug>` (where this PR will merge)
- **Parent Branch:** `feature/<grandparent-issue-number>-<slug>` (where Working Branch is based)

> **Note:** The `pr-writer` agent will create a PR with `--base <target-branch>`.

---

## Files to Read
> Specific file paths (max 20 to stay focused)

- [ ] `path/to/file1.ext`
- [ ] `path/to/file2.ext`

---

## Files to Change
> Specific file paths with change descriptions

- **`path/to/file1.ext`**: [Description of change]
- **`path/to/file2.ext`**: [Description of change]

---

## New Files
> File paths with initial content or structure

- **`path/to/new-file.ext`**: [Initial content or structure]

---

## Implementation Steps
> Numbered list of specific actions

1. [Step 1]
2. [Step 2]
3. [Step 3]

---

## Tools to Use
> Which tools (edit, write, bash) for each step

| Step | Tool | Target |
|------|------|--------|
| 1    | read | file1.ext |
| 2    | edit | file2.ext |
| 3    | write | new-file.ext |

---

## Acceptance Criteria
> How to verify the implementation is correct

- [ ] **AC 1:** [Given X, when Y, then Z]
- [ ] **AC 2:** [Given A, when B, then C]
