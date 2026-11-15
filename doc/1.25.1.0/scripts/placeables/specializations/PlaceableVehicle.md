# placeables/specializations/PlaceableVehicle.lua

Source: `dataS/scripts/placeables/specializations/PlaceableVehicle.lua` — FS25 1.25.1.0

- **PlaceableVehicle** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableVehicle.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableVehicle.registerFunctions(vehicleType: any)` | 24 |  |
| `PlaceableVehicle.registerOverwrittenFunctions(placeableType: any)` | 30 |  |
| `PlaceableVehicle.registerEventListeners(placeableType: any)` | 37 |  |
| `PlaceableVehicle.registerXMLPaths(schema: any, basePath: any)` | 45 |  |
| `PlaceableVehicle:onLoad(savegame: table)` | 57 |  |
| `PlaceableVehicle:onFinishLoadingVehicle(vehicles: any, vehicleLoadState: any, vehicleData: any)` | 96 |  |
| `PlaceableVehicle:onFinalizePlacement()` | 132 |  |
| `PlaceableVehicle:onDelete()` | 156 |  |
| `PlaceableVehicle:register(alreadySent: any)` | 168 |  |
| `PlaceableVehicle:collectPickObjects(superFunc: any, node: any)` | 179 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onFinishLoadingVehicle` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerOverwrittenFunction | `register` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onDelete` | 40 |
