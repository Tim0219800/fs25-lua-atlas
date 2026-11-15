# placeables/specializations/PlaceableWorkshop.lua

Source: `dataS/scripts/placeables/specializations/PlaceableWorkshop.lua` — FS25 1.25.1.0

- **PlaceableWorkshop** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableWorkshop.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableWorkshop.registerOverwrittenFunctions(placeableType: any)` | 24 |  |
| `PlaceableWorkshop.registerEventListeners(placeableType: any)` | 30 |  |
| `PlaceableWorkshop.registerXMLPaths(schema: any, basePath: any)` | 37 |  |
| `PlaceableWorkshop:onLoad(savegame: table)` | 46 |  |
| `PlaceableWorkshop:onDelete()` | 57 |  |
| `PlaceableWorkshop:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 67 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
