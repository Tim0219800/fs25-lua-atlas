# gui/hud/AchievementMessage.lua

*[Version française](../../../fr/scripts/gui/hud/AchievementMessage.md)*

Source: `dataS/scripts/gui/hud/AchievementMessage.lua` — FS25 1.25.1.0

✍ HUD widget meant to show an achievement-unlocked banner, derived from HUDDisplay. The file only builds the state (pending message queue, header text from l10n message_achievementUnlocked, icon overlay, timers) and the scaled layout; showing and drawing logic is not in this file (UNVERIFIED where it lives).

- **AchievementMessage** inherits from `HUDDisplay` (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `AchievementMessage.new(customMt: any?) → any` | 30 | ✍ Constructor. Creates the display with an empty pending-message list, no current message, an uppercase header text and an empty icon overlay. The customMt argument is ignored (the class metatable is always used). |
| `AchievementMessage:storeScaledValues()` | 51 | ✍ Computes the banner layout from pixel values (600x100 box centred horizontally at the bottom HUD anchor, 90x90 icon, title and description text sizes, offsets and max description width) scaled to the current UI scale. |
