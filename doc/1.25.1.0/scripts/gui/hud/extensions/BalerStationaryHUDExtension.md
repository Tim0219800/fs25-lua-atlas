# gui/hud/extensions/BalerStationaryHUDExtension.lua

*[Version française](../../../../fr/scripts/gui/hud/extensions/BalerStationaryHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/BalerStationaryHUDExtension.lua` — FS25 1.25.1.0

✍ HUD extension panel for the vehicle info HUD: shows the status of a stationary baler with bale wrapper. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).

- **BalerStationaryHUDExtension** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `BalerStationaryHUDExtension.new(vehicle: table, customMt: any)` | 18 | ✍ Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays (three-part box) and the baler, bale, grass and wrapped-bale icons, keeps the vehicle together with its baler and baleWrapper specs, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.42)
