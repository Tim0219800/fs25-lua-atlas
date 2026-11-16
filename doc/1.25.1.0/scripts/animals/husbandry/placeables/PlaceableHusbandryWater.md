# animals/husbandry/placeables/PlaceableHusbandryWater.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryWater.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryWater.lua` — FS25 1.25.1.0

✍ Placeable specialization for the water supply of a husbandry. Water is either drawn from the husbandry storage or bought automatically (charged to the owner farm), it can show a water plane, and it registers water places as feeding places in the animal engine. XML keys are under `placeable.husbandry.water` (`#automaticWaterSupply`, `waterPlaces.waterPlace#node`, `waterPlane`).

- **PlaceableHusbandryWater** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryWater.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Prerequisite check; always returns true, so the specialization has no requirement on other specializations. |
| `PlaceableHusbandryWater.registerFunctions(placeableType: any)` | 24 | ✍ Registers the new placeable function `updateWaterPlane`. |
| `PlaceableHusbandryWater.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Registers overrides of `updateFeeding`, `getConditionInfos` and `updateInfo`. |
| `PlaceableHusbandryWater.registerEventListeners(placeableType: any)` | 38 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, onPostFinalizePlacement, onHusbandryAnimalsUpdate, onHusbandryAnimalsCreated and onHusbandryFillLevelChanged. |
| `PlaceableHusbandryWater.registerXMLPaths(schema: any, basePath: any)` | 50 | ✍ Declares the XML paths under `husbandry.water`: `#automaticWaterSupply` (default false), repeated `waterPlaces.waterPlace#node` and the `waterPlane` fill plane. |
| `PlaceableHusbandryWater:onLoad(savegame: any)` | 61 | ✍ Initializes state, reads `#automaticWaterSupply`, creates the optional water `FillPlane` (full if automatic supply, else empty; deleted if loading fails) and loads each water place node. |
| `PlaceableHusbandryWater:onPostFinalizePlacement()` | 88 | ✍ Refreshes the water plane and water places once placement is finalized. |
| `PlaceableHusbandryWater:onDelete()` | 94 | ✍ Deletes the water fill plane if there is one. |
| `PlaceableHusbandryWater:onFinalizePlacement()` | 104 | ✍ If automatic supply is off but the husbandry storage does not support water, logs an XML warning and switches to automatic water supply. |
| `PlaceableHusbandryWater:updateWaterPlane()` | 117 | ✍ Sets the water plane state to water level divided by capacity, and, if the engine husbandry exists, calls `updateFeedingPlace` for each registered water place with the current level. |
| `PlaceableHusbandryWater:updateFeeding(superFunc: any)` | 141 | ✍ Override. Server only: consumes `litersPerHour` times `timeAdjustment`. With automatic supply it charges the owner farm (`MoneyType.PURCHASE_WATER`); otherwise it removes water from storage and scales the parent factor by the share actually supplied. Returns the factor. |
| `PlaceableHusbandryWater:onHusbandryAnimalsCreated(husbandryId: any)` | 164 | ✍ Stores the engine husbandry id and registers each water place node as a water feeding place with `addFeedingPlace`; the place is kept only if it is reachable (accessible). |
| `PlaceableHusbandryWater:onHusbandryAnimalsUpdate(clusters: any)` | 181 | ✍ Recomputes water demand in liters per hour by summing, over the animal clusters, the age-based daily water amount times animal count divided by 24. |
| `PlaceableHusbandryWater:onHusbandryFillLevelChanged(fillTypeIndex: any, delta: any)` | 202 | ✍ Refreshes the water plane and places when the changed fill type is water. |
| `PlaceableHusbandryWater:getConditionInfos(superFunc: any)` | 211 | ✍ Override. Unless automatic supply is on, appends a water condition bar (level and ratio of capacity) to the parent list. |
| `PlaceableHusbandryWater:updateInfo(superFunc: any, infoTable: any)` | 238 | ✍ Override. After the parent, appends the water level in whole liters to the info table, unless automatic supply is on. |

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
