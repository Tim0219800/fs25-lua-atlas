---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Consumable.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the vehicle type has the `FillUnit` specialization.
---@param specializations table
---@return boolean
function Consumable.prerequisitesPresent(specializations) end

--- Registers a shop configuration type per name in `Consumable.CONFIG_NAMES`, plus the XML schema under `vehicle.consumable` (types, slots, consuming animations, shader nodes, object changes) and the savegame schema.
function Consumable.initSpecialization() end

--- Registers the vehicle event `onConsumableVariationChanged`, raised when the consuming variation changes.
---@param vehicleType table
function Consumable.registerEvents(vehicleType) end

--- Registers six vehicle functions: variation lookup by fill unit, slot variation setter, `updateConsumable`, availability check, empty-warning check and the fill trigger speed factor.
---@param vehicleType table
function Consumable.registerFunctions(vehicleType) end

--- Overrides `addFillUnitFillLevel`, `getFillUnitFreeCapacity` and `collectPalletTensionBeltNodes`.
---@param vehicleType table
function Consumable.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post-load, delete, stream read/write, update stream, dirty mask cleared, update, draw and the fill unit events (level changed, filling state, trigger added or removed).
---@param vehicleType table
function Consumable.registerEventListeners(vehicleType) end

--- Reads each consumable type from XML (fill unit, slots, consuming settings, animations, object changes, shader nodes), skipping invalid ones with a warning. It sets the fill unit capacity to the slot count, applies configuration default names and creates the activatable.
---@param savegame table
function Consumable:onLoad(savegame) end

--- Restores consumed level, variation and storage slot variations from the savegame unless vehicles are reset. For a new vehicle not spawned empty, it fills the unit with the default consumable. Then refreshes the activatable.
---@param savegame table
function Consumable:onPostLoad(savegame) end

--- Removes the refill activatable from the activatable objects system.
function Consumable:onDelete() end

--- Saves, for each type, the name, consuming fill level and consuming variation name, plus the variation name of each storage slot.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Consumable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side: on the initial sync reads consuming level and variation, then each storage slot variation, and updates meshes and pallet straps.
---@param streamId any
---@param connection any
function Consumable:onReadStream(streamId, connection) end

--- Server side: writes the same consuming level, variation and storage slot variation data that `onReadStream` reads, in the same order.
---@param streamId any
---@param connection any
function Consumable:onWriteStream(streamId, connection) end

--- Client side: when the dirty flag is set, reads per-type consuming data and storage slot variations if flagged, applying them to the meshes.
---@param streamId any
---@param timestamp any
---@param connection any
function Consumable:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes per-type consuming data and all storage slot variations, each preceded by a bool telling whether it changed.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Consumable:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Resets the per-type and per-slot dirty markers after the dirty mask has been cleared.
function Consumable:onDirtyMaskCleared() end

--- Moves each dirty consuming animation toward its target time at its speed scale, wrapping the time at 1 or 0, and keeps the vehicle active until all animations reach their target.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Consumable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Shows a blinking warning for the first type with consuming slots when both its consuming level and fill unit are at zero and the empty-warning check allows it.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Consumable:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server only. When the type's fill unit changes, fills or empties storage slots one by one. The variation is taken from the fill trigger source, then the consuming variation, then the default, and consuming slots are refilled if there are no storage slots.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Consumable:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- When filling ends, refills the consuming slots for types whose consuming level is zero, otherwise only refreshes the display.
---@param isFilling any
function Consumable:onFillUnitIsFillingStateChanged(isFilling) end

--- Refreshes the refill activatable when a fill trigger becomes available.
---@param fillTypeIndex any
---@param fillUnitIndex any
---@param numTriggers any
function Consumable:onAddedFillUnitTrigger(fillTypeIndex, fillUnitIndex, numTriggers) end

--- Refreshes the refill activatable when a fill trigger is removed.
---@param numTriggers any
function Consumable:onRemovedFillUnitTrigger(numTriggers) end

--- Returns the variation index of the first filled storage slot of the type using that fill unit, else the last consumed variation, or nil if no type matches.
---@param fillUnitIndex any
function Consumable:getConsumableVariationIndexByFillUnitIndex(fillUnitIndex) end

--- Sets a storage slot's variation (0 = empty), replacing its mesh with the one from `g_consumableManager` and updating washable, wearable and tension belt nodes. Marks the slot dirty and raises the vehicle dirty flag.
---@param typeIndex any
---@param slotIndex any
---@param variationIndex any
function Consumable:setConsumableSlotVariationIndex(typeIndex, slotIndex, variationIndex) end

--- Core update: adds `delta` to the consuming level and optionally pulls a new unit from the fill unit. It refreshes meshes, shader parameters, scale, animation targets, object changes and the displayed fill level, raises `onConsumableVariationChanged`, and flags the sync.
---@param typeName any
---@param delta any
---@param consumingInProgress any
---@param fillConsumingSlots any
function Consumable:updateConsumable(typeName, delta, consumingInProgress, fillConsumingSlots) end

--- Returns true if the named type still has consuming material left, or true when the type name is unknown.
---@param typeName any
function Consumable:getConsumableIsAvailable(typeName) end

--- Returns true if the named type's consuming level is exactly zero, false for unknown types.
---@param typeName any
function Consumable:getShowConsumableEmptyWarning(typeName) end

--- Returns 1 normally, or `math.huge` once all storage slots are full on a type with consuming slots, so the consuming slots fill instantly.
---@param fillTrigger any
---@param fillUnitIndex any
---@param fillType any
function Consumable:getCustomFillTriggerSpeedFactor(fillTrigger, fillUnitIndex, fillType) end

--- Override. For positive deltas, caps the added amount to the room left (storage slots plus unconsumed part of consuming slots) before calling the parent.
---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
function Consumable:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, ...) end

--- Override. For consumable fill units, returns slot-based free capacity; consuming slots cannot be refilled until fully consumed when storage slots exist. Other units use the parent.
---@param superFunc any
---@param fillUnitIndex any
function Consumable:getFillUnitFreeCapacity(superFunc, fillUnitIndex, ...) end

--- Override. After the parent, appends the tension belt meshes of all storage slots to the node list.
---@param superFunc any
---@param nodes any
function Consumable:collectPalletTensionBeltNodes(superFunc, nodes) end

--- Adds the refill activatable if any type is empty and allows the refill dialog, and no fill trigger is nearby; otherwise removes it.
---@param self any
function Consumable.updateActivatable(self) end
