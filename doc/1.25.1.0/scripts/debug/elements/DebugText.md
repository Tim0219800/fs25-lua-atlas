# debug/elements/DebugText.lua

*[Version française](../../../fr/scripts/debug/elements/DebugText.md)*

Source: `dataS/scripts/debug/elements/DebugText.lua` — FS25 1.25.1.0

✍ DebugText is a debug element drawing 2D screen text at the projected position of a world point or node, with a black drop shadow, centred by default. Static helpers can be used without creating an element.

- **DebugText** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugText.new(customMt: table?) → DebugText` | 18 | ✍ Creates a text element with centre alignment, middle vertical alignment, size 0.1, no screen offset and no node. |
| `DebugText:draw()` | 33 | ✍ If a node is set and exists, updates the position from it, then renders the text at that projected world position. |
| `DebugText.renderAtPosition(x: number, y: number, z: number, text: string, color: table?, size: number?, screenSpaceYOffset: number?, alignment: integer?, verticalAlignment: integer?)` | 52 | ✍ Projects a world position to the screen and draws text there; a nil Y places it 0.01 m above the terrain, and nothing is drawn if the point is behind the far plane (z > 1) or no terrain exists. |
| `DebugText.renderAtScreenPosition(x: number, y: number, text: string, color: table?, size: number?, yOffset: number?, alignment: integer?, verticalAlignment: integer?)` | 80 | ✍ Draws text at normalised screen coordinates (default size 0.02) with a black shadow, after bounds checks, then resets text alignment and colour. Returns the Y for a following line, or nothing if clipped. |
| `DebugText.renderAtNode(node: integer, text: string, color: table?, size: number?, alignment: integer?, verticalAlignment: integer?)` | 124 | ✍ Draws text at the screen projection of a node's world position, with zero extra Y offset. |
