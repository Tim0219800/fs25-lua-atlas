# gui/hud/extensions/CruiseControlHUDExtension.lua

*[Version française](../../../../fr/scripts/gui/hud/extensions/CruiseControlHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/CruiseControlHUDExtension.lua` — FS25 1.25.1.0

✍ HUD extension panel for the vehicle info HUD: shows the cruise control controls. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).

- **CruiseControlHUDExtension** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `CruiseControlHUDExtension.new(vehicle: table, customMt: any)` | 16 | ✍ Builds the extension for the given vehicle with priority GS_PRIO_VERY_LOW: creates the background overlays and a separator line, keeps the vehicle reference and the uppercase "change speed" text (toggle/change input elements start as nil), calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.37)
