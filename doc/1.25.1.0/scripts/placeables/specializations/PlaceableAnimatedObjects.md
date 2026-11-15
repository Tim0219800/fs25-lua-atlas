# placeables/specializations/PlaceableAnimatedObjects.lua

Source: `dataS/scripts/placeables/specializations/PlaceableAnimatedObjects.lua` — FS25 1.25.1.0

- **PlaceableAnimatedObjects** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableAnimatedObjects.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableAnimatedObjects.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableAnimatedObjects.registerOverwrittenFunctions(placeableType: any)` | 31 |  |
| `PlaceableAnimatedObjects.registerEventListeners(placeableType: any)` | 37 |  |
| `PlaceableAnimatedObjects.registerXMLPaths(schema: any, basePath: any)` | 47 |  |
| `PlaceableAnimatedObjects.registerSavegameXMLPaths(schema: any, basePath: any)` | 58 |  |
| `PlaceableAnimatedObjects:onLoad(savegame: table)` | 65 |  |
| `PlaceableAnimatedObjects:onDelete()` | 124 |  |
| `PlaceableAnimatedObjects:onPostFinalizePlacement()` | 137 |  |
| `PlaceableAnimatedObjects:onReadStream(streamId: any, connection: any)` | 148 |  |
| `PlaceableAnimatedObjects:onWriteStream(streamId: integer, connection: table)` | 163 |  |
| `PlaceableAnimatedObjects:loadFromXMLFile(xmlFile: any, key: any)` | 176 |  |
| `PlaceableAnimatedObjects:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 185 |  |
| `PlaceableAnimatedObjects:getAnimatedObjectBySaveId(saveId: string) → table?` | 207 |  |
| `PlaceableAnimatedObjects:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 219 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getCanTriggerAnimatedObject` | 25 |
| registerFunction | `getAnimatedObjectBySaveId` | 26 |
| registerOverwrittenFunction | `setOwnerFarmId` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onDelete` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
| registerEventListener | `onPostFinalizePlacement` | 42 |
