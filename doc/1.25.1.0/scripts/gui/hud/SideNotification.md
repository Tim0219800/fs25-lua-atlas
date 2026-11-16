# gui/hud/SideNotification.lua

*[Version française](../../../fr/scripts/gui/hud/SideNotification.md)*

Source: `dataS/scripts/gui/hud/SideNotification.lua` — FS25 1.25.1.0

✍ HUD display (extends HUDDisplay) at the top-right that stacks short colored notification lines, progress bars with title, text and percentage, and a rotating save-in-progress icon. The notification queue is drawn up to SideNotification.MAX_NOTIFICATIONS entries. Expiry and removal of notifications and the progress bar list are not handled in this file (UNVERIFIED). Client-side only.

- **SideNotification** inherits from `HUDDisplay` (l.27)

## Functions

| Function | Line | Description |
|---|---|---|
| `SideNotification.new(customMt: any?) → any` | 33 | ✍ Creates the display with an empty notification queue and progress bar list, background and progress overlays, a three-part progress bar, a saving icon and the localized ui_savegameSaveInProgress text. |
| `SideNotification:storeScaledValues()` | 83 | ✍ Anchors the display near the HUD top-right and converts the reference-pixel layout (background parts, text sizes, 400 wide progress panel, bar parts, icon size) to screen units. |
| `SideNotification:draw()` | 149 | ✍ Draws each visible progress bar (title, text, bar and percentage) and then clears its visible flag, so owners must re-flag it every frame. Then draws the save icon (spinning with g_currentDt) if saving, and the queued notifications. |
| `SideNotification:addNotification(text: string, color: table, displayDuration: integer)` | 303 | ✍ Appends a notification with text, an RGBA color and a display duration (milliseconds per the queue comment) to the queue. |
