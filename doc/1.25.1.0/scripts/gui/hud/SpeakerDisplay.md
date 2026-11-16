# gui/hud/SpeakerDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/SpeakerDisplay.md)*

Source: `dataS/scripts/gui/hud/SpeakerDisplay.lua` — FS25 1.25.1.0

✍ Multiplayer HUD display (extends HUDDisplay) listing the users who are currently speaking in voice chat, shown at the top-right under the side notifications. A speaker stays listed for 500 time units after the last voice activity. It reads g_currentMission.userManager users and VoiceChatUtil. Client-side only.

- **SpeakerDisplay** inherits from `HUDDisplay` (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `SpeakerDisplay.new(customMt: any) → table` | 28 | ✍ Creates the display with three-part background overlays, talk and muted icons at half alpha, and an empty per-user speaking timer table. |
| `SpeakerDisplay:storeScaledValues()` | 59 | ✍ Anchors the display below the top-right anchor (offset -300 px) and converts the reference-pixel sizes of background parts, text, spacing and icons to screen units. |
| `SpeakerDisplay:draw()` | 98 | ✍ For each user, sets the speaking timer to 500 when voice activity is detected and the user is not blocked, then draws a rounded row with muted or talk icon and the upper-cased nickname while the timer entry exists. Returns early without users. Note: the timer is set here but never decreased in this file, so UNVERIFIED whether entries ever expire. |
