---
name: refactor
description: Safely refactor code with minimal risk. Use when improving code structure, reducing complexity, or eliminating duplication without changing behavior.
---

## Principles
- One change at a time — don't restructure and rename in the same commit
- Tests before refactoring — if no tests exist, write characterization tests first
- Commit at each safe point — small, reversible steps
- Behavior must not change — refactoring is not the time to fix bugs

## Common Code Smells
- **Duplication** — identical or near-identical blocks
- **Long method** — does too many things, extract sub-functions
- **God class** — knows too much, split responsibilities
- **Deep nesting** — flatten with early returns or extracted functions
- **Feature envy** — method uses another class's data more than its own
- **Magic numbers/strings** — replace with named constants

## Refactoring Patterns

### Extract Method
Move a block into a named function — improves readability and testability.

### Inline Variable
Replace a variable used once with its expression when it adds no clarity.

### Replace Conditional with Polymorphism
When switching on type, use a strategy or polymorphic dispatch instead.

### Move Function
If a function uses data from another module more than its own, move it.

### Introduce Parameter Object
Replace a long parameter list with a structured object.

## Workflow
1. Identify the smell and choose one transformation
2. Verify test coverage exists for affected code
3. Apply the transformation
4. Run tests — all must pass before continuing
5. Commit with message like `refactor(scope): extract validateUser method`
6. Repeat for next smell

## Verification
After each major refactor:
- Restart the service/process
- Test all routes or entry points manually
- Don't rely on static analysis alone — runtime behavior can differ
