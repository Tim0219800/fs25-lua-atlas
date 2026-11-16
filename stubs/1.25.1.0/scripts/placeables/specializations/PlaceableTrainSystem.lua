---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableTrainSystem.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that runs a train on a closed spline: it loads the train vehicles, moves them along the spline from the locomotive speed (server) or from interpolated network values (client), and hosts railroad crossings and callers. It also handles train rental per farm (hourly price billed daily or on return), an optional limited driving range tied to a selling station, and selling the cargo. Network sync uses a dirty flag for spline time and one for the selling station; events such as PlaceableTrainSystemRentEvent are defined elsewhere.
---@class PlaceableTrainSystem
PlaceableTrainSystem = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableTrainSystem.prerequisitesPresent(specializations) end

--- Registers the train system functions (spline time, vehicle creation, rental, range state, selling and helpers) on the placeable type.
---@param placeableType any
function PlaceableTrainSystem.registerFunctions(placeableType) end

--- Overrides `getNeedDayChanged` on the placeable type.
---@param placeableType any
function PlaceableTrainSystem.registerOverwrittenFunctions(placeableType) end

--- Subscribes to load, delete, placement, stream read/write (full and update), update, day-changed and delete-object events (day changed and delete object come from the engine, exact event list partly UNVERIFIED).
---@param placeableType any
function PlaceableTrainSystem.registerEventListeners(placeableType) end

--- Declares the `.trainSystem` XML keys (spline, driving range, rent price, electricity spline, train vehicles) and delegates to RailroadCrossing and RailroadCaller for their entries.
---@param schema any
---@param basePath any
function PlaceableTrainSystem.registerXMLPaths(schema, basePath) end

--- Declares savegame attributes: spline time, rented flag, renting farm, current price, vehicle unique ids and per-object data.
---@param schema any
---@param basePath any
function PlaceableTrainSystem.registerSavegameXMLPaths(schema, basePath) end

--- Initializes state and network helpers and reads the rent price. Validates the spline node (must exist, be a spline and be closed, otherwise sets the loading state to ERROR), reads the optional driving range and electricity spline, queues vehicle filenames on the server, creates crossings and callers, and finds for each the nearest spline time. Note: the electricity spline start check samples `spec.spline` twice, so the distance is always 0.
---@param savegame table
function PlaceableTrainSystem:onLoad(savegame) end

--- Deletes railroad crossings and callers, clears the train reference on each vehicle and removes the system from the mission.
function PlaceableTrainSystem:onDelete() end

--- Finds crossing blocking positions, gives railroad objects their spline time and position, registers the system in the mission, and creates the vehicles now or once the mission starts.
function PlaceableTrainSystem:onFinalizePlacement() end

--- Client side on join: reads the vehicle object ids, spline time, per-object data, rental state, renting farm and selling station id, then wakes the placeable.
---@param streamId any
---@param connection any
function PlaceableTrainSystem:onReadStream(streamId, connection) end

--- Server side on join: writes the vehicle objects, last sent spline time, per-object data, rental state, renting farm and selling station placeable.
---@param streamId any
---@param connection any
function PlaceableTrainSystem:onWriteStream(streamId, connection) end

--- Client side: when the dirty bit is set, reads the spline time (feeds the interpolators) and per-object updates; when the station bit is set, reads the selling station id.
---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableTrainSystem:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the spline time and per-object updates when the dirty flag is set, and the selling station when its flag is set.
---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableTrainSystem:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Restores railroad object data, rental state, renting farm, current price, start spline time and the saved vehicle unique ids.
---@param xmlFile any
---@param key any
function PlaceableTrainSystem:loadFromXMLFile(xmlFile, key) end

--- Saves the spline time, vehicle unique ids, objects that support saving (called with a dot, so without self; possible slip, UNVERIFIED), rental state, renting farm and current price.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableTrainSystem:saveToXMLFile(xmlFile, key, usedModNames) end

--- Per frame: sets train tabbability once, smooths the speed on clients, updates railroad objects, accrues rent by elapsed time, and on pure clients resolves synchronized vehicles and interpolates spline time. With a limited range, links the selling station and shows the delayed info or sell dialog; then moves vehicles and stays active.
---@param dt any
function PlaceableTrainSystem:onUpdate(dt) end

--- Once per update loop, advances the spline time from each locomotive speed, then aligns a few vehicles per frame (up to 3, all if any is within clip distance) to the spline behind their predecessor, remembering each end time.
---@param dt any
function PlaceableTrainSystem:updateRailroadVehiclePositions(dt) end

--- Loads the train: from saved vehicle unique ids if available (attaching existing vehicles), otherwise loads each configured vehicle file asynchronously with no owner restriction. Clears the pending filename list.
function PlaceableTrainSystem:createVehicles() end

--- Load callback for one train vehicle: on success links it to the train system and stores its index; logs a warning on failure; when all vehicles are done, finalizes the train.
---@param vehicles any
---@param vehicleLoadState any
---@param args any
function PlaceableTrainSystem:railroadVehicleLoaded(vehicles, vehicleLoadState, args) end

