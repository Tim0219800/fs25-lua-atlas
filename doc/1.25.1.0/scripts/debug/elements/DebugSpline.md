# debug/elements/DebugSpline.lua

*[Version française](../../../fr/scripts/debug/elements/DebugSpline.md)*

Source: `dataS/scripts/debug/elements/DebugSpline.lua` — FS25 1.25.1.0

✍ DebugSpline is a debug element for visualising a spline node, with optional edit-point display and a text label near the closest camera position. `createWithNode` (used by DebugManager's spline debug command) and `DebugSpline.renderForNode` are absent from this dump (UNVERIFIED).

- **DebugSpline** inherits from `DebugElement` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugSpline:draw()` | 118 | ✍ Calls `DebugSpline.renderForNode` with the spline node, colour, text (or a default text), clip distances, the edit-point flag and cached closest-to-camera data. |
