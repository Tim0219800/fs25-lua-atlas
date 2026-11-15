# placeables/specializations/PlaceablePlacement.lua

Source: `dataS/scripts/placeables/specializations/PlaceablePlacement.lua` — FS25 1.25.1.0

- **PlaceablePlacement** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceablePlacement.prerequisitesPresent(specializations: table) → boolean` | 23 |  |
| `PlaceablePlacement.registerFunctions(placeableType: any)` | 29 |  |
| `PlaceablePlacement.registerEventListeners(placeableType: any)` | 54 |  |
| `PlaceablePlacement.registerXMLPaths(schema: any, basePath: any)` | 62 |  |
| `PlaceablePlacement:onLoad(savegame: table)` | 88 |  |
| `PlaceablePlacement:onDelete()` | 136 |  |
| `PlaceablePlacement:loadTestArea(xmlFile: any, key: any, area: any)` | 145 |  |
| `PlaceablePlacement:getPlacementRotation(x: any, y: any, z: any)` | 195 |  |
| `PlaceablePlacement:getPlacementPosition(x: any, y: any, z: any)` | 207 |  |
| `PlaceablePlacement:getPositionSnapSize()` | 222 |  |
| `PlaceablePlacement:getPositionSnapOffset()` | 228 |  |
| `PlaceablePlacement:getRotationSnapAngle()` | 234 |  |
| `PlaceablePlacement:onPreFinalizePlacement()` | 240 |  |
| `PlaceablePlacement:getIsAreaOwnedByFarm(sx: any, sz: any, wx: any, wz: any, hx: any, hz: any, farmId: any)` | 267 |  |
| `PlaceablePlacement:startPlacementCheck(x: any, y: any, z: any, rotY: any)` | 284 |  |
| `PlaceablePlacement:getHasOverlap(x: any, y: any, z: any, rotY: any, checkFunc: any)` | 343 |  |
| `PlaceablePlacement:getHasOverlapWithPlaces(places: any, x: any, y: any, z: any, rotY: any)` | 422 |  |
| `PlaceablePlacement:getHasOverlapWithZones(zones: any, x: any, y: any, z: any, rotY: any)` | 450 |  |
| `PlaceablePlacement:getTestParallelogramAtWorldPosition(testArea: any, x: any, z: any, rotY: any)` | 498 |  |
| `PlaceablePlacement:playPlaceSound()` | 531 |  |
| `PlaceablePlacement:playDestroySound(onlyIfNotPlaying: any)` | 541 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadTestArea` | 30 |
| registerFunction | `getIsAreaOwnedByFarm` | 31 |
| registerFunction | `getIsOnOwnedFarmland` | 32 |
| registerFunction | `startPlacementCheck` | 33 |
| registerFunction | `getPlacementRotation` | 34 |
| registerFunction | `getPlacementPosition` | 35 |
| registerFunction | `getPositionSnapSize` | 36 |
| registerFunction | `getPositionSnapOffset` | 37 |
| registerFunction | `getRotationSnapAngle` | 38 |
| registerFunction | `getPlacementOverlapMask` | 39 |
| registerFunction | `isValidOverlapNode` | 40 |
| registerFunction | `getHasOverlap` | 41 |
| registerFunction | `getHasOverlapWithPlaces` | 42 |
| registerFunction | `getCanBePlacedInWater` | 43 |
| registerFunction | `getHasOverlapWithZones` | 44 |
| registerFunction | `getTestParallelogramAtWorldPosition` | 45 |
| registerFunction | `playPlaceSound` | 46 |
| registerFunction | `playDestroySound` | 47 |
| registerFunction | `getIsAreaBlocked` | 48 |
| registerFunction | `getHasOverlapWithDensityHeight` | 49 |
| registerEventListener | `onLoad` | 55 |
| registerEventListener | `onDelete` | 56 |
| registerEventListener | `onPreFinalizePlacement` | 57 |
