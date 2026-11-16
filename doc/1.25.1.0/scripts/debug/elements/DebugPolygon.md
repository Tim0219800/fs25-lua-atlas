# debug/elements/DebugPolygon.lua

*[Version française](../../../fr/scripts/debug/elements/DebugPolygon.md)*

Source: `dataS/scripts/debug/elements/DebugPolygon.lua` — FS25 1.25.1.0

✍ DebugPolygon is a debug element drawing a polygon from a flat list of vertex coordinates, with optional contour lines. It wraps the engine function `drawDebugPolygon` (behaviour UNVERIFIED, engine side).

- **DebugPolygon** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugPolygon:draw()` | 29 | ✍ Calls `DebugPolygon.renderWithPositions` with the stored positions, colour, solid flag and contour option. |
| `DebugPolygon.renderWithPositions(positions: array, color: table?, solid: boolean?, drawContour: any)` | 38 | ✍ Draws a polygon from vertices given as x1,y1,z1,x2,y2,z2,... (default white) with `drawDebugPolygon`; if `drawContour` is set it also draws the edges including the closing edge back to the first vertex. |
