# gui/hud/ChatDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/ChatDisplay.md)*

Source: `dataS/scripts/gui/hud/ChatDisplay.lua` — FS25 1.25.1.0

✍ HUD panel for the multiplayer chat history, derived from HUDDisplay. It owns a three-slice background (top, scalable middle, bottom) tinted with the HUD background colour, keeps a reference to the message list owned by the mission and tracks scroll position and auto-close time (10 s duration, up to 50 messages). Drawing code is not in this file.

- **ChatDisplay** inherits from `HUDDisplay` (l.24)

## Functions

| Function | Line | Description |
|---|---|---|
| `ChatDisplay.new() → table` | 29 | ✍ Constructor. Creates the background overlays from gui.chat_top/middle/bottom, an empty message reference, max 50 messages, scroll offset 0 and a 10 000 ms display duration. |
| `ChatDisplay:storeScaledValues()` | 57 | ✍ Computes position (left, bottom anchors with a 300 px offset), 300 px wide background slices and scaled text/title sizes, offsets and the maximum panel height from the current UI scale. |
| `ChatDisplay:scrollChatMessages(delta: integer)` | 181 | ✍ Adds a delta (in messages, positive or negative) to the scroll offset, clamped between 0 and the message count minus one. |
