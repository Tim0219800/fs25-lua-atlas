# animals/husbandry/placeables/PlaceableHusbandryWater.lua

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryWater.lua` — FS25 1.25.1.0

- **PlaceableHusbandryWater** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableHusbandryWater.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableHusbandryWater.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableHusbandryWater.registerOverwrittenFunctions(placeableType: any)` | 30 |  |
| `PlaceableHusbandryWater.registerEventListeners(placeableType: any)` | 38 |  |
| `PlaceableHusbandryWater.registerXMLPaths(schema: any, basePath: any)` | 50 |  |
| `PlaceableHusbandryWater:onLoad(savegame: any)` | 61 |  |
| `PlaceableHusbandryWater:onPostFinalizePlacement()` | 88 |  |
| `PlaceableHusbandryWater:onDelete()` | 94 |  |
| `PlaceableHusbandryWater:onFinalizePlacement()` | 104 |  |
| `PlaceableHusbandryWater:updateWaterPlane()` | 117 |  |
| `PlaceableHusbandryWater:updateFeeding(superFunc: any)` | 141 |  |
| `PlaceableHusbandryWater:onHusbandryAnimalsCreated(husbandryId: any)` | 164 |  |
| `PlaceableHusbandryWater:onHusbandryAnimalsUpdate(clusters: any)` | 181 |  |
| `PlaceableHusbandryWater:onHusbandryFillLevelChanged(fillTypeIndex: any, delta: any)` | 202 |  |
| `PlaceableHusbandryWater:getConditionInfos(superFunc: any)` | 211 |  |
| `PlaceableHusbandryWater:updateInfo(superFunc: any, infoTable: any)` | 238 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateWaterPlane` | 25 |
| registerOverwrittenFunction | `updateFeeding` | 31 |
| registerOverwrittenFunction | `getConditionInfos` | 32 |
| registerOverwrittenFunction | `updateInfo` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onFinalizePlacement` | 41 |
| registerEventListener | `onPostFinalizePlacement` | 42 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 43 |
| registerEventListener | `onHusbandryAnimalsCreated` | 44 |
| registerEventListener | `onHusbandryFillLevelChanged` | 45 |
