---
name: git-commit
description: Generate conventional commit messages following Conventional Commits spec. Use when writing a commit message, reviewing staged changes, or the user asks to commit.
---

## Conventional Commit Format

```
type(scope): description

[optional body]

[optional footer]
```

### Types
- `feat` — new feature
- `fix` — bug fix
- `docs` — documentation only
- `style` — formatting, no logic change
- `refactor` — restructure without behavior change
- `perf` — performance improvement
- `test` — add or fix tests
- `chore` — build, tooling, dependencies
- `ci` — CI/CD config changes

### Rules
- Subject line: 72 char max, imperative mood ("add" not "added")
- Scope: optional, noun describing section of codebase e.g. `feat(auth):`
- Body: explain **why**, not what — separate from subject with blank line
- Breaking changes: add `BREAKING CHANGE:` footer with description
- Never use past tense in the subject line

### Workflow
1. Run `git diff --staged` to inspect what's staged
2. Group changes by purpose — if mixed, suggest splitting commits
3. Draft message following format above
4. Present the full commit command for user to approve
