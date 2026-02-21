---
name: frontend-design
description: Create distinctive, production-grade frontend interfaces with high design quality. Use when building web components, pages, applications, dashboards, or styling any web UI. Avoids generic AI aesthetics.
---

## Design Thinking Framework

Before writing any code, define:
1. **Purpose** — what does this UI need to accomplish?
2. **Tonal direction** — editorial, playful, corporate, minimal, expressive?
3. **Constraints** — framework, existing design system, target device?
4. **Differentiation** — what makes this feel non-generic?

## Typography
- Pick distinctive typefaces — avoid Inter/Roboto/System-UI as defaults
- Establish type scale: 3–5 sizes with clear hierarchy
- Consider variable fonts for expressiveness
- Mix weights intentionally — don't use only Regular and Bold

## Color
- Use CSS custom properties for the entire palette
- Commit to a defined palette before writing components
- Primary + neutral + 1–2 accents is usually enough
- Avoid purple gradients and blue CTAs unless intentional

## Composition
- Break the grid intentionally — asymmetry reads as designed, not default
- Use negative space as a design element
- Atmospheric effects (blur, grain, subtle gradients) add depth
- Avoid centering everything — consider left-aligned editorial layouts

## What to Avoid
- Overused typefaces (Inter, DM Sans by default)
- Purple/blue gradient hero sections
- Generic card grids with shadows
- "AI startup" aesthetic (glassmorphism + blue glow)
- Responsive-only thinking — design the ideal state first

## Output
- Write semantic HTML
- Use scoped CSS or CSS modules — avoid utility class soup for complex layouts
- Include hover/focus/active states
- Comment non-obvious layout decisions
