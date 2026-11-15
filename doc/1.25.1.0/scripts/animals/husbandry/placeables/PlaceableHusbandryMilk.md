# animals/husbandry/placeables/PlaceableHusbandryMilk.lua

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryMilk.lua` — FS25 1.25.1.0

- **PlaceableHusbandryMilk** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableHusbandryMilk.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `PlaceableHusbandryMilk.initSpecialization()` | 25 |  |
| `PlaceableHusbandryMilk.registerFunctions(placeableType: any)` | 31 |  |
| `PlaceableHusbandryMilk.registerOverwrittenFunctions(placeableType: any)` | 37 |  |
| `PlaceableHusbandryMilk.registerEventListeners(placeableType: any)` | 46 |  |
| `PlaceableHusbandryMilk.registerXMLPaths(schema: any, basePath: any)` | 55 |  |
| `PlaceableHusbandryMilk:onLoad(savegame: any)` | 73 |  |
| `PlaceableHusbandryMilk:onMilkingRobotLoaded(robot: any, args: any)` | 144 |  |
| `PlaceableHusbandryMilk:onDelete()` | 150 |  |
| `PlaceableHusbandryMilk:onFinalizePlacement()` | 162 |  |
| `PlaceableHusbandryMilk:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 180 |  |
| `PlaceableHusbandryMilk:updateProduction(superFunc: any, foodFactor: any)` | 195 |  |
| `PlaceableHusbandryMilk:onHusbandryAnimalsUpdate(clusters: any)` | 214 |  |
| `PlaceableHusbandryMilk:updateInfo(superFunc: any, infoTable: any)` | 244 |  |
| `PlaceableHusbandryMilk:getConditionInfos(superFunc: any)` | 260 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onMilkingRobotLoaded` | 32 |
| registerOverwrittenFunction | `updateOutput` | 38 |
| registerOverwrittenFunction | `updateProduction` | 39 |
| registerOverwrittenFunction | `updateInfo` | 40 |
| registerOverwrittenFunction | `getConditionInfos` | 41 |
| registerEventListener | `onLoad` | 47 |
| registerEventListener | `onDelete` | 48 |
| registerEventListener | `onFinalizePlacement` | 49 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 50 |
