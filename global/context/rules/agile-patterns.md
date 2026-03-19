# Agile Patterns Reference

## Hierarchy

```
Epic/Feature
  └── Story
        └── Task
```

## Feature
A **Feature** is a major functional area that delivers value to users.

### Characteristics
- Large scope (weeks to complete)
- Multiple stories
- Cross-functional (frontend + backend)
- Business-valued

### Template
```
### Feature: [Name]
**Description**: 
**Business Value**: 
**Scope**: 
```

## Story
A **Story** is a user-facing functionality that can be completed in 1-3 days.

### Characteristics
- Independent
- Negotiable
- Valuable
- Estimable
- Small (Sprint-worthy)
- Testable

### Template
```
#### Story X.Y: [Title]
**As a** [user type]
**I want** [action]
**So that** [benefit]

**Acceptance Criteria**:
- [ ] Criterion 1
- [ ] Criterion 2

**Dependencies**: 
**Technical Notes**:
```

## Task
A **Task** is atomic technical work that can be completed in hours to 1 day.

### Characteristics
- Single responsibility
- Independently verifiable
- Technical in nature

### Template
```
##### Task X.Y.Z: [Title]
**Description**: 
**Technical Details**: 
**Files Affected**: 
**Estimated Effort**: 
```

## Estimation Guide

| Size | Effort | Description |
|------|--------|-------------|
| S    | 1-4 hrs | Simple, well-understood |
| M    | 1 day  | Standard implementation |
| L    | 2-3 days | Complex, some unknowns |
| XL   | 5+ days | Spike needed |

## Definition of Done
- [ ] Code written and reviewed
- [ ] Tests added and passing
- [ ] Documentation updated
- [ ] Deployed to staging
- [ ] Accepted by product owner
