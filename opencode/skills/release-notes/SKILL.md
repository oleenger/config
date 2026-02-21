---
name: release-notes
description: Generate changelogs and release notes from git history. Use when preparing a release, tagging a version, or writing a CHANGELOG entry.
---

## Workflow

1. Find the previous release tag: `git tag --sort=-v:refname | head -5`
2. Get commits since last tag: `git log --oneline <prev-tag>...HEAD`
3. Group commits by type and write user-facing descriptions

## Keep a Changelog Format

```markdown
## [1.2.0] - 2025-01-15

### Added
- New user authentication via OAuth 2.0
- Dark mode support across all pages

### Changed
- Dashboard now loads 3x faster
- API rate limits increased to 1000 req/min

### Deprecated
- `/api/v1/users` endpoint — use `/api/v2/users` instead

### Removed
- Legacy XML export format

### Fixed
- Email notifications not sending for users in EU region
- Incorrect totals shown on invoices with discounts

### Security
- Patched XSS vulnerability in comment rendering (CVE-2025-XXXX)
```

## Writing Style
- Lead with **user impact**, not implementation: "Emails now send reliably" not "Fixed null pointer in MailService"
- Use present tense: "Adds", "Fixes", "Removes"
- Be specific: mention what changed, not just that something changed
- Group related items — don't list every commit

## What to Skip
- Pure refactors with no user-visible effect
- Test additions
- Dependency updates (unless security-related)
- CI/tooling changes

## Version Header Convention
Follow [Semantic Versioning](https://semver.org/):
- `MAJOR` — breaking changes
- `MINOR` — new features, backwards compatible
- `PATCH` — bug fixes, backwards compatible

Link versions to diffs: `[1.2.0]: https://github.com/org/repo/compare/v1.1.0...v1.2.0`
