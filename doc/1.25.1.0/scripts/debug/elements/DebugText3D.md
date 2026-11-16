# debug/elements/DebugText3D.lua

*[Version française](../../../fr/scripts/debug/elements/DebugText3D.md)*

Source: `dataS/scripts/debug/elements/DebugText3D.lua` — FS25 1.25.1.0

✍ DebugText3D is a debug element drawing text as a 3D object in the world with a given rotation (via the engine `renderText3D`), centred by default. Unlike DebugText it has no shadow and is not projected to the screen.

- **DebugText3D** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugText3D.new(customMt: table?) → DebugText3D` | 18 | ✍ Creates a 3D text element with centre alignment, middle vertical alignment and size 0.1. |
| `DebugText3D:draw()` | 30 | ✍ Renders the text at the stored position and rotation with the element's colour, size and alignments. |
| `DebugText3D.renderAtPosition(x: number, y: number, z: number, rx: number, ry: number, rz: number, text: string, color: table?, size: number?, alignment: integer?, verticalAlignment: integer?)` | 47 | ✍ Draws text in 3D at a world position with Euler rotation (default white, centred), then resets alignment and colour. Note: the doc comment mentions terrain alignment with nil Y, but the code does not implement it. |
| `DebugText3D.renderAtNode(node: integer, text: string, color: table?, size: number?, alignment: integer?, verticalAlignment: integer?)` | 69 | ✍ Draws 3D text at a node's world position using the node's world rotation. |
