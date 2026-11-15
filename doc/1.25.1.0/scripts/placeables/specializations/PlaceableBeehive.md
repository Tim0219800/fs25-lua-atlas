# placeables/specializations/PlaceableBeehive.lua

Source: `dataS/scripts/placeables/specializations/PlaceableBeehive.lua` — FS25 1.25.1.0

- **PlaceableBeehive** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableBeehive.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableBeehive.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableBeehive.registerOverwrittenFunctions(placeableType: any)` | 32 |  |
| `PlaceableBeehive.registerEventListeners(placeableType: any)` | 38 |  |
| `PlaceableBeehive.registerXMLPaths(schema: any, basePath: any)` | 47 |  |
| `PlaceableBeehive:onLoad(savegame: table)` | 61 |  |
| `PlaceableBeehive:onDelete()` | 96 |  |
| `PlaceableBeehive:onFinalizePlacement()` | 106 |  |
| `PlaceableBeehive:getBeehiveInfluenceFactor(wx: any, wz: any)` | 118 |  |
| `PlaceableBeehive:updateBeehiveState()` | 131 |  |
| `PlaceableBeehive:getHoneyAmountToSpawn()` | 153 |  |
| `PlaceableBeehive:updateInfo(superFunc: any, infoTable: any)` | 166 |  |
| `PlaceableBeehive:onBuy()` | 185 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getBeehiveInfluenceFactor` | 25 |
| registerFunction | `updateBeehiveState` | 26 |
| registerFunction | `getHoneyAmountToSpawn` | 27 |
| registerOverwrittenFunction | `updateInfo` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onFinalizePlacement` | 41 |
| registerEventListener | `onBuy` | 42 |
