---@meta
-- FS25 1.25.1.0 : vehicles/VehicleSystem.lua (generated stub, FS25 Lua Atlas)

--- Management class (not a specialization): global registry of all vehicles in the game (vehicles, vehicleByUniqueId, enterables, interactiveVehicles, attacher joints), XML loading/saving of vehicles and debug console commands. Instance created by the mission (exact access, e.g. g_currentMission.vehicleSystem, lives in FSBaseMission/Mission00, absent from the dump: UNVERIFIED). WEATHER KEY POINT: VehicleSystem:update(dt) (VehicleSystem.lua:~137-175) is the ONLY place in vanilla (among the files read) that drives vehicle WETNESS: server side only (g_server ~= nil), it reads weather:getRainFallScale(), then, if > 0.1, weather:getTimeSinceLastRain() and weather:getCurrentTemperature(); if time since last rain < 30 and temperature > 0, it calls for each present vehicle (outside the showroom, with updateWetness) vehicle:updateWetness(true, dt x effective time scale) when the vehicle is outdoors (indoorMask:getIsIndoorAtWorldPosition(x, z) at the rootNode position) and updateWetness(false, ...) when it is indoors (hence drying under shelter), keeping the wetVehicles table up to date. When rainScale <= 0.1 and wetVehicles is not empty, all wet vehicles dry (updateWetness(false)) until none is wet. Note: if rainScale > 0.1 but the condition (time since rain < 30 AND temperature > 0) is false, no branch dries or wets anything (apparent logic gap; not verified in game). The time scale comes from g_currentMission:getEffectiveTimeScale() (body absent from the dump: UNVERIFIED): this is therefore where pause/time acceleration is taken into account for wetness. Units and ranges of the weather values: Weather implementation absent from the dump, UNVERIFIED. No wind reading here. NETWORK: the registry exists on every machine; the wetness update and the save/load are server side (loading requires a server for most console commands). The resulting wetness values are then synchronised by Washable. Loading: asynchronous via g_asyncTaskManager and VehicleLoadingData; vehicles are added to the physics only once all are loaded (loadVehicleFinished). Extension points for a modder: override VehicleSystem:update (global, not registered via SpecializationUtil) to change the wetting rule or take other sources into account; read vehicles / wetVehicles / enterables to enumerate vehicles without a global scan; subscribe to the MessageType.VEHICLE_ADDED / VEHICLE_REMOVED messages published by addVehicle / removeVehicle.
---@class VehicleSystem
VehicleSystem = {}

--- Creates the registry (tables vehicles, wetVehicles, enterables, interactiveVehicles, joints, pending loads), declares the console commands (some server-only or with g_addCheatCommands / g_addTestCommands) and subscribes to BuyVehicleEvent.
---@param mission any
---@param customMt any
function VehicleSystem.new(mission, customMt) end

--- Cancels pending loads, deletes all vehicles, empties the tables, unsubscribes the messages and removes the console commands.
function VehicleSystem:delete() end

--- Deletes all registered vehicles and returns their count.
function VehicleSystem:deleteAll() end

--- Per frame. Optionally loads the next debug vehicle; on the server, applies the wetness logic described in the module: reading rain, time since last rain and temperature, wetting outdoor vehicles, drying vehicles under shelter or once the rain is over, with dt x effective time scale.
---@param dt any
function VehicleSystem:update(dt) end

--- Calls drawUIInfo for each enterable vehicle (interface information).
function VehicleSystem:draw() end

--- Registers a vehicle (checks the type and the uniqueness of the unique id, generating one if needed), adds it to wetVehicles if it is already wet and publishes VEHICLE_ADDED.
---@param vehicle any
function VehicleSystem:addVehicle(vehicle) end

--- Removes a vehicle from the tables (including wetVehicles) and publishes VEHICLE_REMOVED.
---@param vehicle any
function VehicleSystem:removeVehicle(vehicle) end

--- Returns the vehicle associated with a unique id.
---@param uniqueId any
function VehicleSystem:getVehicleByUniqueId(uniqueId) end

