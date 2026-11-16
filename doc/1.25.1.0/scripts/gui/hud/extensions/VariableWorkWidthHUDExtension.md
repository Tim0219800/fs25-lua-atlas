# gui/hud/extensions/VariableWorkWidthHUDExtension.lua

*[Version française](../../../../fr/scripts/gui/hud/extensions/VariableWorkWidthHUDExtension.md)*

Source: `dataS/scripts/gui/hud/extensions/VariableWorkWidthHUDExtension.lua` — FS25 1.25.1.0

✍ HUD extension panel for the vehicle info HUD: shows the partial working width sections of a variable work width implement. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).

- **VariableWorkWidthHUDExtension** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `VariableWorkWidthHUDExtension.new(vehicle: table, customMt: any)` | 20 | ✍ Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays, a progress bar and a separator, keeps the vehicle and its variableWorkWidth spec, stores the section count and the uppercase title, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.45)
