# gui/hud/extensions/BaleCounterHUDExtension.lua

*[Version française](../../../../fr/scripts/gui/hud/extensions/BaleCounterHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/BaleCounterHUDExtension.lua` — FS25 1.25.1.0

✍ HUD extension panel for the vehicle info HUD: shows the session and lifetime bale counters. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).

- **BaleCounterHUDExtension** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleCounterHUDExtension.new(vehicle: table, customMt: any)` | 18 | ✍ Builds the extension for the given vehicle with priority GS_PRIO_NORMAL: creates the background overlays and the session/lifetime icons, keeps the vehicle reference and the uppercase localized title, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.39)
