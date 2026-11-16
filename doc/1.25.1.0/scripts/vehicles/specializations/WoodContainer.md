# vehicles/specializations/WoodContainer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WoodContainer.md)*

Source: `dataS/scripts/vehicles/specializations/WoodContainer.lua` — FS25 1.25.1.0

✍ Specialization for shipping containers that accept logs through a trigger. The server deletes each qualifying tree/log entering the trigger and adds its volume to a fill unit as wood, while tracking a quality-weighted volume used to reduce the paid amount when emptying. It supports a configuration type `woodContainer`, an optional push animation, load sounds and a fold-range limit when combined with a foldable. State is saved as `woodQualityVolume` and `woodQualityTotalVolume`. The class table declaration is absent from the dump lines.


## Functions

| Function | Line | Description |
|---|---|---|
| `WoodContainer.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: no prerequisite specializations. |
| `WoodContainer.initSpecialization()` | 26 | ✍ Adds the `woodContainer` vehicle configuration type, registers XML paths (base and per configuration), the log-count sound settings, and the two savegame attributes for quality volumes. |
| `WoodContainer.registerXMLPaths(schema: any, baseKey: any)` | 47 | ✍ Registers under a base key: fold limits, `#fillUnitIndex`, `#targetLength` (ideal log length, default 12), `#triggerNode` and the push animation name and speed scale. |
| `WoodContainer.registerFunctions(vehicleType: any)` | 61 | ✍ Registers `getPalletUnloadTriggerExtraSellPrice`, `getIsWoodContainerFillingAllowed` and `onWoodContainerTriggerCallback` on the vehicle type. |
| `WoodContainer.registerOverwrittenFunctions(vehicleType: any)` | 69 | ✍ Overrides `getInfoBoxTitle` and `addFillUnitFillLevel` of the vehicle. |
| `WoodContainer.registerEventListeners(vehicleType: any)` | 76 | ✍ Subscribes to onLoad, onDelete and onFillUnitFillLevelChanged. |
| `WoodContainer:onLoad(savegame: any)` | 84 | ✍ Picks the XML section of the selected `woodContainer` configuration (falling back to the base key) and reads limits, fill unit, target length, trigger and push animation. On the server it registers the trigger callback; on the client it loads the load sample. Restores saved quality volumes. |
| `WoodContainer:onDelete()` | 131 | ✍ Removes the trigger node's trigger and deletes the sound samples. |
| `WoodContainer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 144 | ✍ Writes the quality-weighted and total wood volumes to the savegame. |
| `WoodContainer:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 152 | ✍ For the container's fill unit: on the client plays the load sound when the apparent log count changes while filling; and plays the push animation forward when the level leaves zero or backward when it returns to zero. |
| `WoodContainer:getPalletUnloadTriggerExtraSellPrice()` | 182 | ✍ Returns the vehicle's price (`getPrice()`), used as an extra sell price by pallet unload triggers. |
| `WoodContainer:getIsWoodContainerFillingAllowed()` | 188 | ✍ Returns false if the vehicle is foldable and its fold animation time lies outside the configured min/max limits; otherwise true. |
| `WoodContainer:getInfoBoxTitle(superFunc: any)` | 202 | ✍ Overrides the info box title with the localized `storeItem_shippingContainer` text, ignoring `superFunc`. |
| `WoodContainer:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 208 | ✍ Wraps the parent call. When removing wood (negative delta) and a total volume is tracked, the returned delta is scaled by the quality-to-total volume ratio, so low-quality wood yields less. The tracked volumes themselves are not reduced here. |
| `WoodContainer:onWoodContainerTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 228 | ✍ Server-side trigger handler. If filling is allowed, takes a valid non-transport split shape with a positive price, adds its volume to the fill unit as wood, updates quality volumes, deletes the shape and broadcasts `WoodContainerWrongLengthEvent` if its length is more than 1 m from the target. Transport trees trigger a blinking warning. |
| `WoodContainer.getSplitShapeInfo(objectId: any, targetLength: any)` | 257 | ✍ Returns three values for a split shape: volume in liters, a quality scale (from bounding-box ratio, convex parts, length, attached branches, blended toward 1 by economic difficulty) and its longest bounding size. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getPalletUnloadTriggerExtraSellPrice` | 62 |
| registerFunction | `getIsWoodContainerFillingAllowed` | 63 |
| registerFunction | `onWoodContainerTriggerCallback` | 64 |
| registerOverwrittenFunction | `getInfoBoxTitle` | 70 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 71 |
| registerEventListener | `onLoad` | 77 |
| registerEventListener | `onDelete` | 78 |
| registerEventListener | `onFillUnitFillLevelChanged` | 79 |
