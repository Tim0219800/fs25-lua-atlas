# internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.lua` — FS25 1.25.1.0

✍ HUD box shown in the vehicle input help for sprayers and spreaders with the Precision Farming ExtendedSprayer specialization. Depending on the loaded fill type it shows a pH gradient (lime) or a nitrogen gradient, with current, target and planned values, the application rate, the soil type and an explanatory text. Reads the soil, pH and nitrogen maps of g_precisionFarming. Created per vehicle with low priority (GS_PRIO_LOW).

- **ExtendedSprayerHUDExtension** (l.22)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedSprayerHUDExtension.new(vehicle: table, customMt: any)` | 27 | ✍ Constructor taking the vehicle: grabs the ExtendedSprayer spec and the soil, pH and nitrogen maps, creates gradient, bar, flag and background overlays, loads the many HUD texts, and subscribes to colorblind and UI scale changes. Note: it subscribes self.storeScaledValues to the UI_SCALE setting and calls it, but that method is not defined in this file (UNVERIFIED where it comes from). |
| `ExtendedSprayerHUDExtension:delete()` | 116 | ✍ Deletes all overlays, unsubscribes from the message center and clears the vehicle and spec references. |
| `ExtendedSprayerHUDExtension:setColorBlindMode(isActive: any)` | 193 | ✍ When the colorblind flag changes, stores it and asks the pH map and the nitrogen map to rebuild their minimap on next update. Note: the source doc comment says it determines whether the extension is drawn, which does not match what the code does. |
| `ExtendedSprayerHUDExtension:getHeight() → number` | 205 | ✍ Returns the box height: the base display height plus the extra height needed for the change line and description text. |
| `ExtendedSprayerHUDExtension:draw(inputHelpDisplay: any, posX: any, posY: any)` | 232 | ✍ Draws the box. With lime loaded it shows pH, otherwise nitrogen (solid, liquid, slurry or manure). Computes the application rate, actual, planned and target positions on the gradient, the soil type and a description, then the footer. Returns the Y below the box, or posY without the spec. Note: the source doc comment mentions a mixing wagon, which looks like a copy-paste leftover. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.106)
- subscribes `MessageType.SETTING_CHANGED` (l.107)
