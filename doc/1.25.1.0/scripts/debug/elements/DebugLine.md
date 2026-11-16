# debug/elements/DebugLine.lua

*[Version française](../../../fr/scripts/debug/elements/DebugLine.md)*

Source: `dataS/scripts/debug/elements/DebugLine.lua` — FS25 1.25.1.0

✍ DebugLine is a debug element drawing a line between two world positions or between two nodes that are followed each frame, with optional start/end colours, text and terrain alignment. The static renderer `DebugLine.renderBetweenPositions` is absent from this dump (UNVERIFIED).

- **DebugLine** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugLine.new(customMt: table?) → DebugLine` | 18 | ✍ Creates a line element with default settings: not solid, no start/end colours, no ground alignment and no nodes. |
| `DebugLine:draw()` | 34 | ✍ If both nodes are set and still exist, refreshes the endpoints from their world positions, then calls `DebugLine.renderBetweenPositions` with the line settings. |
