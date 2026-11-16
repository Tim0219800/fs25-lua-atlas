---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WoodContainer.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function WoodContainer.prerequisitesPresent(specializations) end

--- Adds the `woodContainer` vehicle configuration type, registers XML paths (base and per configuration), the log-count sound settings, and the two savegame attributes for quality volumes.
function WoodContainer.initSpecialization() end

--- Registers under a base key: fold limits, `#fillUnitIndex`, `#targetLength` (ideal log length, default 12), `#triggerNode` and the push animation name and speed scale.
---@param schema any
---@param baseKey any
function WoodContainer.registerXMLPaths(schema, baseKey) end

--- Registers `getPalletUnloadTriggerExtraSellPrice`, `getIsWoodContainerFillingAllowed` and `onWoodContainerTriggerCallback` on the vehicle type.
---@param vehicleType any
function WoodContainer.registerFunctions(vehicleType) end

--- Overrides `getInfoBoxTitle` and `addFillUnitFillLevel` of the vehicle.
---@param vehicleType any
function WoodContainer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete and onFillUnitFillLevelChanged.
---@param vehicleType any
function WoodContainer.registerEventListeners(vehicleType) end

--- Picks the XML section of the selected `woodContainer` configuration (falling back to the base key) and reads limits, fill unit, target length, trigger and push animation. On the server it registers the trigger callback; on the client it loads the load sample. Restores saved quality volumes.
---@param savegame any
function WoodContainer:onLoad(savegame) end

--- Removes the trigger node's trigger and deletes the sound samples.
function WoodContainer:onDelete() end

--- Writes the quality-weighted and total wood volumes to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function WoodContainer:saveToXMLFile(xmlFile, key, usedModNames) end

--- For the container's fill unit: on the client plays the load sound when the apparent log count changes while filling; and plays the push animation forward when the level leaves zero or backward when it returns to zero.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function WoodContainer:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Returns the vehicle's price (`getPrice()`), used as an extra sell price by pallet unload triggers.
function WoodContainer:getPalletUnloadTriggerExtraSellPrice() end

--- Returns false if the vehicle is foldable and its fold animation time lies outside the configured min/max limits; otherwise true.
function WoodContainer:getIsWoodContainerFillingAllowed() end

--- Overrides the info box title with the localized `storeItem_shippingContainer` text, ignoring `superFunc`.
---@param superFunc any
function WoodContainer:getInfoBoxTitle(superFunc) end

--- Wraps the parent call. When removing wood (negative delta) and a total volume is tracked, the returned delta is scaled by the quality-to-total volume ratio, so low-quality wood yields less. The tracked volumes themselves are not reduced here.
---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function WoodContainer:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

--- Server-side trigger handler. If filling is allowed, takes a valid non-transport split shape with a positive price, adds its volume to the fill unit as wood, updates quality volumes, deletes the shape and broadcasts `WoodContainerWrongLengthEvent` if its length is more than 1 m from the target. Transport trees trigger a blinking warning.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function WoodContainer:onWoodContainerTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Returns three values for a split shape: volume in liters, a quality scale (from bounding-box ratio, convex parts, length, attached branches, blended toward 1 by economic difficulty) and its longest bounding size.
---@param objectId any
---@param targetLength any
function WoodContainer.getSplitShapeInfo(objectId, targetLength) end
