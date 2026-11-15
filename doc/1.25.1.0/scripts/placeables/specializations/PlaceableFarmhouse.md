# placeables/specializations/PlaceableFarmhouse.lua

Source: `dataS/scripts/placeables/specializations/PlaceableFarmhouse.lua` — FS25 1.25.1.0

- **PlaceableFarmhouse** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableFarmhouse.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `PlaceableFarmhouse.registerFunctions(placeableType: table)` | 26 |  |
| `PlaceableFarmhouse.registerOverwrittenFunctions(placeableType: table)` | 37 |  |
| `PlaceableFarmhouse.registerEventListeners(placeableType: table)` | 44 |  |
| `PlaceableFarmhouse.registerXMLPaths(schema: XMLSchema, basePath: string)` | 54 |  |
| `PlaceableFarmhouse.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 68 |  |
| `PlaceableFarmhouse:onLoad(savegame: table)` | 77 |  |
| `PlaceableFarmhouse:loadFromXMLFile(xmlFile: XMLFile, key: string)` | 116 |  |
| `PlaceableFarmhouse:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 129 |  |
| `PlaceableFarmhouse:onFinalizePlacement()` | 135 |  |
| `PlaceableFarmhouse:onDelete()` | 158 |  |
| `PlaceableFarmhouse:getSpawnPoint() → integer?` | 177 |  |
| `PlaceableFarmhouse:getSpawnWorldPosition()` | 189 |  |
| `PlaceableFarmhouse:getSleepCamera() → integer?` | 202 |  |
| `PlaceableFarmhouse:farmhouseSleepingTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 233 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `farmhouseSleepingTriggerCallback` | 27 |
| registerFunction | `getSleepCamera` | 28 |
| registerFunction | `getSpawnWorldPosition` | 29 |
| registerFunction | `getSpawnPoint` | 30 |
| registerFunction | `getIsAllowedToSleep` | 31 |
| registerOverwrittenFunction | `finalizeConstruction` | 38 |
| registerEventListener | `onLoad` | 45 |
| registerEventListener | `onDelete` | 46 |
| registerEventListener | `onFinalizePlacement` | 47 |
