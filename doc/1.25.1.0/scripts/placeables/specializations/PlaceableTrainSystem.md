# placeables/specializations/PlaceableTrainSystem.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableTrainSystem.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableTrainSystem.lua` — FS25 1.25.1.0

✍ Placeable specialization that runs a train on a closed spline: it loads the train vehicles, moves them along the spline from the locomotive speed (server) or from interpolated network values (client), and hosts railroad crossings and callers. It also handles train rental per farm (hourly price billed daily or on return), an optional limited driving range tied to a selling station, and selling the cargo. Network sync uses a dirty flag for spline time and one for the selling station; events such as PlaceableTrainSystemRentEvent are defined elsewhere.

- **PlaceableTrainSystem** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableTrainSystem.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableTrainSystem.registerFunctions(placeableType: any)` | 26 | ✍ Registers the train system functions (spline time, vehicle creation, rental, range state, selling and helpers) on the placeable type. |
| `PlaceableTrainSystem.registerOverwrittenFunctions(placeableType: any)` | 60 | ✍ Overrides `getNeedDayChanged` on the placeable type. |
| `PlaceableTrainSystem.registerEventListeners(placeableType: any)` | 66 | ✍ Subscribes to load, delete, placement, stream read/write (full and update), update, day-changed and delete-object events (day changed and delete object come from the engine, exact event list partly UNVERIFIED). |
| `PlaceableTrainSystem.registerXMLPaths(schema: any, basePath: any)` | 80 | ✍ Declares the `.trainSystem` XML keys (spline, driving range, rent price, electricity spline, train vehicles) and delegates to RailroadCrossing and RailroadCaller for their entries. |
| `PlaceableTrainSystem.registerSavegameXMLPaths(schema: any, basePath: any)` | 104 | ✍ Declares savegame attributes: spline time, rented flag, renting farm, current price, vehicle unique ids and per-object data. |
| `PlaceableTrainSystem:onLoad(savegame: table)` | 118 | ✍ Initializes state and network helpers and reads the rent price. Validates the spline node (must exist, be a spline and be closed, otherwise sets the loading state to ERROR), reads the optional driving range and electricity spline, queues vehicle filenames on the server, creates crossings and callers, and finds for each the nearest spline time. Note: the electricity spline start check samples `spec.spline` twice, so the distance is always 0. |
| `PlaceableTrainSystem:onDelete()` | 304 | ✍ Deletes railroad crossings and callers, clears the train reference on each vehicle and removes the system from the mission. |
| `PlaceableTrainSystem:onFinalizePlacement()` | 324 | ✍ Finds crossing blocking positions, gives railroad objects their spline time and position, registers the system in the mission, and creates the vehicles now or once the mission starts. |
| `PlaceableTrainSystem:onReadStream(streamId: any, connection: any)` | 353 | ✍ Client side on join: reads the vehicle object ids, spline time, per-object data, rental state, renting farm and selling station id, then wakes the placeable. |
| `PlaceableTrainSystem:onWriteStream(streamId: any, connection: any)` | 384 | ✍ Server side on join: writes the vehicle objects, last sent spline time, per-object data, rental state, renting farm and selling station placeable. |
| `PlaceableTrainSystem:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 410 | ✍ Client side: when the dirty bit is set, reads the spline time (feeds the interpolators) and per-object updates; when the station bit is set, reads the selling station id. |
| `PlaceableTrainSystem:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 433 | ✍ Server side: writes the spline time and per-object updates when the dirty flag is set, and the selling station when its flag is set. |
| `PlaceableTrainSystem:loadFromXMLFile(xmlFile: any, key: any)` | 454 | ✍ Restores railroad object data, rental state, renting farm, current price, start spline time and the saved vehicle unique ids. |
| `PlaceableTrainSystem:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 485 | ✍ Saves the spline time, vehicle unique ids, objects that support saving (called with a dot, so without self; possible slip, UNVERIFIED), rental state, renting farm and current price. |
| `PlaceableTrainSystem:onUpdate(dt: any)` | 510 | ✍ Per frame: sets train tabbability once, smooths the speed on clients, updates railroad objects, accrues rent by elapsed time, and on pure clients resolves synchronized vehicles and interpolates spline time. With a limited range, links the selling station and shows the delayed info or sell dialog; then moves vehicles and stays active. |
| `PlaceableTrainSystem:updateRailroadVehiclePositions(dt: any)` | 636 | ✍ Once per update loop, advances the spline time from each locomotive speed, then aligns a few vehicles per frame (up to 3, all if any is within clip distance) to the spline behind their predecessor, remembering each end time. |
| `PlaceableTrainSystem:createVehicles()` | 703 | ✍ Loads the train: from saved vehicle unique ids if available (attaching existing vehicles), otherwise loads each configured vehicle file asynchronously with no owner restriction. Clears the pending filename list. |
| `PlaceableTrainSystem:railroadVehicleLoaded(vehicles: any, vehicleLoadState: any, args: any)` | 745 | ✍ Load callback for one train vehicle: on success links it to the train system and stores its index; logs a warning on failure; when all vehicles are done, finalizes the train. |
| `PlaceableTrainSystem:finalizeTrain(attachVehicles: any)` | 771 | ✍ Sorts vehicles by index, registers as delete listener, picks the first locomotive as root, optionally couples each vehicle to the previous one, then updates the train length and tabbability. Does nothing if being deleted. |
| `PlaceableTrainSystem:setIsTrainTabbable(isTabbable: any)` | 806 | ✍ Applies tabbability to every railroad vehicle that supports it; requires the game setting for train tabbing and, with a limited range, that the train is within the driveable range. |
| `PlaceableTrainSystem:getIsTrainInDriveableRange()` | 824 | ✍ Returns whether the train was last inside the driveable range (true when no limited range). |
| `PlaceableTrainSystem:getSplineTime()` | 830 | ✍ Returns the current spline time (0 to 1 along the closed spline) of the train head. |
| `PlaceableTrainSystem:setSplineTime(startTime: any, endTime: any)` | 836 | ✍ Sets the head and end spline times when changed: updates driveable state, notifies position listeners, recomputes speeds, pushes them to vehicles, and on the server raises a network dirty flag if the move exceeds about 2 cm. |
| `PlaceableTrainSystem:addSplinePositionUpdateListener(listener: any)` | 896 | ✍ Adds a listener (needing `onSplinePositionTimeUpdate`) notified when the spline time changes; nil is ignored. |
| `PlaceableTrainSystem:removeSplinePositionUpdateListener(listener: any)` | 905 | ✍ Removes a previously added spline position listener; nil is ignored. |
| `PlaceableTrainSystem:updateTrainPositionByLocomotiveSpeed(dt: any, speed: any)` | 914 | ✍ Advances the spline time by distance (speed times dt in ms) divided by the spline length, and sets the tail time using the train length. |
| `PlaceableTrainSystem:updateTrainPositionByLocomotiveSplinePosition(splinePosition: any)` | 925 | ✍ Sets the head spline time directly and derives the tail time from the train length. |
| `PlaceableTrainSystem:updateTrainLength(splinePosition: any)` | 934 | ✍ Adds up the front-to-back distance of all vehicles into the train length (note: adds to the existing value without resetting it first), converts it to spline time and repositions the train. |
| `PlaceableTrainSystem:toggleRent(farmId: any, position: any)` | 945 | ✍ Rents the train to the given farm if free, or returns it if it is rented by that same farm; otherwise does nothing. |
| `PlaceableTrainSystem:rentRailroad(farmId: any, position: any, noEventSend: any)` | 959 | ✍ Marks the train rented by the farm, asks the root locomotive to go to the requested spline position, gives vehicles to that farm and sends a PlaceableTrainSystemRentEvent. Does nothing without a locomotive. |
| `PlaceableTrainSystem:returnRailroad(noEventSend: any)` | 982 | ✍ Ends the rental. On the server it bills the accumulated leasing cost to the renting farm and sends the locomotive back to automated travel; vehicles go back to the spectator farm and a rent event is sent. |
| `PlaceableTrainSystem:onDayChanged()` | 1009 | ✍ Server only: bills the accumulated rent to the renting farm as leasing costs and resets the price. |
| `PlaceableTrainSystem:getIsRented()` | 1022 | ✍ Returns whether the train is currently rented. |
| `PlaceableTrainSystem:getCanBeRented(farmId: any)` | 1029 | ✍ Returns false only if the train is rented by a different farm than the given one. |
| `PlaceableTrainSystem:onDeleteObject(object: any)` | 1043 | ✍ Delete listener callback: removes the deleted vehicle from the train and recomputes the train length. |
| `PlaceableTrainSystem:getSplineLength()` | 1052 | ✍ Returns the length of the train spline (meters presumed). |
| `PlaceableTrainSystem:getElectricitySpline()` | 1059 | ✍ Returns the electricity spline node, or nil if none was accepted. |
| `PlaceableTrainSystem:getElectricitySplineLength()` | 1066 | ✍ Returns the electricity spline length, or 0 if there is none. |
| `PlaceableTrainSystem:getNeedDayChanged(superFunc: any)` | 1073 | ✍ Always returns true so the daily callback (rent billing) runs. |
| `PlaceableTrainSystem:getLengthSplineTime()` | 1079 | ✍ Returns the train length expressed in spline time units. |
| `PlaceableTrainSystem:getSpline()` | 1086 | ✍ Returns the train spline node. |
| `PlaceableTrainSystem:updateDriveableState(newSplineTime: any)` | 1093 | ✍ Checks whether the spline time is inside the driveable range. On leaving it: clients eject an entered player and show a dialog, the server switches locomotives to automatic travel and returns an empty rented train. On re-entering it resets the locomotive states; updates tabbability. |
| `PlaceableTrainSystem:gsIsTrainFilled()` | 1166 | ✍ Returns true if any fill unit of any train vehicle holds more than 0, otherwise false. |
| `PlaceableTrainSystem:onSellGoodsQuestion(yes: any)` | 1184 | ✍ Callback of the yes/no dialog: when answered yes, sends a PlaceableTrainSystemSellEvent to the server. |
| `PlaceableTrainSystem:sellGoods()` | 1192 | ✍ Server logic: pushes the fill level of every fill unit into the linked selling station for the renting farm, removes what was accepted from the vehicles, and returns the train if anything was sold. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateRailroadVehiclePositions` | 27 |
| registerFunction | `createVehicles` | 28 |
| registerFunction | `railroadVehicleLoaded` | 29 |
| registerFunction | `finalizeTrain` | 30 |
| registerFunction | `setIsTrainTabbable` | 31 |
| registerFunction | `getIsTrainInDriveableRange` | 32 |
| registerFunction | `getSplineTime` | 33 |
| registerFunction | `setSplineTime` | 34 |
| registerFunction | `addSplinePositionUpdateListener` | 35 |
| registerFunction | `removeSplinePositionUpdateListener` | 36 |
| registerFunction | `updateTrainPositionByLocomotiveSpeed` | 37 |
| registerFunction | `updateTrainPositionByLocomotiveSplinePosition` | 38 |
| registerFunction | `updateTrainLength` | 39 |
| registerFunction | `toggleRent` | 40 |
| registerFunction | `getCanBeRented` | 41 |
| registerFunction | `rentRailroad` | 42 |
| registerFunction | `returnRailroad` | 43 |
| registerFunction | `onDeleteObject` | 44 |
| registerFunction | `getIsRented` | 45 |
| registerFunction | `getSplineLength` | 46 |
| registerFunction | `getElectricitySpline` | 47 |
| registerFunction | `getElectricitySplineLength` | 48 |
| registerFunction | `getLengthSplineTime` | 49 |
| registerFunction | `getSpline` | 50 |
| registerFunction | `updateDriveableState` | 51 |
| registerFunction | `gsIsTrainFilled` | 52 |
| registerFunction | `onSellGoodsQuestion` | 53 |
| registerFunction | `sellGoods` | 54 |
| registerFunction | `getTrainPosition` | 55 |
| registerOverwrittenFunction | `getNeedDayChanged` | 61 |
| registerEventListener | `onLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onFinalizePlacement` | 69 |
| registerEventListener | `onReadStream` | 70 |
| registerEventListener | `onWriteStream` | 71 |
| registerEventListener | `onReadUpdateStream` | 72 |
| registerEventListener | `onWriteUpdateStream` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onDayChanged` | 75 |
