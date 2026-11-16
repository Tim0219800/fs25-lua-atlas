# gui/hud/TopNotification.lua

*[Version française](../../../fr/scripts/gui/hud/TopNotification.md)*

Source: `dataS/scripts/gui/hud/TopNotification.lua` — FS25 1.25.1.0

✍ HUD element (HUDDisplay subclass) showing a framed notification at the top centre of the screen with a title, text, info line and optional icon. Only one notification is held at a time; a new one replaces the current one. Rendering code is not defined in this file apart from the setters shown.

- **TopNotification** inherits from `HUDDisplay` (l.25)

## Functions

| Function | Line | Description |
|---|---|---|
| `TopNotification.new()` | 29 | ✍ Creates the display with an empty, invalid current notification and the left/middle/right background overlays tinted with the HUD background colour. Also prepares an icon cache. |
| `TopNotification:storeScaledValues()` | 59 | ✍ Recomputes scaled sizes, offsets and the anchor position (screen centre, top anchor) for the current UI scale. |
| `TopNotification:setNotification(title: string, text: string, info: string, iconFilename: string?, duration: integer?)` | 156 | ✍ Replaces the current notification: title and text are converted to uppercase, the icon is loaded once per filename and cached, and the duration defaults to TopNotification.DEFAULT_DURATION when nil. Marks the notification valid. |
