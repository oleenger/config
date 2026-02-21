---
name: code-review
description: Perform thorough, structured code reviews. Use when reviewing a PR, diff, file, or when the user asks to review code.
---

## Review Order

Work through these in sequence — stop and flag blockers before proceeding.

### 1. Correctness
- Does the code do what it claims?
- Edge cases: empty input, zero, null, large values, concurrent access
- Error handling: are errors caught, propagated, or swallowed silently?
- Off-by-one errors, boundary conditions

### 2. Security
- Injection: SQL, command, template, XSS
- Authentication and authorization checks present?
- Sensitive data logged or exposed?
- Dependencies with known vulnerabilities?

### 3. Performance
- N+1 query patterns
- Unnecessary re-renders or recomputations
- Memory leaks (event listeners, subscriptions, closures)
- Blocking operations on hot paths

### 4. Readability
- Naming: do names reveal intent?
- Function length and complexity (high cyclomatic complexity = risk)
- Comments explain *why*, not *what*
- Dead code or commented-out blocks

### 5. Tests
- Coverage of new logic
- Tests verify behavior, not implementation
- Edge cases covered in tests

## Feedback Format

For each issue:
```
[severity] file:line
Issue: what's wrong
Suggestion: how to fix it
```

**Severity levels:**
- `critical` — must fix before merge (incorrect behavior, security hole)
- `major` — should fix (significant risk or quality issue)
- `minor` — consider fixing (style, mild inefficiency)
- `nit` — optional (preference, micro-optimization)

End with a brief summary: overall quality, biggest risks, recommended action.
