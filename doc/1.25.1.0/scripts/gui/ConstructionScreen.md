# gui/ConstructionScreen.lua

Source: `dataS/scripts/gui/ConstructionScreen.lua` — FS25 1.25.1.0

- **ConstructionScreen** inherits from `ScreenElement` (l.16)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ConstructionScreen.new(target: table, custom_mt: table) → ConstructionScreen` | 36 |  |
| `ConstructionScreen:onOpen()` | 123 |  |
| `ConstructionScreen:onClose(element: table)` | 191 |  |
| `ConstructionScreen:registerBrushActionEvents()` | 556 |  |
| `ConstructionScreen:removeBrushActionEvents()` | 705 |  |
| `ConstructionScreen:buildCellDatabase()` | 2048 |  |
| `ConstructionScreen:dequeueDetailsCell(name: string) → table` | 2064 |  |
| `ConstructionScreen:queueDetailsCell(cell: table)` | 2087 |  |

## Messages

- subscribes `MessageType.INPUT_MODE_CHANGED` (l.158)
- subscribes `MessageType.SLOT_USAGE_CHANGED` (l.173)
- subscribes `MessageType.APP_WINDOW_FOCUS_CHANGED` (l.177)
