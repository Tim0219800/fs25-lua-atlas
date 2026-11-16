# animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryLiquidManure.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua` — FS25 1.25.1.0

✍ Placeable specialization that makes a husbandry produce liquid manure. It has no prerequisites but relies on husbandry storage methods (`addHusbandryFillLevelFromTool`, `getHusbandryFreeCapacity`, ...) provided by another specialization. The hourly output is computed from the animal clusters' `liquidManure` output curve and added to the storage on the server; a full tank slows the husbandry's production.

- **PlaceableHusbandryLiquidManure** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryLiquidManure.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization is required. |
| `PlaceableHusbandryLiquidManure.registerOverwrittenFunctions(placeableType: any)` | 24 | ✍ Registers overrides of `updateOutput`, `updateProduction`, `updateInfo` and `getConditionInfos`. |
| `PlaceableHusbandryLiquidManure.registerEventListeners(placeableType: any)` | 33 | ✍ Subscribes to `onLoad`, `onFinalizePlacement` and `onHusbandryAnimalsUpdate`. |
| `PlaceableHusbandryLiquidManure.registerXMLPaths(schema: any, basePath: any)` | 41 | ✍ Registers `husbandry.liquidManure.manure#factor` and `#active`. Note: no code in this file reads these two values. |
| `PlaceableHusbandryLiquidManure:onLoad(savegame: any)` | 51 | ✍ Initializes the hourly output to 0, sets the fill type to liquid manure and prepares the info entry. |
| `PlaceableHusbandryLiquidManure:onFinalizePlacement()` | 61 | ✍ Logs an XML warning if the husbandry storage does not support the liquid manure fill type. |
| `PlaceableHusbandryLiquidManure:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 70 | ✍ Override: on the server adds liquid manure to the husbandry storage (food factor times liters per hour times time adjustment), then calls the parent. |
| `PlaceableHusbandryLiquidManure:updateProduction(superFunc: any, foodFactor: any)` | 85 | ✍ Override: on the server multiplies the parent's production factor by 0.75 when the liquid manure storage has no free capacity. |
| `PlaceableHusbandryLiquidManure:onHusbandryAnimalsUpdate(clusters: any)` | 101 | ✍ Recomputes `litersPerHour` from the clusters: daily liquid manure per animal for its age times the animal count, divided by 24. |
| `PlaceableHusbandryLiquidManure:getConditionInfos(superFunc: any)` | 122 | ✍ Override: appends a liquid manure fill entry (level and clamped ratio, inverted bar); if there is no tank capacity the entry is disabled and labelled with a missing tank message. |
| `PlaceableHusbandryLiquidManure:updateInfo(superFunc: any, infoTable: any)` | 150 | ✍ Override: appends the current liquid manure level in liters to the info list. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `updateOutput` | 25 |
| registerOverwrittenFunction | `updateProduction` | 26 |
| registerOverwrittenFunction | `updateInfo` | 27 |
| registerOverwrittenFunction | `getConditionInfos` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onFinalizePlacement` | 35 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 36 |
