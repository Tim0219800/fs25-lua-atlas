# vehicles/specializations/Consumable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Consumable.md)*

Source: `dataS/scripts/vehicles/specializations/Consumable.lua` — FS25 1.25.1.0

✍ Vehicle specialization for tools that use swappable consumables (for example bales, bags or pallets of wrapping, seed or similar items), requiring `FillUnit`. Each consumable type maps to a fill unit with visual storage slots and consuming slots whose meshes come from `g_consumableManager`. It tracks the consumed fill level and variation, drives mesh scale, shader parameters and animations, saves and syncs this state, shows an empty warning and exposes a refill dialog through a `ConsumableActivatable`. Configurations can set the default consumable. Class table definition and `Consumable.CONFIG_NAMES` constants are not in the dump (stripped header).


## Functions

| Function | Line | Description |
|---|---|---|
| `Consumable.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Returns true only if the vehicle type has the `FillUnit` specialization. |
| `Consumable.initSpecialization()` | 32 | ✍ Registers a shop configuration type per name in `Consumable.CONFIG_NAMES`, plus the XML schema under `vehicle.consumable` (types, slots, consuming animations, shader nodes, object changes) and the savegame schema. |
| `Consumable.registerEvents(vehicleType: table)` | 82 | ✍ Registers the vehicle event `onConsumableVariationChanged`, raised when the consuming variation changes. |
| `Consumable.registerFunctions(vehicleType: table)` | 89 | ✍ Registers six vehicle functions: variation lookup by fill unit, slot variation setter, `updateConsumable`, availability check, empty-warning check and the fill trigger speed factor. |
| `Consumable.registerOverwrittenFunctions(vehicleType: table)` | 101 | ✍ Overrides `addFillUnitFillLevel`, `getFillUnitFreeCapacity` and `collectPalletTensionBeltNodes`. |
| `Consumable.registerEventListeners(vehicleType: table)` | 110 | ✍ Subscribes to load, post-load, delete, stream read/write, update stream, dirty mask cleared, update, draw and the fill unit events (level changed, filling state, trigger added or removed). |
| `Consumable:onLoad(savegame: table)` | 130 | ✍ Reads each consumable type from XML (fill unit, slots, consuming settings, animations, object changes, shader nodes), skipping invalid ones with a warning. It sets the fill unit capacity to the slot count, applies configuration default names and creates the activatable. |
| `Consumable:onPostLoad(savegame: table)` | 259 | ✍ Restores consumed level, variation and storage slot variations from the savegame unless vehicles are reset. For a new vehicle not spawned empty, it fills the unit with the default consumable. Then refreshes the activatable. |
| `Consumable:onDelete()` | 308 | ✍ Removes the refill activatable from the activatable objects system. |
| `Consumable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 315 | ✍ Saves, for each type, the name, consuming fill level and consuming variation name, plus the variation name of each storage slot. |
| `Consumable:onReadStream(streamId: any, connection: any)` | 333 | ✍ Client side: on the initial sync reads consuming level and variation, then each storage slot variation, and updates meshes and pallet straps. |
| `Consumable:onWriteStream(streamId: any, connection: any)` | 358 | ✍ Server side: writes the same consuming level, variation and storage slot variation data that `onReadStream` reads, in the same order. |
| `Consumable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 377 | ✍ Client side: when the dirty flag is set, reads per-type consuming data and storage slot variations if flagged, applying them to the meshes. |
| `Consumable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 406 | ✍ Server side: writes per-type consuming data and all storage slot variations, each preceded by a bool telling whether it changed. |
| `Consumable:onDirtyMaskCleared()` | 437 | ✍ Resets the per-type and per-slot dirty markers after the dirty mask has been cleared. |
| `Consumable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 455 | ✍ Moves each dirty consuming animation toward its target time at its speed scale, wrapping the time at 1 or 0, and keeps the vehicle active until all animations reach their target. |
| `Consumable:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 494 | ✍ Shows a blinking warning for the first type with consuming slots when both its consuming level and fill unit are at zero and the empty-warning check allows it. |
| `Consumable:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 513 | ✍ Server only. When the type's fill unit changes, fills or empties storage slots one by one. The variation is taken from the fill trigger source, then the consuming variation, then the default, and consuming slots are refilled if there are no storage slots. |
| `Consumable:onFillUnitIsFillingStateChanged(isFilling: any)` | 605 | ✍ When filling ends, refills the consuming slots for types whose consuming level is zero, otherwise only refreshes the display. |
| `Consumable:onAddedFillUnitTrigger(fillTypeIndex: any, fillUnitIndex: any, numTriggers: any)` | 624 | ✍ Refreshes the refill activatable when a fill trigger becomes available. |
| `Consumable:onRemovedFillUnitTrigger(numTriggers: any)` | 630 | ✍ Refreshes the refill activatable when a fill trigger is removed. |
| `Consumable:getConsumableVariationIndexByFillUnitIndex(fillUnitIndex: any)` | 636 | ✍ Returns the variation index of the first filled storage slot of the type using that fill unit, else the last consumed variation, or nil if no type matches. |
| `Consumable:setConsumableSlotVariationIndex(typeIndex: any, slotIndex: any, variationIndex: any)` | 657 | ✍ Sets a storage slot's variation (0 = empty), replacing its mesh with the one from `g_consumableManager` and updating washable, wearable and tension belt nodes. Marks the slot dirty and raises the vehicle dirty flag. |
| `Consumable:updateConsumable(typeName: any, delta: any, consumingInProgress: any, fillConsumingSlots: any)` | 724 | ✍ Core update: adds `delta` to the consuming level and optionally pulls a new unit from the fill unit. It refreshes meshes, shader parameters, scale, animation targets, object changes and the displayed fill level, raises `onConsumableVariationChanged`, and flags the sync. |
| `Consumable:getConsumableIsAvailable(typeName: any)` | 870 | ✍ Returns true if the named type still has consuming material left, or true when the type name is unknown. |
| `Consumable:getShowConsumableEmptyWarning(typeName: any)` | 882 | ✍ Returns true if the named type's consuming level is exactly zero, false for unknown types. |
| `Consumable:getCustomFillTriggerSpeedFactor(fillTrigger: any, fillUnitIndex: any, fillType: any)` | 894 | ✍ Returns 1 normally, or `math.huge` once all storage slots are full on a type with consuming slots, so the consuming slots fill instantly. |
| `Consumable:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, ...: any)` | 918 | ✍ Override. For positive deltas, caps the added amount to the room left (storage slots plus unconsumed part of consuming slots) before calling the parent. |
| `Consumable:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, ...: any)` | 938 | ✍ Override. For consumable fill units, returns slot-based free capacity; consuming slots cannot be refilled until fully consumed when storage slots exist. Other units use the parent. |
| `Consumable:collectPalletTensionBeltNodes(superFunc: any, nodes: any)` | 959 | ✍ Override. After the parent, appends the tension belt meshes of all storage slots to the node list. |
| `Consumable.updateActivatable(self: any)` | 976 | ✍ Adds the refill activatable if any type is empty and allows the refill dialog, and no fill trigger is nearby; otherwise removes it. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onConsumableVariationChanged` | 83 |
| registerFunction | `getConsumableVariationIndexByFillUnitIndex` | 90 |
| registerFunction | `setConsumableSlotVariationIndex` | 91 |
| registerFunction | `updateConsumable` | 92 |
| registerFunction | `getConsumableIsAvailable` | 93 |
| registerFunction | `getShowConsumableEmptyWarning` | 94 |
| registerFunction | `getCustomFillTriggerSpeedFactor` | 95 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 102 |
| registerOverwrittenFunction | `getFillUnitFreeCapacity` | 103 |
| registerOverwrittenFunction | `collectPalletTensionBeltNodes` | 104 |
| registerEventListener | `onLoad` | 111 |
| registerEventListener | `onPostLoad` | 112 |
| registerEventListener | `onDelete` | 113 |
| registerEventListener | `onReadStream` | 114 |
| registerEventListener | `onWriteStream` | 115 |
| registerEventListener | `onReadUpdateStream` | 116 |
| registerEventListener | `onWriteUpdateStream` | 117 |
| registerEventListener | `onDirtyMaskCleared` | 118 |
| registerEventListener | `onUpdate` | 119 |
| registerEventListener | `onDraw` | 120 |
| registerEventListener | `onFillUnitFillLevelChanged` | 121 |
| registerEventListener | `onFillUnitIsFillingStateChanged` | 122 |
| registerEventListener | `onAddedFillUnitTrigger` | 123 |
| registerEventListener | `onRemovedFillUnitTrigger` | 124 |