--- Records a vehicle load in progress.
---@param vehicleLoadingData any
function VehicleSystem:addPendingVehicleLoad(vehicleLoadingData) end

--- Removes a finished vehicle load.
---@param vehicleLoadingData any
function VehicleSystem:removePendingVehicleLoad(vehicleLoadingData) end

--- True if all vehicles are synchronised and no load is pending.
function VehicleSystem:canStartMission() end

--- Adds a vehicle to the list of enterable vehicles.
---@param vehicle any
function VehicleSystem:addEnterableVehicle(vehicle) end

--- Removes an enterable vehicle and readjusts the index of the last used vehicle (for the switch key).
---@param vehicle any
function VehicleSystem:removeEnterableVehicle(vehicle) end

--- Records the index of the vehicle the player entered.
---@param vehicle any
function VehicleSystem:setEnteredVehicle(vehicle) end

--- Finds the next enterable and usable (tabbable) vehicle for a step (+1 or -1): the last used vehicle when the player is on foot with a positive step, the last in the list with a negative step.
---@param currentVehicle any
---@param delta any
function VehicleSystem:getNextEnterableVehicle(currentVehicle, delta) end

--- Registers an attacher joint with its world position and returns the info structure.
---@param vehicle any
---@param inputAttacherJointIndex any
---@param inputAttacherJoint any
function VehicleSystem:registerInputAttacherJoint(vehicle, inputAttacherJointIndex, inputAttacherJoint) end

--- Updates the world position of a registered attacher joint.
---@param inputAttacherJointInfo any
function VehicleSystem:updateInputAttacherJoint(inputAttacherJointInfo) end

--- Removes a registered attacher joint.
---@param inputAttacherJointInfo any
function VehicleSystem:removeInputAttacherJoint(inputAttacherJointInfo) end

--- Marks a vehicle as interactive.
---@param vehicle any
function VehicleSystem:addInteractiveVehicle(vehicle) end

--- Removes a vehicle from the interactive vehicles.
---@param vehicle any
function VehicleSystem:removeInteractiveVehicle(vehicle) end

--- Creates the vehicles save XML file and writes into it all vehicles that must be saved.
---@param xmlFilename any
---@param usedModNames any
function VehicleSystem:save(xmlFilename, usedModNames) end

--- Writes to the file the vehicles for which getNeedsSaving is true.
---@param vehicles any
---@param xmlFile any
---@param usedModNames any
function VehicleSystem:saveToXML(vehicles, xmlFile, usedModNames) end

--- Writes a vehicle (mod name, network filename) then delegates to vehicle:saveToXMLFile (hence to the specializations, including Washable).
---@param vehicle any
---@param xmlFile any
---@param index any
---@param i any
---@param usedModNames any
function VehicleSystem:saveVehicleToXML(vehicle, xmlFile, index, i, usedModNames) end

--- Opens the vehicles save XML and starts loading; if it is missing, calls the callback again with an error.
---@param xmlFilename any
---@param asyncCallbackFunction any
---@param asyncCallbackObject any
---@param asyncCallbackArguments any
---@param resetVehicles any
function VehicleSystem:load(xmlFilename, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments, resetVehicles) end

--- Schedules the asynchronous loading of each vehicle of an XML file (queued if a load is in progress).
---@param xmlFile any
---@param asyncCallbackFunction any
---@param asyncCallbackObject any
---@param asyncCallbackArguments any
---@param resetVehicles any
---@param keepPosition any
function VehicleSystem:loadFromXMLFile(xmlFile, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments, resetVehicles, keepPosition) end

--- Loads a vehicle: checks it is allowed (default ownership, competitive, solo), finds the store item, handles available slots (refunds otherwise) and starts VehicleLoadingData.
---@param xmlFile any
---@param key any
---@param defaultItemsToSPFarm any
---@param resetVehicles any
---@param keepPosition any
function VehicleSystem:loadVehicleFromXML(xmlFile, key, defaultItemsToSPFarm, resetVehicles, keepPosition) end

