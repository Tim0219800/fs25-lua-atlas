# debug/elements/DebugCylinder.lua

*[Version française](../../../fr/scripts/debug/elements/DebugCylinder.md)*

Source: `dataS/scripts/debug/elements/DebugCylinder.lua` — FS25 1.25.1.0

✍ DebugCylinder is a debug element for a cylinder, derived from DebugElement. Only `draw` is present; `DebugCylinder.renderAtPosition` is absent from this dump (UNVERIFIED).

- **DebugCylinder** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugCylinder:draw()` | 37 | ✍ Forwards position, radius, height, axis, colour, segment count, solid, ground alignment and text to `DebugCylinder.renderAtPosition`. |
