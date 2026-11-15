# placeables/specializations/PlaceableWardrobe.lua

Source: `dataS/scripts/placeables/specializations/PlaceableWardrobe.lua` — FS25 1.25.1.0

- **PlaceableWardrobe** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableWardrobe.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `PlaceableWardrobe.registerFunctions(placeableType: any)` | 25 |  |
| `PlaceableWardrobe.registerEventListeners(placeableType: any)` | 31 |  |
| `PlaceableWardrobe.registerXMLPaths(schema: any, basePath: any)` | 40 |  |
| `PlaceableWardrobe.registerSavegameXMLPaths(schema: any, basePath: any)` | 49 |  |
| `PlaceableWardrobe:onLoad(savegame: table)` | 58 |  |
| `PlaceableWardrobe:loadFromXMLFile(xmlFile: any, key: any)` | 77 |  |
| `PlaceableWardrobe:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 87 |  |
| `PlaceableWardrobe:onDelete()` | 93 |  |
| `PlaceableWardrobe:onReadStream(streamId: integer, connection: Connection)` | 108 |  |
| `PlaceableWardrobe:onWriteStream(streamId: integer, connection: Connection)` | 117 |  |
| `PlaceableWardrobe:wardrobeTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 124 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `wardrobeTriggerCallback` | 26 |
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onReadStream` | 34 |
| registerEventListener | `onWriteStream` | 35 |
