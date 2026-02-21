---
name: technical-docs
description: Write clear, accurate technical documentation. Use when documenting APIs, components, functions, systems, or when the user asks to write or improve docs.
---

## Choose Format by Audience

### API Reference
For developers calling a function or endpoint.
```
## functionName(param1, param2)

One-line summary.

**Parameters**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| param1 | string | yes | ... |

**Returns** `ReturnType` — description

**Example**
\`\`\`js
const result = functionName('value', { option: true })
\`\`\`

**Throws** `ErrorType` when condition.
```

### Component Docs
For developers using a UI component.
- Props table (name, type, default, description)
- Usage example with realistic data (not `foo`/`bar`)
- Variants and states shown
- Accessibility notes if relevant

### System Docs
For developers maintaining or onboarding to a system.
- Overview: what problem does this solve?
- Architecture diagram or description
- Setup/installation steps
- Key concepts and terminology
- Common operations
- Troubleshooting

## Always Include
- One-line summary at the top
- When to use (and when NOT to use)
- At least one realistic example
- Edge cases or gotchas

## Always Avoid
- Re-stating types already visible in code signatures
- Filler phrases: "This function is used to...", "In order to..."
- Documentation that just echoes the code without adding insight

## Change Log Practice
After major changes, create a short dated or numbered note documenting:
- What changed
- **Why** it changed (the reasoning, not the implementation)
This helps future contributors understand the history of decisions. Store alongside the code or in `docs/changes/`.
