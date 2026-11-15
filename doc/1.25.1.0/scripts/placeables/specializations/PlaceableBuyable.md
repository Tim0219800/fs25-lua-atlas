# placeables/specializations/PlaceableBuyable.lua

Source: `dataS/scripts/placeables/specializations/PlaceableBuyable.lua` — FS25 1.25.1.0

- **PlaceableBuyable** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableBuyable.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `PlaceableBuyable.registerFunctions(placeableType: any)` | 25 |  |
| `PlaceableBuyable.registerOverwrittenFunctions(placeableType: any)` | 34 |  |
| `PlaceableBuyable.registerEventListeners(placeableType: any)` | 40 |  |
| `PlaceableBuyable.registerXMLPaths(schema: any, basePath: any)` | 47 |  |
| `PlaceableBuyable:onLoad(savegame: table)` | 57 |  |
| `PlaceableBuyable:onDelete()` | 73 |  |
| `PlaceableBuyable:onBuyingTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 111 |  |
| `PlaceableBuyable:buyRequest(requestCallback: any, target: any)` | 133 |  |
| `PlaceableBuyable:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 184 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onBuyingTriggerCallback` | 26 |
| registerFunction | `setIsBuyingTriggerActive` | 27 |
| registerFunction | `buyRequest` | 28 |
| registerFunction | `getHasBuyingTrigger` | 29 |
| registerOverwrittenFunction | `setOwnerFarmId` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |
