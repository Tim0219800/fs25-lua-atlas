# animals/husbandry/placeables/PlaceableHusbandryStraw.lua

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryStraw.lua` — FS25 1.25.1.0

- **PlaceableHusbandryStraw** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableHusbandryStraw.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableHusbandryStraw.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableHusbandryStraw.registerOverwrittenFunctions(placeableType: any)` | 30 |  |
| `PlaceableHusbandryStraw.registerEventListeners(placeableType: any)` | 39 |  |
| `PlaceableHusbandryStraw.registerXMLPaths(schema: any, basePath: any)` | 51 |  |
| `PlaceableHusbandryStraw:onLoad(savegame: any)` | 62 |  |
| `PlaceableHusbandryStraw:onPostFinalizePlacement()` | 85 |  |
| `PlaceableHusbandryStraw:onDelete()` | 91 |  |
| `PlaceableHusbandryStraw:onFinalizePlacement()` | 101 |  |
| `PlaceableHusbandryStraw:onReadStream(streamId: any, connection: any)` | 113 |  |
| `PlaceableHusbandryStraw:updateStrawPlane()` | 119 |  |
| `PlaceableHusbandryStraw:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 135 |  |
| `PlaceableHusbandryStraw:updateProduction(superFunc: any, foodFactor: any)` | 158 |  |
| `PlaceableHusbandryStraw:onHusbandryAnimalsUpdate(clusters: any)` | 179 |  |
| `PlaceableHusbandryStraw:onHusbandryFillLevelChanged(fillTypeIndex: any, delta: any)` | 209 |  |
| `PlaceableHusbandryStraw:getConditionInfos(superFunc: any)` | 218 |  |
| `PlaceableHusbandryStraw:updateInfo(superFunc: any, infoTable: any)` | 262 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateStrawPlane` | 25 |
| registerOverwrittenFunction | `updateOutput` | 31 |
| registerOverwrittenFunction | `updateProduction` | 32 |
| registerOverwrittenFunction | `getConditionInfos` | 33 |
| registerOverwrittenFunction | `updateInfo` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onPostFinalizePlacement` | 41 |
| registerEventListener | `onDelete` | 42 |
| registerEventListener | `onFinalizePlacement` | 43 |
| registerEventListener | `onReadStream` | 44 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 45 |
| registerEventListener | `onHusbandryFillLevelChanged` | 46 |
