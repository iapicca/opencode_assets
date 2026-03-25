---
name: "Project Structure"
about: "Directory layout, modules, and file naming conventions"
---

## Directory Layout

```
{{ROOT_DIR}}/
├── {{MODULE_1}}/              # {{DESCRIPTION}}
│   ├── {{SUBMODULE}}/          # {{DESCRIPTION}}
│   └── {{FILE}}.ext            # {{DESCRIPTION}}
├── {{MODULE_2}}/              # {{DESCRIPTION}}
│   └── {{FILE}}.ext            # {{DESCRIPTION}}
└── {{CONFIG_DIR}}/             # Configuration files
    └── {{FILE}}.ext            # {{DESCRIPTION}}
```

---

## Module Organization

| Module | Purpose | Public API |
|--------|---------|------------|
| {{MODULE_NAME}} | {{PURPOSE}} | {{PUBLIC_API_LOCATION}} |
| {{MODULE_NAME}} | {{PURPOSE}} | {{PUBLIC_API_LOCATION}} |

---

## Key Files

| File | Purpose | Owner |
|------|---------|-------|
| {{FILE_PATH}} | {{PURPOSE}} | {{OWNER}} |
| {{FILE_PATH}} | {{PURPOSE}} | {{OWNER}} |

---

## Naming Conventions

| Entity | Convention | Example |
|--------|------------|---------|
| Files | {{PATTERN}} | {{EXAMPLE}} |
| Classes/Types | {{PATTERN}} | {{EXAMPLE}} |
| Functions | {{PATTERN}} | {{EXAMPLE}} |
| Variables | {{PATTERN}} | {{EXAMPLE}} |
| Constants | {{PATTERN}} | {{EXAMPLE}} |
| Tests | {{PATTERN}} | {{EXAMPLE}} |

---

## Module Dependencies

```
{{MODULE_A}}
  └── {{MODULE_B}} (imports)
  └── {{MODULE_C}} (imports)
        └── {{MODULE_D}} (imports)
```

---

## Generated Files

| Pattern | Location | Regenerate Command |
|---------|----------|-------------------|
| {{PATTERN}} | {{OUTPUT_DIR}} | `{{REGEN_COMMAND}}` |
| {{PATTERN}} | {{OUTPUT_DIR}} | `{{REGEN_COMMAND}}` |

---

## Asset Locations

| Type | Location | Access Method |
|------|----------|---------------|
| {{ASSET_TYPE}} | {{PATH}} | {{METHOD}} |
