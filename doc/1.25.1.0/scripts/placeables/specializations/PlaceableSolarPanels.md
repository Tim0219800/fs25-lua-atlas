# placeables/specializations/PlaceableSolarPanels.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableSolarPanels.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableSolarPanels.lua` — FS25 1.25.1.0

✍ Placeable specialization that adds solar panels: an optional head node that slowly turns toward the sun, and a weather-dependent income bonus. It requires PlaceableIncomePerHour and registers a `solarPanels` configuration type. Settings come from `placeable.solarPanels.solarPanelsConfigurations.solarPanelsConfiguration(?)`.

- **PlaceableSolarPanels** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableSolarPanels.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true only if the placeable type includes the PlaceableIncomePerHour specialization. |
| `PlaceableSolarPanels.initSpecialization()` | 24 | ✍ Registers the `solarPanels` configuration type with the placeable configuration manager, using the localized label `configuration_solarPanel`. |
| `PlaceableSolarPanels.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Overrides `getIncomePerHour` and `getNeedHourChanged` on the placeable type. |
| `PlaceableSolarPanels.registerFunctions(placeableType: any)` | 37 | ✍ Registers the new placeable function `updateHeadRotation`. |
| `PlaceableSolarPanels.registerEventListeners(placeableType: any)` | 43 | ✍ Subscribes to onLoad, onFinalizePlacement, onReadStream, onWriteStream, onHourChanged and onUpdate. |
| `PlaceableSolarPanels.registerXMLPaths(schema: any, basePath: any)` | 54 | ✍ Declares the XML keys of a solar panel configuration: `#headNode`, `#randomHeadOffsetRange` (default 15 degrees), `#rotationSpeed` (default 5 deg/s), `#isActive` and `#incomePerHour`. |
| `PlaceableSolarPanels.registerSavegameXMLPaths(schema: any, basePath: any)` | 68 | ✍ Declares the savegame attribute `#headRotationRandom` used to store the random head offset. |
| `PlaceableSolarPanels:onLoad(savegame: any)` | 76 | ✍ Reads the selected solar configuration. With a head node it picks a random head offset (-range/2, 0 or +range/2) and sets the rotation speed; it also reads the income and whether panels exist. If there are none, it removes listeners; note that the removals target `Cover` instead of this class, so only onFinalizePlacement is really removed. |
| `PlaceableSolarPanels:onFinalizePlacement()` | 115 | ✍ Aligns the head with the sun once placement is final, by calling `updateHeadRotation`. |
| `PlaceableSolarPanels:loadFromXMLFile(xmlFile: any, key: any)` | 121 | ✍ Reads `#headRotationRandom` from the savegame. Note: the condition is inverted (it assigns only when the value is nil), so the saved offset is never restored. |
| `PlaceableSolarPanels:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 131 | ✍ Writes the random head rotation offset to the savegame when a head node exists. |
| `PlaceableSolarPanels:onReadStream(streamId: any, connection: any)` | 140 | ✍ Client side: reads the compressed random head angle sent by the server when a head node exists. |
| `PlaceableSolarPanels:onWriteStream(streamId: any, connection: any)` | 149 | ✍ Server side: writes the random head angle as a compressed angle for joining clients when a head node exists. |
| `PlaceableSolarPanels:onUpdate(dt: any)` | 158 | ✍ Moves the current head rotation toward the target at the configured speed (scaled by `dt`) and applies it with `setDirection` on the head node; keeps the placeable active until the target is reached. |
| `PlaceableSolarPanels:onHourChanged()` | 180 | ✍ Hourly callback that recomputes the head target rotation. |
| `PlaceableSolarPanels:updateHeadRotation()` | 186 | ✍ Computes the sun direction from the environment sun light and, when its X component exceeds 0.3 in absolute value, sets the head target angle (plus the random offset). Depends on `g_currentMission.environment`, UNVERIFIED (class absent from the dump). |
| `PlaceableSolarPanels:getIncomePerHour(superFunc: any)` | 206 | ✍ Adds the configured solar income to the base value: full when the sun is on, times 0.75 in winter, times 0.1 when raining. Weather values come from `Environment`/`Weather`, UNVERIFIED. |
| `PlaceableSolarPanels:getNeedHourChanged(superFunc: any)` | 234 | ✍ Returns whether solar panels exist, so the hourly callback is only required for placeables that have them. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getIncomePerHour` | 31 |
| registerOverwrittenFunction | `getNeedHourChanged` | 32 |
| registerFunction | `updateHeadRotation` | 38 |
| registerEventListener | `onLoad` | 44 |
| registerEventListener | `onFinalizePlacement` | 45 |
| registerEventListener | `onReadStream` | 46 |
| registerEventListener | `onWriteStream` | 47 |
| registerEventListener | `onHourChanged` | 48 |
| registerEventListener | `onUpdate` | 49 |
