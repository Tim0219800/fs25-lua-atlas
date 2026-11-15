# placeables/specializations/PlaceableDestructible.lua

Source: `dataS/scripts/placeables/specializations/PlaceableDestructible.lua` — FS25 1.25.1.0

- **PlaceableDestructible** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableDestructible.registerXMLPaths(schema: any, basePath: any)` | 20 |  |
| `PlaceableDestructible.registerSavegameXMLPaths(schema: any, basePath: any)` | 34 |  |
| `PlaceableDestructible.prerequisitesPresent(specializations: table) → boolean` | 42 |  |
| `PlaceableDestructible.registerFunctions(placeableType: any)` | 48 |  |
| `PlaceableDestructible.registerOverwrittenFunctions(placeableType: any)` | 60 |  |
| `PlaceableDestructible.registerEventListeners(placeableType: any)` | 66 |  |
| `PlaceableDestructible:onLoad(savegame: table)` | 75 |  |
| `PlaceableDestructible:onFinalizePlacement()` | 147 |  |
| `PlaceableDestructible:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 156 |  |
| `PlaceableDestructible:loadFromXMLFile(xmlFile: any, key: any)` | 166 |  |
| `PlaceableDestructible:onDestructibleTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any)` | 283 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `destruct` | 49 |
| registerFunction | `destructed` | 50 |
| registerFunction | `startRepairDestructible` | 51 |
| registerFunction | `getCanRepairDestructible` | 52 |
| registerFunction | `onDestructibleTriggerCallback` | 53 |
| registerFunction | `getCanBeDestructedByTwister` | 54 |
| registerFunction | `startedRepairDestructible` | 55 |
| registerOverwrittenFunction | `finalizeConstruction` | 61 |
| registerEventListener | `onLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onFinalizePlacement` | 69 |
