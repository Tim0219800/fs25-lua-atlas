# gui/hud/GamePausedDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/GamePausedDisplay.md)*

Source: `dataS/scripts/gui/hud/GamePausedDisplay.lua` — FS25 1.25.1.0

✍ Full-width HUD banner showing a pause text over a dark strip at the screen centre, optionally over a splash background. Derived from HUDDisplay. The default text is the hard-coded German word for paused, changeable with setPauseText.

- **GamePausedDisplay** inherits from `HUDDisplay` (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `GamePausedDisplay.new() → table` | 28 | ✍ Constructor. Creates the splash background overlay and sets the default uppercase pause text. Note: it calls SideNotification:superClass().new instead of its own superclass, which looks like a copy-paste slip. |
| `GamePausedDisplay:storeScaledValues()` | 43 | ✍ Centres the banner on screen and computes its height (75 px scaled), text size and text offset. |
| `GamePausedDisplay:draw(drawBackground: any)` | 57 | ✍ When visible, optionally renders the background, then draws a translucent black strip across the screen and the bold centred pause text. |
| `GamePausedDisplay:setPauseText(text: any)` | 83 | ✍ Replaces the pause text, converted to uppercase. |
