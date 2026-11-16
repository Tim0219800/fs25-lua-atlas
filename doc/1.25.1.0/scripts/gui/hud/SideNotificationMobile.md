# gui/hud/SideNotificationMobile.lua

*[Version française](../../../fr/scripts/gui/hud/SideNotificationMobile.md)*

Source: `dataS/scripts/gui/hud/SideNotificationMobile.lua` — FS25 1.25.1.0

✍ Mobile variant of SideNotification (extends SideNotification) anchored to the top-right corner with its own background color, position and size constants. It only overrides construction and background helpers; applyValues is not defined in this file (UNVERIFIED).

- **SideNotificationMobile** inherits from `SideNotification` (l.26)

## Functions

| Function | Line | Description |
|---|---|---|
| `SideNotificationMobile.new() → table` | 31 | ✍ Creates the mobile notification display with UI scale 1 and its background color, then calls applyValues. |
| `SideNotificationMobile.getBackgroundPosition(uiScale: number)` | 111 | ✍ Returns the top-right corner position plus the configured offset scaled by uiScale. |
| `SideNotificationMobile:createBackground()` | 118 | ✍ Creates an image-less overlay at the top-right position with the configured size. Note: declared with a colon although it does not use self. |
