# gui/hud/InfoDisplayBox.lua

*[Version française](../../../fr/scripts/gui/hud/InfoDisplayBox.md)*

Source: `dataS/scripts/gui/hud/InfoDisplayBox.lua` — FS25 1.25.1.0

✍ Abstract base for one box inside an InfoDisplay. It stores the owning InfoDisplay and UI scale and defines no-op hooks (delete, storeScaledValues) plus default canDraw and draw that subclasses such as InfoDisplayKeyValueBox override. Client-side only.

- **InfoDisplayBox** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `InfoDisplayBox.new(infoDisplay: any, uiScale: any, customMt: any)` | 16 | ✍ Creates a box referencing its info display and UI scale; an optional metatable lets subclasses extend it. |
| `InfoDisplayBox:delete()` | 27 | ✍ Empty hook for subclasses to release resources. |
| `InfoDisplayBox:setScale(uiScale: any)` | 32 | ✍ Stores the new UI scale and recomputes scaled values by calling storeScaledValues. |
| `InfoDisplayBox:storeScaledValues()` | 39 | ✍ Empty hook, overridden by subclasses to cache scaled sizes. |
| `InfoDisplayBox:canDraw()` | 44 | ✍ Returns true by default; subclasses return whether the box has something to show. |
| `InfoDisplayBox:draw(posX: any, posY: any)` | 50 | ✍ Default draw that renders nothing and returns the position unchanged; subclasses return the next free position. |
