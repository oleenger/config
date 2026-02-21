---
name: git-pr
description: Generate pull request titles and structured descriptions from branch changes. Use when opening a PR, preparing a merge, or user asks for a PR description.
---

## PR Generation Workflow

1. Identify base branch (usually `main`)
2. Run `git log main...HEAD --oneline` to see commits
3. Run `git diff main...HEAD --stat` for file overview
4. Draft title and description

### Title Format
```
type: short summary of change
```
Examples: `feat: add user authentication`, `fix: resolve race condition in queue`

### Description Template
```markdown
## Summary
- What changed (bullet points, user-facing impact first)
- Why it was needed

## Test Plan
- [ ] Unit tests pass
- [ ] Manual test: [specific scenario]
- [ ] Edge case: [describe]

## Notes
- Breaking changes (if any)
- Screenshots (for UI changes)
- Dependencies on other PRs
```

### Branch Hygiene
- Feature branches should be cut from latest `main`
- Never push directly to `main` — always use feature branches
- Ensure `git pull origin main` before branching
- Squash or organize commits before merging if history is messy

### Using gh CLI
```bash
gh pr create --title "feat: ..." --body "$(cat <<'EOF'
## Summary
...
EOF
)"
```
