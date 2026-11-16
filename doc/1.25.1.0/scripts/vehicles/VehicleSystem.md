# vehicles/VehicleSystem.lua

*[Version française](../../fr/scripts/vehicles/VehicleSystem.md)*

Source: `dataS/scripts/vehicles/VehicleSystem.lua` — FS25 1.25.1.0

✍ Management class (not a specialization): global registry of all vehicles in the game (vehicles, vehicleByUniqueId, enterables, interactiveVehicles, attacher joints), XML loading/saving of vehicles and debug console commands. Instance created by the mission (exact access, e.g. g_currentMission.vehicleSystem, lives in FSBaseMission/Mission00, absent from the dump: UNVERIFIED). WEATHER KEY POINT: VehicleSystem:update(dt) (VehicleSystem.lua:~137-175) is the ONLY place in vanilla (among the files read) that drives vehicle WETNESS: server side only (g_server ~= nil), it reads weather:getRainFallScale(), then, if > 0.1, weather:getTimeSinceLastRain() and weather:getCurrentTemperature(); if time since last rain < 30 and temperature > 0, it calls for each present vehicle (outside the showroom, with updateWetness) vehicle:updateWetness(true, dt x effective time scale) when the vehicle is outdoors (indoorMask:getIsIndoorAtWorldPosition(x, z) at the rootNode position) and updateWetness(false, ...) when it is indoors (hence drying under shelter), keeping the wetVehicles table up to date. When rainScale <= 0.1 and wetVehicles is not empty, all wet vehicles dry (updateWetness(false)) until none is wet. Note: if rainScale > 0.1 but the condition (time since rain < 30 AND temperature > 0) is false, no branch dries or wets anything (apparent logic gap; not verified in game). The time scale comes from g_currentMission:getEffectiveTimeScale() (body absent from the dump: UNVERIFIED): this is therefore where pause/time acceleration is taken into account for wetness. Units and ranges of the weather values: Weather implementation absent from the dump, UNVERIFIED. No wind reading here. NETWORK: the registry exists on every machine; the wetness update and the save/load are server side (loading requires a server for most console commands). The resulting wetness values are then synchronised by Washable. Loading: asynchronous via g_asyncTaskManager and VehicleLoadingData; vehicles are added to the physics only once all are loaded (loadVehicleFinished). Extension points for a modder: override VehicleSystem:update (global, not registered via SpecializationUtil) to change the wetting rule or take other sources into account; read vehicles / wetVehicles / enterables to enumerate vehicles without a global scan; subscribe to the MessageType.VEHICLE_ADDED / VEHICLE_REMOVED messages published by addVehicle / removeVehicle.

