# placeables/specializations/PlaceableWorkshop.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableWorkshop.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWorkshop.lua` — FS25 1.25.1.0

✍ Placeable specialization that turns a building into a workshop by creating a VehicleSellingPoint from `placeable.workshop.sellingPoint`. The selling point is linked back to the placeable and its owner farm is kept in step.

- **PlaceableWorkshop** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableWorkshop.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableWorkshop.registerOverwrittenFunctions(placeableType: any)` | 24 | ✍ Overrides `setOwnerFarmId` on the placeable type. |
| `PlaceableWorkshop.registerEventListeners(placeableType: any)` | 30 | ✍ Subscribes to onLoad and onDelete. |
| `PlaceableWorkshop.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Declares the selling point XML keys via `VehicleSellingPoint.registerXMLPaths` under `.workshop.sellingPoint`. |
| `PlaceableWorkshop:onLoad(savegame: table)` | 46 | ✍ Creates and loads the VehicleSellingPoint, sets its owner farm and stores `owningPlaceable` on it. |
| `PlaceableWorkshop:onDelete()` | 57 | ✍ Deletes the selling point if it exists. |
| `PlaceableWorkshop:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 67 | ✍ Calls the parent, then propagates the new owner farm to the selling point. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
