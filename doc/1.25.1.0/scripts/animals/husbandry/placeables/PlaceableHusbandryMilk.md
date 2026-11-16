# animals/husbandry/placeables/PlaceableHusbandryMilk.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryMilk.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryMilk.lua` — FS25 1.25.1.0

✍ Placeable specialization that makes a husbandry produce milk and optionally hosts milking robots. It requires `PlaceableHusbandry` and `PlaceableHusbandryAnimals`, adds a `milk` placeable configuration type, and reads `husbandry.milk` (or a selected `milkConfiguration`). The output per fill type comes from the animal subtypes' `milk` curve, is added to the husbandry storage on the server, and production stops when any milk tank is full.

- **PlaceableHusbandryMilk** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryMilk.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if both `PlaceableHusbandry` and `PlaceableHusbandryAnimals` are present. |
| `PlaceableHusbandryMilk.initSpecialization()` | 25 | ✍ Registers the `milk` configuration type with the placeable configuration manager. |
| `PlaceableHusbandryMilk.registerFunctions(placeableType: any)` | 31 | ✍ Registers the method `onMilkingRobotLoaded`. |
| `PlaceableHusbandryMilk.registerOverwrittenFunctions(placeableType: any)` | 37 | ✍ Registers overrides of `updateOutput`, `updateProduction`, `updateInfo` and `getConditionInfos`. |
| `PlaceableHusbandryMilk.registerEventListeners(placeableType: any)` | 46 | ✍ Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement` and `onHusbandryAnimalsUpdate`. |
| `PlaceableHusbandryMilk.registerXMLPaths(schema: any, basePath: any)` | 55 | ✍ Registers the milk XML paths twice, under `husbandry.milk` and under each `milkConfiguration(?)`, through `registerMilkXMLPaths` (not defined in the SDK dump, UNVERIFIED). |
| `PlaceableHusbandryMilk:onLoad(savegame: any)` | 73 | ✍ Picks the milk configuration (falling back to the base node), reads `hasMilkProduction`, collects the milk fill types of the animal type's subtypes, and creates each milking robot from its class, file and link node (skipped with a warning if invalid). |
| `PlaceableHusbandryMilk:onMilkingRobotLoaded(robot: any, args: any)` | 144 | ✍ Callback when a milking robot finishes loading: completes the loading task. |
| `PlaceableHusbandryMilk:onDelete()` | 150 | ✍ Deletes every milking robot. |
| `PlaceableHusbandryMilk:onFinalizePlacement()` | 162 | ✍ If milk production is enabled, warns about milk fill types missing from the husbandry storage and forwards the placement finalization to each milking robot. |
| `PlaceableHusbandryMilk:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 180 | ✍ Override: on the server adds milk per fill type to the husbandry storage (production factor times global factor times liters per hour times time adjustment), then calls the parent. |
| `PlaceableHusbandryMilk:updateProduction(superFunc: any, foodFactor: any)` | 195 | ✍ Override: returns the parent's factor, but forced to 0 if any milk fill type has no free capacity left. |
| `PlaceableHusbandryMilk:onHusbandryAnimalsUpdate(clusters: any)` | 214 | ✍ Recomputes the liters per hour of each milk fill type from the clusters (milk curve at the animal's age times animal count, divided by 24) and rebuilds the active fill type list. |
| `PlaceableHusbandryMilk:updateInfo(superFunc: any, infoTable: any)` | 244 | ✍ Override: appends the stored liters of each active milk fill type to the info list. |
| `PlaceableHusbandryMilk:getConditionInfos(superFunc: any)` | 260 | ✍ Override: appends one fill entry per active milk fill type (level and clamped ratio, inverted bar). |

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
