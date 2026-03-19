---
name: "<Feature Name>"
about: "Detailed specification for a new feature within a Feature/Story/Issue hierarchy."
title: "[FEATURE] <Feature Name>"
---

## Metadata
- **Target Component:** [e.g., Frontend, API, Database]
- **LLM Context Hint:** []
---

## Executive Summary
> Provide a concise 1-2 sentence overview of the feature. This acts as the "system prompt" context for an LLM.

**Goal:** [What problem are we solving?]
**Value Proposition:** [Why is this important for the user?]

---

## 👤 User Story
**Format:**
- **As a:** [User Persona]
- **I want to:** [Action]
- **So that:** [Value/Outcome]

---

## Functional Requirements
*List specific capabilities. Use bullet points for easy tokenization.*

- [ ] Requirement 1: [Description]
- [ ] Requirement 2: [Description]
- [ ] Requirement 3: [Description]

---

## Acceptance Criteria (AC)
*LLMs use this section to validate generated code or tests. Be specific.*

1. **AC 1:** [Given X, when Y, then Z]
2. **AC 2:** [Given A, when B, then C]
3. **AC 3:** [UI must match Figma design specs exactly]

---

## Technical Implementation Details
*Provide specific context for code generation.*

- **Existing Logic:** [Reference specific files or classes if known]
- **Data Model Changes:** [List new fields or tables needed]
- **Dependencies:** [New libraries or API endpoints required]

---

## Definition of Done (DoD)
- [ ] Unit tests written and passing
- [ ] Documentation updated in `/docs`
- [ ] Feature flag implemented (if applicable)
- [ ] Reviewed for performance/security

---


### **Related Stories:** 

- https://github.com/<project_owner_name>/<project_name>/issues/<issue_numbner> 
- https://github.com/<project_owner_name>/<project_name>/issues/<issue_numbner> 