--- On each load end: accumulates the vehicles; when all are done, adds them to the physics, calls the callback and moves on to the queue of pending loads.
---@param vehicles any
---@param loadingState any
function VehicleSystem:loadVehicleFinished(vehicles, loadingState) end

--- Starts the next pending savegame load, if any.
function VehicleSystem:updatePendingSavegameLoadings() end

--- After a purchase: counts the motorized and attachable vehicles of the local farm (excluding big bags) to unlock achievements.
---@param errorCode any
---@param leaseVehicle any
---@param price any
function VehicleSystem:onVehicleBuyEvent(errorCode, leaseVehicle, price) end

--- Finds the vehicle from a physics node and its sub-node (handles compounds) via g_currentMission.nodeToObject; nil if it is not a Vehicle.
---@param nodeId any
---@param subShapeId any
function VehicleSystem:getVehicleByNodeId(nodeId, subShapeId) end

--- Console command: enables or toggles the display of the vehicle-camera distance (g_showVehicleDistance).
---@param active any
function VehicleSystem:consoleCommandShowVehicleDistance(active) end

--- Console command (server): reloads the controlled vehicle or those within a given radius. Not read in detail.
---@param resetVehicle any
---@param radius any
function VehicleSystem:consoleCommandReloadVehicle(resetVehicle, radius) end

--- Console command (cheat): adds a pallet of a given fill type. Not read in detail.
---@param palletFillTypeName any
---@param amount any
---@param worldX any
---@param worldZ any
function VehicleSystem:consoleCommandAddPallet(palletFillTypeName, amount, worldX, worldZ) end

--- Console command (cheat): sets the fuel of the controlled vehicle. Not read in detail.
---@param fuelLevel any
function VehicleSystem:consoleCommandSetFuel(fuelLevel) end

--- Console command (cheat): sets the engine temperature. Not read in detail.
---@param temperature any
function VehicleSystem:consoleCommandSetMotorTemperature(temperature) end

--- Console command (cheat): adds content to a fill unit. Not read in detail.
---@param fillUnitIndex any
---@param fillTypeName any
---@param amount any
function VehicleSystem:consoleCommandFillUnitAdd(fillUnitIndex, fillTypeName, amount) end

--- Console command (cheat): sets the operating time. Not read in detail.
---@param operatingTime any
function VehicleSystem:consoleCommandSetOperatingTime(operatingTime) end

--- Console command (cheat, server): adds an amount of dirt to all vehicles of the controlled vehicle's chain via setDirtAmount. Useful for testing mud.
---@param amount any
function VehicleSystem:consoleCommandAddDirtAmount(amount) end

--- Console command (cheat): adds wear. Not read in detail.
---@param amount any
function VehicleSystem:consoleCommandAddWearAmount(amount) end

--- Console command (cheat, server): adds an amount of wetness (addWetnessAmount) to all vehicles of the controlled vehicle's chain. Useful for testing the wetness rendering without rain.
---@param amount any
function VehicleSystem:consoleCommandAddWetnessAmount(amount) end

--- Console command (cheat): adds damage. Not read in detail.
---@param amount any
function VehicleSystem:consoleCommandAddDamageAmount(amount) end

--- Console command (cheat): loads all store vehicles for testing. Not read in detail.
---@param loadConfigs any
---@param modsOnly any
---@param palletsOnly any
---@param verbose any
function VehicleSystem:consoleCommandLoadAllVehicles(loadConfigs, modsOnly, palletsOnly, verbose) end

--- Moves on to the next vehicle of the test load (called from update). Not read in detail.
function VehicleSystem:consoleCommandLoadAllVehiclesNext() end

--- Console command (test): removes all vehicles. Not read in detail.
function VehicleSystem:consoleCommandVehicleRemoveAll() end

--- Console command (test): enables or disables random load failure. Not read in detail.
function VehicleSystem:consoleCommandVehicleToggleRandomFail() end

--- Console command (test): exports vehicle sets. Not read in detail.
function VehicleSystem:consoleCommandExportVehicleSets() end
