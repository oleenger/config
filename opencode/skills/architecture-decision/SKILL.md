---
name: architecture-decision
description: Write Architecture Decision Records (ADRs). Use when documenting an architectural decision, technology choice, or design tradeoff.
---

## ADR Format

```markdown
# ADR-NNN: Use X for Y

**Status:** Proposed | Accepted | Deprecated | Superseded by ADR-NNN

**Date:** YYYY-MM-DD

## Context

What is the problem or opportunity? What constraints, forces, or requirements shaped this decision?
Be specific — include team size, performance requirements, existing stack, etc.

## Decision

What was decided? State it clearly in one or two sentences.

Then explain **why** this option over alternatives:
- Option A (chosen): pros/cons
- Option B: pros/cons
- Option C: pros/cons

## Consequences

**Positive:**
- What becomes easier or better?

**Negative:**
- What becomes harder? What do we give up?
- What new risks are introduced?

**Neutral:**
- What changes but isn't clearly better or worse?
```

## Guidelines
- Title uses imperative: "Use PostgreSQL for session storage" not "PostgreSQL"
- Status must be kept current — mark as Deprecated/Superseded when applicable
- Context captures the *moment in time* — what was true when the decision was made
- Consequences are honest — include the downsides
- Keep ADRs short: 1–2 pages max

## Storage Convention
Store in `docs/decisions/ADR-NNN-title.md` or `adr/NNN-title.md`.
Number sequentially. Never delete — only supersede.
