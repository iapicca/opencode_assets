---
name: "Architecture"
about: "High-level design, data flow, and key patterns"
---

## System Overview

```
{{SYSTEM_diagram_as_text}}

Legend:
  [{{COMPONENT}}] - {{DESCRIPTION}}
  -->            - Data flow
  ---            - Authentication/permission boundary
```

---

## Architecture Pattern

- **Pattern:** {{PATTERN}} (e.g., Clean Architecture, MVC, microservices, event-driven)
- **Rationale:** {{WHY_THIS_PATTERN}}

### Layer Responsibilities

| Layer | Responsibility | Example Components |
|-------|---------------|-------------------|
| {{LAYER}} | {{RESPONSIBILITY}} | {{COMPONENTS}} |
| {{LAYER}} | {{RESPONSIBILITY}} | {{COMPONENTS}} |
| {{LAYER}} | {{RESPONSIBILITY}} | {{COMPONENTS}} |

---

## Data Flow

### Request/Response Flow

```
{{REQUEST_FLOW}}

Steps:
1. {{STEP}}
2. {{STEP}}
3. {{STEP}}
```

### Data Persistence

| Entity | Storage | Access Pattern |
|--------|---------|----------------|
| {{ENTITY}} | {{STORAGE}} | {{PATTERN}} |
| {{ENTITY}} | {{STORAGE}} | {{PATTERN}} |

---

## Key Design Decisions

### ADRs (Architecture Decision Records)

| ADR | Decision | Status |
|-----|----------|--------|
| {{NUMBER}} | {{DECISION}} | {{PROPOSED/ACCEPTED}} |
| {{NUMBER}} | {{DECISION}} | {{PROPOSED/ACCEPTED}} |

### Decision {{NUMBER}}: {{TITLE}}

- **Context:** {{CONTEXT}}
- **Decision:** {{DECISION}}
- **Consequences:** {{CONSEQUENCES}}

---

## Patterns & Conventions

| Pattern | Use case | Implementation |
|---------|----------|----------------|
| {{PATTERN}} | {{USE_CASE}} | {{IMPLEMENTATION}} |
| {{PATTERN}} | {{USE_CASE}} | {{IMPLEMENTATION}} |

---

## Error Handling Strategy

- **Propagation:** {{STRATEGY}}
- **Logging:** {{STRATEGY}}
- **User feedback:** {{STRATEGY}}

---

## Security Architecture

| Concern | Implementation |
|---------|----------------|
| {{CONCERN}} | {{IMPLEMENTATION}} |
| {{CONCERN}} | {{IMPLEMENTATION}} |

---

## Scalability Considerations

- {{CONSIDERATION}}
- {{CONSIDERATION}}
