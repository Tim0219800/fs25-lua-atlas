# debug/elements/DebugPlane.lua

*[Version française](../../../fr/scripts/debug/elements/DebugPlane.md)*

Source: `dataS/scripts/debug/elements/DebugPlane.lua` — FS25 1.25.1.0

✍ DebugPlane is a debug element drawing a quadrilateral from four corner positions, optionally terrain-aligned, filled, double-sided or solid. The renderer `DebugPlane.renderWithPositions` and `createWithPositions` are absent from this dump (UNVERIFIED).

- **DebugPlane** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugPlane:draw()` | 90 | ✍ Calls `DebugPlane.renderWithPositions` with the stored corner positions and display options (the explicit coordinate arguments are passed as nil). |
| `DebugPlane:createWithNodes(startNode: integer, widthNode: integer, heightNode: integer) → DebugPlane` | 179 | ✍ Builds the plane from the world positions of a start node and a width and a height node by delegating to `createWithPositions` (not in this dump). Returns self. |
| `DebugPlane:createWithNode(node: integer, sizeX: number, sizeZ: number) → DebugPlane` | 372 | ✍ Builds a horizontal rectangle of the given X and Z size centred on a node, storing its four corners in world space (computed once, not updated if the node moves). Returns self. |
