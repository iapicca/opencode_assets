---
name: "Coding Standards"
about: "Code style, patterns, testing, and git conventions"
---

## Code Style

**Style guide:** {{STYLE_GUIDE}} (e.g., Effective Dart, Standard JS, Go Code Review)

**Formatter:** {{FORMATTER}} (e.g., dart format, prettier, gofmt)
- **Config:** {{CONFIG_PATH}}
- **Run on save:** {{YES_NO}}

**Linter:** {{LINTER}} (e.g., flutter_lints, eslint, golangci-lint)
- **Config:** {{CONFIG_PATH}}
- **Strict mode:** {{YES_NO}}

---

## Language Conventions

### Functions

- {{CONVENTION}}
- {{CONVENTION}}

### Error Handling

- {{CONVENTION}}
- {{CONVENTION}}

### Async/Concurrency

- {{CONVENTION}}
- {{CONVENTION}}

### Naming

| Context | Pattern | Example |
|---------|---------|---------|
| {{CONTEXT}} | {{PATTERN}} | {{EXAMPLE}} |
| {{CONTEXT}} | {{PATTERN}} | {{EXAMPLE}} |

---

## Testing Standards

- **Framework:** {{TEST_FRAMEWORK}}
- **Coverage requirement:** {{MINIMUM_COVERAGE}}%
- **Test location:** {{TEST_DIR_PATTERN}}
- **Naming:** {{TEST_NAMING_CONVENTION}}

### Test Structure

```
{{TEST_STRUCTURE_EXAMPLE}}
```

---

## Git Conventions

**Branch naming:** {{BRANCH_PATTERN}} (e.g., feature/*, fix/*, chore/*)

**Commit message format:**
```
{{COMMIT_TYPE}}: {{SHORT_DESCRIPTION}}

{{OPTIONAL_BODY}}

{{OPTIONAL_FOOTER}}
```

| Type | Use case |
|------|----------|
| feat | New feature |
| fix | Bug fix |
| docs | Documentation |
| refactor | Code restructure |
| test | Tests only |
| chore | Build/tooling |

---

## Code Review Checklist

- [ ] {{CHECKLIST_ITEM}}
- [ ] {{CHECKLIST_ITEM}}
- [ ] {{CHECKLIST_ITEM}}

---

## Performance Expectations

- {{EXPECTATION}}
- {{EXPECTATION}}

---

## Security Guidelines

- {{GUIDELINE}}
- {{GUIDELINE}}
