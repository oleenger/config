---
name: color-palette
description: Generate harmonious, production-ready color palettes with usage guidelines. Use when designing a color scheme, picking UI colors, or the user asks for palette suggestions.
---

## Output Format

### Palette Name
Brief rationale for the palette direction.

### Primary (5 shades)
| Token | Hex | CSS Variable |
|-------|-----|--------------|
| primary-100 | #... | `--color-primary-100` |
| primary-300 | #... | `--color-primary-300` |
| primary-500 | #... | `--color-primary-500` |
| primary-700 | #... | `--color-primary-700` |
| primary-900 | #... | `--color-primary-900` |

### Neutral (6 shades)
Grays or warm/cool tinted neutrals — avoid pure #000/#fff.

### Accent (1–2 colors)
Complementary or analogous to primary.

### Semantic Colors
| Purpose | Hex | Usage |
|---------|-----|-------|
| success | #... | confirmations, valid states |
| warning | #... | caution, pending states |
| error | #... | destructive, invalid |
| info | #... | informational, neutral notice |

## Accessibility
- Check contrast ratios: body text needs **4.5:1** (WCAG AA), large text **3:1**
- Ensure interactive states (focus rings, hover) meet contrast requirements
- Never rely on color alone to convey meaning

## Usage Guidelines
- **Backgrounds:** use lightest neutrals (100–200)
- **Text:** use darkest neutrals (800–900) on light, lightest on dark
- **Borders:** mid-range neutrals (300–400)
- **Interactive states:** primary-500 default, primary-700 hover, primary-300 disabled
- **Destructive actions:** error color family

## CSS Custom Properties Template
```css
:root {
  --color-primary-500: #...;
  --color-neutral-100: #...;
  /* ... */
}
```
