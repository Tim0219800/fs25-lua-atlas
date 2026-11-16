---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandry.lua (generated stub, FS25 Lua Atlas)

--- Base placeable specialization shared by all animal husbandries. It optionally loads an UnloadingStation, a Storage and a LoadingStation from the `placeable.husbandry` XML, registers them with the mission storage system and keeps the husbandry listed in husbandrySystem. Every hour on the server it calls updateFeeding, updateProduction and updateOutput (stubs here, meant to be overridden) and moves a global production factor up or down around a threshold. It raises the events onHusbandryFillLevelChanged and onFinishedFeeding.
---@class PlaceableHusbandry
PlaceableHusbandry = {}

--- Always returns true: this specialization has no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableHusbandry.prerequisitesPresent(specializations) end

--- Registers the placeable events onHusbandryFillLevelChanged and onFinishedFeeding.
---@param placeableType any
function PlaceableHusbandry.registerEvents(placeableType) end

--- Registers the specialization's functions on the placeable type: station callbacks, feeding and production updates, info getters and the fill level helpers. Note: getProductionFactor is registered but no function of that name exists in this file, so it is registered as nil.
---@param placeableType any
function PlaceableHusbandry.registerFunctions(placeableType) end

--- Overrides setOwnerFarmId, collectPickObjects, getCanBePlacedAt, canBuy and getNeedHourChanged of the placeable.
---@param placeableType any
function PlaceableHusbandry.registerOverwrittenFunctions(placeableType) end

--- Subscribes the specialization to onLoad, onDelete, onFinalizePlacement, the four stream events, onHourChanged and onBuy.
---@param placeableType any
function PlaceableHusbandry.registerEventListeners(placeableType) end

--- Registers the `.husbandry` XML paths: saveId, hasStatistics, the production threshold and per-hour increase and decrease rates, plus the nested unloadingStation, storage and loadingStation schemas.
---@param schema any
---@param basePath any
function PlaceableHusbandry.registerXMLPaths(schema, basePath) end

--- Registers the savegame paths: module names, globalProductionFactor, productionFactor and the storage savegame schema.
---@param schema any
---@param basePath any
function PlaceableHusbandry.registerSavegameXMLPaths(schema, basePath) end

--- Creates the unloading station, storage and loading station present in the XML (on failure it logs an error and sets the placeable loading state to ERROR) and reads the production threshold (default 0.25, clamped 0.01 to 0.99) and the hourly increase and decrease. Sets up the fill level callback that raises the fill level event.
---@param savegame table
function PlaceableHusbandry:onLoad(savegame) end

--- Removes and deletes the stations and storage from the storage system, removes the liquid manure loading station if supported, unsubscribes the storage messages and removes the placeable from husbandrySystem.
function PlaceableHusbandry:onDelete() end

--- Subscribes to the storage added or removed messages, registers the stations and storage with the storage system (owner farm EVERYONE becomes NOBODY), links them, adds usable storage extensions in range, and adds the husbandry to husbandrySystem.
function PlaceableHusbandry:onFinalizePlacement() end

--- Client join: reads each existing station and storage with its object id and finishes object registration, then reads the two production factors as bytes divided by 255.
---@param streamId any
---@param connection any
function PlaceableHusbandry:onReadStream(streamId, connection) end

--- Server join: writes each station and storage with its object id and registers the object in the stream, then both production factors scaled to a byte (times 255).
---@param streamId any
---@param connection any
function PlaceableHusbandry:onWriteStream(streamId, connection) end

--- Reads the two production factors as bytes divided by 100. Note: the join stream uses a scale of 255 while update streams use 100, so the two paths are inconsistent.
---@param streamId any
---@param connection any
function PlaceableHusbandry:onReadUpdateStream(streamId, connection) end

--- Writes the two production factors as bytes scaled by 100 (see the scale note on onReadUpdateStream).
---@param streamId any
---@param connection any
function PlaceableHusbandry:onWriteUpdateStream(streamId, connection) end

--- Saves the storage (under `.storage`) and the global and current production factors to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandry:saveToXMLFile(xmlFile, key, usedModNames) end

--- Loads the storage and the two production factors from the savegame, keeping current values as defaults.
---@param xmlFile any
---@param key any
function PlaceableHusbandry:loadFromXMLFile(xmlFile, key) end

--- Override: after the parent call, propagates the owner farm to storage and both stations (EVERYONE maps to NOBODY) and attaches storage extensions in range for a real owner.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableHusbandry:setOwnerFarmId(superFunc, farmId, noEventSend) end

--- Override: skips nodes that are the unloading station's exact-fill root nodes or the loading station's trigger nodes, so they are not picked as the placeable; others go to the parent.
---@param superFunc any
---@param node any
---@param target any
function PlaceableHusbandry:collectPickObjects(superFunc, node, target) end

--- Override: returns false with a too-many-husbandries message when the husbandry limit is reached, otherwise defers to the parent. Note: farmId is not passed to the parent.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableHusbandry:getCanBePlacedAt(superFunc, x, y, z, farmId) end

--- Override: returns false with a too-many-husbandries message when the husbandry limit is reached, otherwise defers to the parent.
---@param superFunc any
function PlaceableHusbandry:canBuy(superFunc) end

--- Server only. Runs feeding, raises onFinishedFeeding, computes the production factor and moves the global factor up (above the threshold, rate increasePerHour) or down (below, rate decreasePerHour), clamped to 0..1. It then calls updateOutput and flags the update stream.
---@param currentHour any
function PlaceableHusbandry:onHourChanged(currentHour) end

--- After purchase, attaches usable storage extensions in range to the unloading station and, if present, the loading station.
function PlaceableHusbandry:onBuy() end

--- Override that always returns true so the placeable receives hour change events.
---@param superFunc any
function PlaceableHusbandry:getNeedHourChanged(superFunc) end

--- Default feeding step: returns a food factor of 1. Specializations override it with real feeding logic.
function PlaceableHusbandry:updateFeeding() end

--- Default production step: stores the food factor as the current production factor and returns it. Called hourly on the server.
---@param foodFactor any
function PlaceableHusbandry:updateProduction(foodFactor) end

--- Empty hook called hourly with the food, production and global production factors; overridden by subclasses to produce output.
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandry:updateOutput(foodFactor, productionFactor, globalProductionFactor) end

--- Returns the slowly changing global production factor (0 to 1).
function PlaceableHusbandry:getGlobalProductionFactor() end

--- Default condition info list for the animal menu: an empty table. Overridden or extended by other specializations.
function PlaceableHusbandry:getConditionInfos() end

--- Default food info list: an empty table, to be overridden.
function PlaceableHusbandry:getFoodInfos() end

--- Default animal info list: an empty table, to be overridden.
function PlaceableHusbandry:getAnimalInfos() end

--- Default description text for an animal cluster: an empty string, to be overridden.
---@param cluster any
function PlaceableHusbandry:getAnimalDescription(cluster) end

--- Returns the capacity of the unloading station for a fill type and farm (default owner farm), or 0 without an unloading station.
---@param fillTypeIndex any
---@param farmId any
function PlaceableHusbandry:getHusbandryCapacity(fillTypeIndex, farmId) end

--- Returns the free capacity of the unloading station for a fill type and farm, or 0 without an unloading station.
---@param fillTypeIndex any
---@param farmId any
function PlaceableHusbandry:getHusbandryFreeCapacity(fillTypeIndex, farmId) end

--- Adds fill to the unloading station from a tool and returns the amount applied; returns 0 without an unloading station. Parameters are passed through to the station.
---@param farmId any
---@param deltaFillLevel any
---@param fillTypeIndex any
---@param fillPositionData any
---@param toolType any
---@param extraAttributes any
function PlaceableHusbandry:addHusbandryFillLevelFromTool(farmId, deltaFillLevel, fillTypeIndex, fillPositionData, toolType, extraAttributes) end

--- Removes fill via the loading station and returns the remaining delta; without a loading station it returns the delta unchanged.
---@param farmId integer
---@param deltaFillLevel number
---@param fillTypeIndex integer
---@return number
function PlaceableHusbandry:removeHusbandryFillLevel(farmId, deltaFillLevel, fillTypeIndex) end

--- Returns the unloading station fill level for a fill type and farm, or 0 without an unloading station.
---@param fillTypeIndex any
---@param farmId any
function PlaceableHusbandry:getHusbandryFillLevel(fillTypeIndex, farmId) end

--- Returns whether the unloading station supports the fill type; false without an unloading station.
---@param fillTypeIndex any
function PlaceableHusbandry:getHusbandryIsFillTypeSupported(fillTypeIndex) end

--- Message callback: if the loading station is this husbandry's, listens to the storage's fill level changes with the specialization callback.
---@param storage any
---@param loadingStation any
function PlaceableHusbandry:onAddedStorageToLoadingStation(storage, loadingStation) end

--- Message callback: if the loading station is this husbandry's, stops listening to the storage's fill level changes.
---@param storage any
---@param loadingStation any
function PlaceableHusbandry:onRemovedStorageFromLoadingStation(storage, loadingStation) end

--- Message callback: if the unloading station is this husbandry's, listens to the storage's fill level changes with the specialization callback.
---@param storage any
---@param unloadingStation any
function PlaceableHusbandry:onAddedStorageToUnloadingStation(storage, unloadingStation) end

--- Message callback: if the unloading station is this husbandry's, stops listening to the storage's fill level changes.
---@param storage any
---@param unloadingStation any
function PlaceableHusbandry:onRemovedStorageFromUnloadingStation(storage, unloadingStation) end
