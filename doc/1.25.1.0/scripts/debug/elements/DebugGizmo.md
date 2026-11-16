# debug/elements/DebugGizmo.lua

*[Version française](../../../fr/scripts/debug/elements/DebugGizmo.md)*

Source: `dataS/scripts/debug/elements/DebugGizmo.lua` — FS25 1.25.1.0

✍ DebugGizmo is a debug element that draws an axis gizmo (position, direction, up) with optional text, derived from DebugElement. The static renderer `DebugGizmo.renderAtPosition` is absent from this dump (UNVERIFIED).

- **DebugGizmo** inherits from `DebugElement` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugGizmo:getShouldBeDrawn() → boolean` | 52 | ✍ Override that hides the gizmo when a GUI is visible (if hiding is on) or when it is beyond the clip distance of the camera, tested with `DebugUtil.isPositionInCameraRange`. Unlike the base class it ignores the visibility flag. |
| `DebugGizmo:draw()` | 66 | ✍ Forwards position, direction, up, text, solid, scale, text size, text colour and text offsets to `DebugGizmo.renderAtPosition`. |
