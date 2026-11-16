# animals/husbandry/placeables/PlaceableHusbandryStraw.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryStraw.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryStraw.lua` — FS25 1.25.1.0

✍ Placeable specialization for the straw bedding of a husbandry: animals consume straw and, optionally, produce manure from it. It overwrites the husbandry output, production, condition and info functions, drives an optional visual straw fill plane, and reads its settings from `placeable.husbandry.straw` (`strawPlane`, `manure#factor`, `manure#active`). It relies on the husbandry specialization functions (UNVERIFIED, file not in this lot).

- **PlaceableHusbandryStraw** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryStraw.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Prerequisite check; always returns true, so the specialization has no requirement on other specializations. |
| `PlaceableHusbandryStraw.registerFunctions(placeableType: any)` | 24 | ✍ Registers the new placeable function `updateStrawPlane`. |
| `PlaceableHusbandryStraw.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Registers overrides of `updateOutput`, `updateProduction`, `getConditionInfos` and `updateInfo`. |
| `PlaceableHusbandryStraw.registerEventListeners(placeableType: any)` | 39 | ✍ Subscribes to onLoad, onPostFinalizePlacement, onDelete, onFinalizePlacement, onReadStream, onHusbandryAnimalsUpdate and onHusbandryFillLevelChanged. |
| `PlaceableHusbandryStraw.registerXMLPaths(schema: any, basePath: any)` | 51 | ✍ Declares the XML paths under `husbandry.straw`: the `strawPlane` fill plane, `manure#factor` (default 1) and `manure#active` (default true). |
| `PlaceableHusbandryStraw:onLoad(savegame: any)` | 62 | ✍ Reads the manure factor and active flag, creates the optional straw `FillPlane` (deleted if loading fails), sets straw as input and manure as output fill types, and initializes liters-per-hour and info tables. |
| `PlaceableHusbandryStraw:onPostFinalizePlacement()` | 85 | ✍ Refreshes the straw plane once placement is finalized. |
| `PlaceableHusbandryStraw:onDelete()` | 91 | ✍ Deletes the straw fill plane if there is one. |
| `PlaceableHusbandryStraw:onFinalizePlacement()` | 101 | ✍ Logs an XML warning if the husbandry storage does not support straw. Note: the manure check reads `self.isManureActive` instead of `spec.isManureActive`, so it is probably never true (apparent bug). |
| `PlaceableHusbandryStraw:onReadStream(streamId: any, connection: any)` | 113 | ✍ Refreshes the straw plane after a client receives the initial stream. |
| `PlaceableHusbandryStraw:updateStrawPlane()` | 119 | ✍ Sets the straw plane state to the straw fill level divided by capacity (0 if capacity is 0). Does nothing without a plane. |
| `PlaceableHusbandryStraw:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 135 | ✍ Override. On the server, removes straw according to liters per hour scaled by `environment.timeAdjustment`, adds manure in proportion to the straw really consumed, and refreshes the plane. Then calls the parent function. |
| `PlaceableHusbandryStraw:updateProduction(superFunc: any, foodFactor: any)` | 158 | ✍ Override. Takes the parent production factor and, on the server, multiplies it by 0.75 if straw is present but manure storage is full, or by 0.9 if there is no straw. Returns the factor. |
| `PlaceableHusbandryStraw:onHusbandryAnimalsUpdate(clusters: any)` | 179 | ✍ Recomputes straw input and manure output in liters per hour by summing, over the animal clusters, the subtype age-based daily amounts times animal count divided by 24. |
| `PlaceableHusbandryStraw:onHusbandryFillLevelChanged(fillTypeIndex: any, delta: any)` | 209 | ✍ Refreshes the straw plane when the changed fill type is straw. |
| `PlaceableHusbandryStraw:getConditionInfos(superFunc: any)` | 218 | ✍ Override. Appends a straw condition bar (value and ratio of capacity) and a manure bar (inverted bar, disabled with a missing-manure-heap label when manure capacity is 0) to the parent list. |
| `PlaceableHusbandryStraw:updateInfo(superFunc: any, infoTable: any)` | 262 | ✍ Override. After the parent, appends two info entries to the table: straw and manure levels formatted as whole liters. |

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
