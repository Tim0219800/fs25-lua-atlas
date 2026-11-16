# internalMods/FS25_precisionFarming/scripts/hud/ExtendedSowingMachineHUDExtension.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSowingMachineHUDExtension.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSowingMachineHUDExtension.lua` — FS25 1.25.1.0

✍ HUD box shown in the vehicle input help for sowing machines with the Precision Farming ExtendedSowingMachine specialization. It displays the current seed rate with three dots (colored from the seed rate map), the auto mode label or the recommendation markers in manual mode, and the tramline working width. Created per vehicle with normal priority (GS_PRIO_NORMAL).

- **ExtendedSowingMachineHUDExtension** (l.22)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedSowingMachineHUDExtension.new(vehicle: table, customMt: any)` | 27 | ✍ Constructor taking the vehicle: grabs the ExtendedSowingMachine spec and g_precisionFarming.seedRateMap, creates overlays (backgrounds, three dot sets, seeds icon, recommendation bar), loads the texts, and subscribes to colorblind and UI scale changes. Note: it subscribes self.storeScaledValues to the UI_SCALE setting and calls it, but that method is not defined in this file (UNVERIFIED where it comes from). |
| `ExtendedSowingMachineHUDExtension:delete()` | 84 | ✍ Deletes all dot, background, separator, seeds and recommendation overlays, unsubscribes from the message center and clears the references. |
| `ExtendedSowingMachineHUDExtension:setColorBlindMode(isActive: any)` | 157 | ✍ Stores the new colorblind flag when it changes; it selects which dot colors are used when drawing. Note: the source doc comment says it determines whether the extension is drawn, which does not match what the code does. |
| `ExtendedSowingMachineHUDExtension:getHeight() → number` | 166 | ✍ Returns the height of this HUD box in screen space (0 until it has been computed). |
| `ExtendedSowingMachineHUDExtension:draw(inputHelpDisplay: any, posX: any, posY: any)` | 183 | ✍ Draws the seed rate section (rate text, three dots, auto label or manual recommendation markers, seeds icon; "not available" for unsupported fruit types) and the tramline width line. Returns the Y below the box, or posY unchanged without the spec. Note: the source doc comment mentions a mixing wagon, which looks like a copy-paste leftover. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.74)
- subscribes `MessageType.SETTING_CHANGED` (l.75)
