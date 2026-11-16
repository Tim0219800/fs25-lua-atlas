# gui/hud/InfoDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/InfoDisplay.md)*

Source: `dataS/scripts/gui/hud/InfoDisplay.lua` — FS25 1.25.1.0

✍ Base class of the HUD info panels anchored at the bottom right of the screen (extends HUDDisplay). It holds a list of boxes (InfoDisplayBox) and forwards scale changes to them. The boxes list, totalHeight and isEnabled are filled by subclasses or other code, not here (UNVERIFIED).

- **InfoDisplay** inherits from `HUDDisplay` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `InfoDisplay:setScale(uiScale: number)` | 30 | ✍ Applies the UI scale through the parent class, then calls setScale on every box in self.boxes. |
| `InfoDisplay:storeScaledValues()` | 40 | ✍ Anchors the display at the HUD's right/bottom anchor and caches a 5 pixel vertical margin between boxes in screen units. |
| `InfoDisplay:getDisplayHeight()` | 92 | ✍ Returns the stored total height when the display is enabled, otherwise 0. |
