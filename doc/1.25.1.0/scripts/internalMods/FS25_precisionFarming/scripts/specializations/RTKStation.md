# internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.lua` — FS25 1.25.1.0

✍ Placeable specialization for RTK base stations of Precision Farming. It has no XML paths or functions of its own and only registers and unregisters the placeable with the precision farming AI extension when placed or deleted.

- **RTKStation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `RTKStation.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no prerequisite specialization is needed. |
| `RTKStation.registerFunctions(placeableType: any)` | 23 | ✍ Empty: the specialization adds no new placeable functions. |
| `RTKStation.registerOverwrittenFunctions(placeableType: any)` | 28 | ✍ Empty: no placeable function is overwritten. |
| `RTKStation.registerEventListeners(placeableType: any)` | 33 | ✍ Subscribes the placeable type to onFinalizePlacement and onDelete. |
| `RTKStation.registerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Empty: no XML keys are registered. |
| `RTKStation:onFinalizePlacement(savegame: any)` | 45 | ✍ Registers this station with g_precisionFarming.aiExtension via registerRTKStation, if the precision farming object exists. What the extension does with it is UNVERIFIED here. |
| `RTKStation:onDelete()` | 53 | ✍ Unregisters this station from g_precisionFarming.aiExtension when the placeable is deleted, if precision farming exists. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onFinalizePlacement` | 34 |
| registerEventListener | `onDelete` | 35 |
