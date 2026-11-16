# debug/elements/DebugShapeOutline.lua

*[Version française](../../../fr/scripts/debug/elements/DebugShapeOutline.md)*

Source: `dataS/scripts/debug/elements/DebugShapeOutline.lua` — FS25 1.25.1.0

✍ DebugShapeOutline is a debug element that outlines the shape of a node, optionally recursing into children and skipping hidden ones. The static `DebugShapeOutline.render` is absent from this dump (UNVERIFIED).

- **DebugShapeOutline** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugShapeOutline:draw()` | 29 | ✍ Calls `DebugShapeOutline.render` with the node, the recursive flag and the exclude-hidden flag. |
