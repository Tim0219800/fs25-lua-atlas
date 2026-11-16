# debug/elements/DebugCircle.lua

*[Version française](../../../fr/scripts/debug/elements/DebugCircle.md)*

Source: `dataS/scripts/debug/elements/DebugCircle.lua` — FS25 1.25.1.0

✍ DebugCircle is a debug element for a horizontal circle, derived from DebugElement. Only `draw` is present; the static renderer `DebugCircle.renderAtPosition` is absent from this dump (UNVERIFIED).

- **DebugCircle** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugCircle:draw()` | 32 | ✍ Forwards position, radius, colour, segment count, solid, filled, sector and text settings to `DebugCircle.renderAtPosition`; Y is passed as nil (ground alignment) when `alignToGround` is set. |
