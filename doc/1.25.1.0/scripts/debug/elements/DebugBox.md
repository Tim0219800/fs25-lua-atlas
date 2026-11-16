# debug/elements/DebugBox.lua

*[Version française](../../../fr/scripts/debug/elements/DebugBox.md)*

Source: `dataS/scripts/debug/elements/DebugBox.lua` — FS25 1.25.1.0

✍ DebugBox is a debug element for a wireframe or face-filled box, derived from DebugElement. In this dump only two setters are present; position, orientation and drawing code, including `calculateCornerPositions`, are absent (UNVERIFIED).

- **DebugBox** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugBox:setSize(sizeX: number, sizeY: number, sizeZ: number) → DebugBox` | 479 | ✍ Updates the box size (nil arguments keep the current value) and recomputes the corner positions through `DebugBox.calculateCornerPositions`, which is not in this dump. Returns self. |
| `DebugBox:setDrawFaces(drawFaces: boolean) → DebugBox` | 498 | ✍ Sets whether the box faces are drawn in addition to its edges. Returns self. |
