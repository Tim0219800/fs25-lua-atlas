# debug/elements/DebugPoint.lua

*[Version française](../../../fr/scripts/debug/elements/DebugPoint.md)*

Source: `dataS/scripts/debug/elements/DebugPoint.lua` — FS25 1.25.1.0

✍ DebugPoint is a debug element drawing a single point with optional text at a world position, derived from DebugElement. `DebugPoint.renderAtPosition` is absent from this dump (UNVERIFIED).

- **DebugPoint** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugPoint.new(customMt: table?) → DebugPoint` | 18 | ✍ Creates a point element, not solid, not ground-aligned and without text. |
| `DebugPoint:draw()` | 32 | ✍ Calls `DebugPoint.renderAtPosition` with position, colour, solid flag, text, text size and clip distances. |
