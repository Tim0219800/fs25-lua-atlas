# gui/hud/extensions/YarderTowerHUDExtension.lua

*[Version française](../../../../fr/scripts/gui/hud/extensions/YarderTowerHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/YarderTowerHUDExtension.lua` — FS25 1.25.1.0

✍ HUD extension panel for the vehicle info HUD: shows the state of a yarder (cable crane) tower. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).

- **YarderTowerHUDExtension** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `YarderTowerHUDExtension.new(vehicle: table, customMt: any)` | 17 | ✍ Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays (three-part box) and the carriage, position, tree and yarder icons, keeps the vehicle reference and a title text combining "yarder" with the vehicle name, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.42)
