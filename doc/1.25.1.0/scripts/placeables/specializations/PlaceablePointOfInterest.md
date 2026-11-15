# placeables/specializations/PlaceablePointOfInterest.lua

Source: `dataS/scripts/placeables/specializations/PlaceablePointOfInterest.lua` — FS25 1.25.1.0

- **PlaceablePointOfInterest** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceablePointOfInterest.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceablePointOfInterest.registerXMLPaths(schema: any, basePath: any)` | 25 |  |
| `PlaceablePointOfInterest.registerOverwrittenFunctions(placeableType: any)` | 34 |  |
| `PlaceablePointOfInterest.registerEventListeners(placeableType: any)` | 40 |  |
| `PlaceablePointOfInterest:onLoad(savegame: table)` | 48 |  |
| `PlaceablePointOfInterest:onDelete()` | 71 |  |
| `PlaceablePointOfInterest:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 83 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |
