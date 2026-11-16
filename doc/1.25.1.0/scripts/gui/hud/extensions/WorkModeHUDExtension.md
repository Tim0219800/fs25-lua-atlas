# gui/hud/extensions/WorkModeHUDExtension.lua

*[Version française](../../../../fr/scripts/gui/hud/extensions/WorkModeHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/WorkModeHUDExtension.lua` — FS25 1.25.1.0

✍ HUD extension panel for the vehicle info HUD: shows the selected work mode of an implement. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).

- **WorkModeHUDExtension** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WorkModeHUDExtension.new(vehicle: table, customMt: any)` | 16 | ✍ Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays and a separator line, keeps the vehicle reference and the localized work mode text, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.34)