--- Sorts vehicles by index, registers as delete listener, picks the first locomotive as root, optionally couples each vehicle to the previous one, then updates the train length and tabbability. Does nothing if being deleted.
---@param attachVehicles any
function PlaceableTrainSystem:finalizeTrain(attachVehicles) end

--- Applies tabbability to every railroad vehicle that supports it; requires the game setting for train tabbing and, with a limited range, that the train is within the driveable range.
---@param isTabbable any
function PlaceableTrainSystem:setIsTrainTabbable(isTabbable) end

--- Returns whether the train was last inside the driveable range (true when no limited range).
function PlaceableTrainSystem:getIsTrainInDriveableRange() end

--- Returns the current spline time (0 to 1 along the closed spline) of the train head.
function PlaceableTrainSystem:getSplineTime() end

--- Sets the head and end spline times when changed: updates driveable state, notifies position listeners, recomputes speeds, pushes them to vehicles, and on the server raises a network dirty flag if the move exceeds about 2 cm.
---@param startTime any
---@param endTime any
function PlaceableTrainSystem:setSplineTime(startTime, endTime) end

--- Adds a listener (needing `onSplinePositionTimeUpdate`) notified when the spline time changes; nil is ignored.
---@param listener any
function PlaceableTrainSystem:addSplinePositionUpdateListener(listener) end

--- Removes a previously added spline position listener; nil is ignored.
---@param listener any
function PlaceableTrainSystem:removeSplinePositionUpdateListener(listener) end

--- Advances the spline time by distance (speed times dt in ms) divided by the spline length, and sets the tail time using the train length.
---@param dt any
---@param speed any
function PlaceableTrainSystem:updateTrainPositionByLocomotiveSpeed(dt, speed) end

--- Sets the head spline time directly and derives the tail time from the train length.
---@param splinePosition any
function PlaceableTrainSystem:updateTrainPositionByLocomotiveSplinePosition(splinePosition) end

--- Adds up the front-to-back distance of all vehicles into the train length (note: adds to the existing value without resetting it first), converts it to spline time and repositions the train.
---@param splinePosition any
function PlaceableTrainSystem:updateTrainLength(splinePosition) end

--- Rents the train to the given farm if free, or returns it if it is rented by that same farm; otherwise does nothing.
---@param farmId any
---@param position any
function PlaceableTrainSystem:toggleRent(farmId, position) end

--- Marks the train rented by the farm, asks the root locomotive to go to the requested spline position, gives vehicles to that farm and sends a PlaceableTrainSystemRentEvent. Does nothing without a locomotive.
---@param farmId any
---@param position any
---@param noEventSend any
function PlaceableTrainSystem:rentRailroad(farmId, position, noEventSend) end

--- Ends the rental. On the server it bills the accumulated leasing cost to the renting farm and sends the locomotive back to automated travel; vehicles go back to the spectator farm and a rent event is sent.
---@param noEventSend any
function PlaceableTrainSystem:returnRailroad(noEventSend) end

--- Server only: bills the accumulated rent to the renting farm as leasing costs and resets the price.
function PlaceableTrainSystem:onDayChanged() end

--- Returns whether the train is currently rented.
function PlaceableTrainSystem:getIsRented() end

--- Returns false only if the train is rented by a different farm than the given one.
---@param farmId any
function PlaceableTrainSystem:getCanBeRented(farmId) end

--- Delete listener callback: removes the deleted vehicle from the train and recomputes the train length.
---@param object any
function PlaceableTrainSystem:onDeleteObject(object) end

--- Returns the length of the train spline (meters presumed).
function PlaceableTrainSystem:getSplineLength() end

--- Returns the electricity spline node, or nil if none was accepted.
function PlaceableTrainSystem:getElectricitySpline() end

--- Returns the electricity spline length, or 0 if there is none.
function PlaceableTrainSystem:getElectricitySplineLength() end

--- Always returns true so the daily callback (rent billing) runs.
---@param superFunc any
function PlaceableTrainSystem:getNeedDayChanged(superFunc) end

--- Returns the train length expressed in spline time units.
function PlaceableTrainSystem:getLengthSplineTime() end

--- Returns the train spline node.
function PlaceableTrainSystem:getSpline() end

--- Checks whether the spline time is inside the driveable range. On leaving it: clients eject an entered player and show a dialog, the server switches locomotives to automatic travel and returns an empty rented train. On re-entering it resets the locomotive states; updates tabbability.
---@param newSplineTime any
function PlaceableTrainSystem:updateDriveableState(newSplineTime) end

--- Returns true if any fill unit of any train vehicle holds more than 0, otherwise false.
function PlaceableTrainSystem:gsIsTrainFilled() end

--- Callback of the yes/no dialog: when answered yes, sends a PlaceableTrainSystemSellEvent to the server.
---@param yes any
function PlaceableTrainSystem:onSellGoodsQuestion(yes) end

--- Server logic: pushes the fill level of every fill unit into the linked selling station for the renting farm, removes what was accepted from the vehicles, and returns the train if anything was sold.
function PlaceableTrainSystem:sellGoods() end
