# debug/elements/DebugPath.lua

*[Version française](../../../fr/scripts/debug/elements/DebugPath.md)*

Source: `dataS/scripts/debug/elements/DebugPath.lua` — FS25 1.25.1.0

✍ DebugPath is a debug element that draws a polyline through a list of points, optionally at a forced height or aligned to the ground. It does its own clipping, and the rendering function `DebugPath.renderPath` is absent from this dump (UNVERIFIED).

- **DebugPath** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugPath.new(customMt: table?) → DebugPath` | 18 | ✍ Creates a path element with an empty point list, no ground alignment, solid drawing and no minimum point spacing. |
| `DebugPath:getShouldBeDrawn() → boolean` | 54 | ✍ Always returns true because the path applies its clip distance itself during rendering, bypassing the base class checks (visibility flag and GUI hiding). |
| `DebugPath:draw()` | 61 | ✍ Calls `DebugPath.renderPath` with the points, colour, ground alignment, forced Y, solid flag, clip distance and text. |
| `DebugPath:clear() → DebugPath` | 161 | ✍ Replaces the point list with an empty table. Returns self. |
| `DebugPath:setForcedY(forcedY: number) → DebugPath` | 171 | ✍ Sets a fixed world Y used to draw the path; pass nil to remove it. Returns self. |