- **VehicleSystem** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleSystem.new(mission: any, customMt: any)` | 18 | ✍ Creates the registry (tables vehicles, wetVehicles, enterables, interactiveVehicles, joints, pending loads), declares the console commands (some server-only or with g_addCheatCommands / g_addTestCommands) and subscribes to BuyVehicleEvent. |
| `VehicleSystem:delete()` | 74 | ✍ Cancels pending loads, deletes all vehicles, empties the tables, unsubscribes the messages and removes the console commands. |
| `VehicleSystem:deleteAll()` | 126 | ✍ Deletes all registered vehicles and returns their count. |
| `VehicleSystem:update(dt: any)` | 152 | ✍ Per frame. Optionally loads the next debug vehicle; on the server, applies the wetness logic described in the module: reading rain, time since last rain and temperature, wetting outdoor vehicles, drying vehicles under shelter or once the rain is over, with dt x effective time scale. |
| `VehicleSystem:draw()` | 202 | ✍ Calls drawUIInfo for each enterable vehicle (interface information). |
| `VehicleSystem:addVehicle(vehicle: any)` | 221 | ✍ Registers a vehicle (checks the type and the uniqueness of the unique id, generating one if needed), adds it to wetVehicles if it is already wet and publishes VEHICLE_ADDED. |
| `VehicleSystem:removeVehicle(vehicle: any)` | 254 | ✍ Removes a vehicle from the tables (including wetVehicles) and publishes VEHICLE_REMOVED. |
| `VehicleSystem:getVehicleByUniqueId(uniqueId: any)` | 271 | ✍ Returns the vehicle associated with a unique id. |
| `VehicleSystem:addPendingVehicleLoad(vehicleLoadingData: any)` | 277 | ✍ Records a vehicle load in progress. |
| `VehicleSystem:removePendingVehicleLoad(vehicleLoadingData: any)` | 283 | ✍ Removes a finished vehicle load. |
| `VehicleSystem:canStartMission()` | 293 | ✍ True if all vehicles are synchronised and no load is pending. |
| `VehicleSystem:addEnterableVehicle(vehicle: any)` | 309 | ✍ Adds a vehicle to the list of enterable vehicles. |
| `VehicleSystem:removeEnterableVehicle(vehicle: any)` | 315 | ✍ Removes an enterable vehicle and readjusts the index of the last used vehicle (for the switch key). |
| `VehicleSystem:setEnteredVehicle(vehicle: any)` | 324 | ✍ Records the index of the vehicle the player entered. |
| `VehicleSystem:getNextEnterableVehicle(currentVehicle: any, delta: any)` | 335 | ✍ Finds the next enterable and usable (tabbable) vehicle for a step (+1 or -1): the last used vehicle when the player is on foot with a positive step, the last in the list with a negative step. |
| `VehicleSystem:registerInputAttacherJoint(vehicle: any, inputAttacherJointIndex: any, inputAttacherJoint: any)` | 385 | ✍ Registers an attacher joint with its world position and returns the info structure. |
| `VehicleSystem:updateInputAttacherJoint(inputAttacherJointInfo: any)` | 401 | ✍ Updates the world position of a registered attacher joint. |
| `VehicleSystem:removeInputAttacherJoint(inputAttacherJointInfo: any)` | 408 | ✍ Removes a registered attacher joint. |
| `VehicleSystem:addInteractiveVehicle(vehicle: any)` | 414 | ✍ Marks a vehicle as interactive. |
| `VehicleSystem:removeInteractiveVehicle(vehicle: any)` | 420 | ✍ Removes a vehicle from the interactive vehicles. |
| `VehicleSystem:save(xmlFilename: any, usedModNames: any)` | 426 | ✍ Creates the vehicles save XML file and writes into it all vehicles that must be saved. |
| `VehicleSystem:saveToXML(vehicles: any, xmlFile: any, usedModNames: any)` | 436 | ✍ Writes to the file the vehicles for which getNeedsSaving is true. |
| `VehicleSystem:saveVehicleToXML(vehicle: any, xmlFile: any, index: any, i: any, usedModNames: any)` | 453 | ✍ Writes a vehicle (mod name, network filename) then delegates to vehicle:saveToXMLFile (hence to the specializations, including Washable). |
| `VehicleSystem:load(xmlFilename: any, asyncCallbackFunction: any, asyncCallbackObject: any, asyncCallbackArguments: any, resetVehicles: any)` | 471 | ✍ Opens the vehicles save XML and starts loading; if it is missing, calls the callback again with an error. |
| `VehicleSystem:loadFromXMLFile(xmlFile: any, asyncCallbackFunction: any, asyncCallbackObject: any, asyncCallbackArguments: any, resetVehicles: any, keepPosition: any)` | 487 | ✍ Schedules the asynchronous loading of each vehicle of an XML file (queued if a load is in progress). |
| `VehicleSystem:loadVehicleFromXML(xmlFile: any, key: any, defaultItemsToSPFarm: any, resetVehicles: any, keepPosition: any)` | 538 | ✍ Loads a vehicle: checks it is allowed (default ownership, competitive, solo), finds the store item, handles available slots (refunds otherwise) and starts VehicleLoadingData. |
| `VehicleSystem:loadVehicleFinished(vehicles: any, loadingState: any)` | 591 | ✍ On each load end: accumulates the vehicles; when all are done, adds them to the physics, calls the callback and moves on to the queue of pending loads. |
| `VehicleSystem:updatePendingSavegameLoadings()` | 623 | ✍ Starts the next pending savegame load, if any. |
| `VehicleSystem:onVehicleBuyEvent(errorCode: any, leaseVehicle: any, price: any)` | 634 | ✍ After a purchase: counts the motorized and attachable vehicles of the local farm (excluding big bags) to unlock achievements. |
| `VehicleSystem:getVehicleByNodeId(nodeId: any, subShapeId: any)` | 656 | ✍ Finds the vehicle from a physics node and its sub-node (handles compounds) via g_currentMission.nodeToObject; nil if it is not a Vehicle. |
| `VehicleSystem:consoleCommandShowVehicleDistance(active: any)` | 697 | ✍ Console command: enables or toggles the display of the vehicle-camera distance (g_showVehicleDistance). |
| `VehicleSystem:consoleCommandReloadVehicle(resetVehicle: any, radius: any)` | 703 | ✍ Console command (server): reloads the controlled vehicle or those within a given radius. Not read in detail. |
| `VehicleSystem:consoleCommandAddPallet(palletFillTypeName: any, amount: any, worldX: any, worldZ: any)` | 853 | ✍ Console command (cheat): adds a pallet of a given fill type. Not read in detail. |
| `VehicleSystem:consoleCommandSetFuel(fuelLevel: any)` | 961 | ✍ Console command (cheat): sets the fuel of the controlled vehicle. Not read in detail. |
| `VehicleSystem:consoleCommandSetMotorTemperature(temperature: any)` | 993 | ✍ Console command (cheat): sets the engine temperature. Not read in detail. |
| `VehicleSystem:consoleCommandFillUnitAdd(fillUnitIndex: any, fillTypeName: any, amount: any)` | 1019 | ✍ Console command (cheat): adds content to a fill unit. Not read in detail. |
| `VehicleSystem:consoleCommandSetOperatingTime(operatingTime: any)` | 1111 | ✍ Console command (cheat): sets the operating time. Not read in detail. |
| `VehicleSystem:consoleCommandAddDirtAmount(amount: any)` | 1139 | ✍ Console command (cheat, server): adds an amount of dirt to all vehicles of the controlled vehicle's chain via setDirtAmount. Useful for testing mud. |
| `VehicleSystem:consoleCommandAddWearAmount(amount: any)` | 1164 | ✍ Console command (cheat): adds wear. Not read in detail. |
| `VehicleSystem:consoleCommandAddWetnessAmount(amount: any)` | 1186 | ✍ Console command (cheat, server): adds an amount of wetness (addWetnessAmount) to all vehicles of the controlled vehicle's chain. Useful for testing the wetness rendering without rain. |
| `VehicleSystem:consoleCommandAddDamageAmount(amount: any)` | 1208 | ✍ Console command (cheat): adds damage. Not read in detail. |
| `VehicleSystem:consoleCommandLoadAllVehicles(loadConfigs: any, modsOnly: any, palletsOnly: any, verbose: any)` | 1230 | ✍ Console command (cheat): loads all store vehicles for testing. Not read in detail. |
| `VehicleSystem:consoleCommandLoadAllVehiclesNext()` | 1358 | ✍ Moves on to the next vehicle of the test load (called from update). Not read in detail. |
| `VehicleSystem:consoleCommandVehicleRemoveAll()` | 1439 | ✍ Console command (test): removes all vehicles. Not read in detail. |
| `VehicleSystem:consoleCommandVehicleToggleRandomFail()` | 1454 | ✍ Console command (test): enables or disables random load failure. Not read in detail. |
| `VehicleSystem:consoleCommandExportVehicleSets()` | 1462 | ✍ Console command (test): exports vehicle sets. Not read in detail. |

## Messages

- publishes `MessageType.VEHICLE_ADDED` (l.247)
- publishes `MessageType.VEHICLE_REMOVED` (l.266)
