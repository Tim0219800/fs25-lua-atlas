# gui/elements/SafeFrameElement.lua

*[Version française](../../../fr/scripts/gui/elements/SafeFrameElement.md)*

Source: `dataS/scripts/gui/elements/SafeFrameElement.lua` — FS25 1.25.1.0

✍ Minimal GUI element that fills the whole screen with opaque black. It is meant as a backdrop behind some screens so the game does not show through when the UI is shifted by safe-frame margins. It extends GuiElement and is named safeFrame.

- **SafeFrameElement** inherits from `GuiElement` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `SafeFrameElement.new(target: any, custom_mt: any)` | 19 | ✍ Constructor. Creates a GuiElement and sets its name to "safeFrame". |
| `SafeFrameElement:draw()` | 29 | ✍ Draws a black rectangle covering the whole normalized screen (0,0 to 1,1). It ignores clip bounds and does not draw children. |
