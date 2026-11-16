---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FruitExtraObjects.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function FruitExtraObjects.prerequisitesPresent(specializations) end

--- Declares the fruitExtraObjects XML nodes under vehicle.cutter and vehicle.mower, and the savegame keys lastFruitType and lastFillType.
function FruitExtraObjects.initSpecialization() end

--- Registers the attributes of a fruitExtraObjects block under the given base path: per-object node, animation, speed, isDefault, fruitType, fillType, plus hideOnDetach and hideOnMount.
---@param schema any
---@param basePath any
function FruitExtraObjects.registerXMLPaths(schema, basePath) end

--- Registers loadFruitExtraObjectFromXML, getFruitExtraObjectTypeData and updateFruitExtraObjects on the vehicle type.
---@param vehicleType table
function FruitExtraObjects.registerFunctions(vehicleType) end

--- Empty: this specialization overrides no function.
---@param vehicleType table
function FruitExtraObjects.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to post load, dynamic mount type change, pre attach and post detach events.
---@param vehicleType table
function FruitExtraObjects.registerEventListeners(vehicleType) end

--- Client only: loads the extra objects from the cutter and mower XML blocks (one default object allowed), reads hideOnDetach/hideOnMount, restores the last fruit and fill type from the savegame and refreshes. Removes its listeners on servers or when no object exists (it names onLoadFinished, which is not registered here).
---@param savegame table
function FruitExtraObjects:onPostLoad(savegame) end

--- Writes the last fruit type and last fill type names to the savegame when set.
---@param xmlFile any
---@param key any
---@param usedModNames any
function FruitExtraObjects:saveToXMLFile(xmlFile, key, usedModNames) end

--- Calls updateFruitExtraObjects when the dynamic mount state changes.
---@param dynamicMountType any
---@param mountObject any
function FruitExtraObjects:onDynamicMountTypeChanged(dynamicMountType, mountObject) end

--- Calls updateFruitExtraObjects just before the vehicle is attached.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function FruitExtraObjects:onPreAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Calls updateFruitExtraObjects after the vehicle has been detached.
---@param attacherVehicle table
---@param implement table
function FruitExtraObjects:onPostDetach(attacherVehicle, implement) end

--- Loads one extra object (node hidden at load, animation, speed, isDefault, fruit type, fill type). Returns false with a warning if it has neither a type nor isDefault, or both.
---@param xmlFile any
---@param key any
---@param extraObject any
function FruitExtraObjects:loadFruitExtraObjectFromXML(xmlFile, key, extraObject) end

--- Default hook returning nil, nil (fruit type, fill type); meant to be overridden by the specialization that knows the current crop, such as a cutter or mower.
function FruitExtraObjects:getFruitExtraObjectTypeData() end

--- Picks the extra object matching the current (or last known) fruit or fill type, falling back to the default one, hides it when detached or mounted if configured, and swaps visibility and animations accordingly.
function FruitExtraObjects:updateFruitExtraObjects() end
