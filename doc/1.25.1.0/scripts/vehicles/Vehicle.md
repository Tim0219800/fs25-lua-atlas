# vehicles/Vehicle.lua

*[Version française](../../fr/scripts/vehicles/Vehicle.md)*

Source: `dataS/scripts/vehicles/Vehicle.lua` — FS25 1.25.1.0

✍ Base class of every in-game vehicle (extends `Object`). It loads the vehicle XML and i3d asynchronously, builds the physics components and joints, instantiates the specializations of the vehicle type and dispatches the lifecycle events (`onLoad`, `onUpdate`, `onDelete`, ...) to them. It also handles network streams and position interpolation on clients, saving to the savegame, selection of implements, mass, price/upkeep, water detection and shop spec values. Many methods are registered as overridable functions on each vehicle type via `Vehicle.registerFunctions`. The `Environment`, `XMLFile`, `FSBaseMission` classes and vehicle system are not in the dump (UNVERIFIED).

- **Vehicle** inherits from `Object` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `Vehicle.registerInteractionFlag(name: string)` | 66 | ✍ Creates a numbered `Vehicle.INTERACTION_FLAG_<NAME>` constant on first use (name upper-cased) and returns its value; calling again with the same name returns the existing flag. |
| `Vehicle.registerEvents(vehicleType: any)` | 80 | ✍ Registers on a vehicle type all base lifecycle events (`onPreLoad`, `onLoad`, `onPostLoad`, `onUpdate`, `onUpdateTick`, `onDraw`, `onDelete`, `onSave`, stream read/write, selection, `onSetBroken`, ...). Specializations can then listen to them. |
| `Vehicle.registerFunctions(vehicleType: any)` | 125 | ✍ Registers about a hundred `Vehicle` methods (position, mass, selection, speed limit, naming, map hotspot, action events, ...) as overridable functions on a vehicle type through `SpecializationUtil.registerFunction`. |
| `Vehicle.init()` | 269 | ✍ One-time class initialisation: declares the vehicle configuration types (baseColor, vehicleType, component, design 1-16 and designColor), adds the shop spec types (age, operatingTime, weight, workingWidth, slots, ...), creates the XML schemas (vehicle, sounds, savegame) and calls `Vehicle.registers`. |
| `Vehicle.postInit()` | 307 | ✍ Deferred step after init: for every known configuration type, adds async subtasks that register its XML paths in the vehicle and savegame schemas (including #workingWidth and #typeDesc), plus a legacy `boughtConfiguration` savegame path. |
| `Vehicle.registers()` | 333 | ✍ Registers the base XML paths of vehicle files (`vehicle.base.*`: filename, size, mass components, joints, hotspot, speed limit, tailwater depth, schema overlay, store specs) and the savegame attributes of `vehicles.vehicle(?)` (uniqueId, age, price, farmId, operatingTime, component positions). |
| `Vehicle.registerComponentXMLPaths(schema: any, basePath: any)` | 432 | ✍ Registers under `basePath` the XML paths for physical components (index, mass in kg, center of mass, inertia scale, solver iterations), component joints (limits, springs, drives, breakability) and collision pairs. Used for both the default and per-configuration component sets. |
| `Vehicle.new(isServer: any, isClient: any, customMt: any)` | 487 | ✍ Constructor. Builds an `Object` with the vehicle metatable and initialises loading state, loading step, task list, unique id (nil) and a `VehicleActionController`. No XML or i3d is loaded yet. |
| `Vehicle:setFilename(filename: any)` | 511 | ✍ Stores the vehicle XML path and derives the cleaned name, the mod environment name and the base directory from it. Must be called before `setType`. |
| `Vehicle:setConfigurations(configurations: any, boughtConfigurations: any, configurationData: any)` | 520 | ✍ Stores the selected and bought configurations (and optional configuration data) and builds an alphabetically sorted list of configuration names. |
| `Vehicle:setType(typeDef: any)` | 540 | ✍ Applies the vehicle type: if a `vehicleType` configuration item names a different known type it replaces the given one (warning if unknown), then the type's specializations are initialised on this vehicle. Asserts that a filename was set. |
| `Vehicle:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 562 | ✍ Remembers the function, target and arguments to call once loading finishes or fails. See `loadCallback`. |
| `Vehicle:loadCallback()` | 570 | ✍ Calls the stored load callback with (target, vehicle, loadingState, arguments) and then clears it, so it fires at most once. |
| `Vehicle:load(vehicleLoadingData: any)` | 581 | ✍ Starts loading from the XML: validates the type, loads the XMLFile, resolves store item, brand and sounds file, reconciles saved configurations with the store item's configuration sets, creates specialization environments, raises `onPreLoad` and requests the i3d asynchronously. Returns nil while pending, or the error state/false if pre-load fails. |
| `Vehicle:i3dFileLoaded(i3dNode: any, failedReason: any, arguments: any, i3dLoadingId: any)` | 701 | ✍ Callback of the shared i3d request. On failure sets the ERROR loading state and fires the load callback; otherwise stores the node, hides it and queues `loadFinished` on the async task manager. |
| `Vehicle:loadFinished()` | 719 | ✍ Main asynchronous loading pipeline, split into many named tasks: components and root nodes, i3d mappings, joints, collision pairs, size, misc data (speed limit, water thresholds, day/period subscriptions), then `onLoad`, `onPostLoad`, `onPreInitComponentPlacement`, savegame values, positioning and selection. Ends in `onFinishedLoading` or waits for sub i3d tasks. |
| `Vehicle:loadSubSharedI3DFile(filename: any, callOnCreate: any, addToPhysics: any, asyncCallbackFunction: any, asyncCallbackObject: any, asyncCallbackArguments: any)` | 1240 | ✍ Requests an extra shared i3d for the vehicle and registers a loading task so the vehicle waits for it. If the vehicle was deleted meanwhile, the loaded node is freed and the callback gets node 0. Returns the shared load request id. |
| `Vehicle:onFinishedLoading()` | 1284 | ✍ Final loading step. The server shows the vehicle and adds it to physics (clients do it later in `postReadStream`); then raises `onLoadFinished`, creates the map hotspot, registers the vehicle in the vehicle system, owned/leased item lists, optionally `register()`, raises `onLoadEnd` and fires the load callback. |
| `Vehicle:createLoadingTask(target: any) → table` | 1336 | ✍ Creates a pending loading task for `target` via `SpecializationUtil.createLoadingTask` and returns it. The vehicle will not finish loading until the task is finished. |
| `Vehicle:finishLoadingTask(task: table)` | 1343 | ✍ Marks a loading task as done through `SpecializationUtil.finishLoadingTask`; the exact trigger of `onFinishedLoading` lives in that helper (not in this file). |
| `Vehicle:delete(immediate: any)` | 1353 | ✍ Deletes the vehicle. First call cleans up hotspot, tour, messages, AI job and owned/leased lists, then (unless `immediate` or game exit) hands deletion to the vehicle system for later. The real deletion raises `onPreDelete`/`onDelete`, removes joints, frees nodes, i3d and XML, and calls the superclass. |
| `Vehicle:reset(forceDelete: any, callback: any, resetPlayer: any)` | 1449 | ✍ Replaces the vehicle by a fresh copy reloaded from its own save-style XML (see `getReloadXML`), optionally deleting the old one first and teleporting the local player out. Publishes `MessageType.VEHICLE_RESET` on success; `callback(success)` is called when done. Ignored if a reset is already running. |
| `Vehicle:getNeedsSaving()` | 1509 | ✍ Returns whether the vehicle is saved in the savegame (the `isSaved` flag from its loading data). |
| `Vehicle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 1515 | ✍ Writes the vehicle to the savegame XML: uniqueId, age, price, farm, property state, operating time (seconds), tour id, selection indices on the root vehicle, broken flag, component world positions and rotations, configurations, then each specialization's `saveToXMLFile` and the action controller. |
| `Vehicle:saveStatsToXMLFile(xmlFile: any, key: any) → string` | 1571 | ✍ Writes name, category, type and position of the vehicle into a stats XML (using the legacy `setXML*` functions) and lets each specialization add its own stats. Returns false if the vehicle is deleted, unsaved or not tabbable. |
| `Vehicle:readStream(streamId: integer, connection: table, objectId: any)` | 1611 | ✍ Client side, on join: reads the filename, configurations and property state from the stream and starts loading the vehicle asynchronously via `VehicleLoadingData:loadVehicleOnClient`. Logs an error if loading was already started; notifies `g_client` when done. |
| `Vehicle:postReadStream(streamId: integer, connection: table)` | 1649 | ✍ Client side, once the vehicle is loaded: reads compressed component positions and rotations, mass, age, operating time, price and broken flag, raises `onReadStream` for the specializations, makes the vehicle visible, adds it to physics and sets the SYNCHRONIZED step. |
| `Vehicle:writeStream(streamId: integer, connection: table)` | 1702 | ✍ Server side, on client join: writes the network filename, configurations and property state. The rest is sent later by `postWriteStream`. |
| `Vehicle:postWriteStream(streamId: integer, connection: table)` | 1716 | ✍ Server side, once the client has loaded the vehicle: writes compressed component positions and rotations, server mass, age, operating time, price and broken flag, then raises `onWriteStream`. Mirrors `postReadStream`. |
| `Vehicle:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1756 | ✍ Client side per-update read: if the server sent a position update, feeds the target positions/quaternions of non-static components to the network interpolators and raises `onReadPositionUpdateStream`; then raises `onReadUpdateStream`. |
| `Vehicle:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1802 | ✍ Server side per-update write: when the vehicle dirty flag is set, writes compressed positions and rotations of non-static components and raises `onWritePositionUpdateStream`; always raises `onWriteUpdateStream` for the specializations. |
| `Vehicle:updateVehicleSpeed(dt: any)` | 1841 | ✍ Computes speed (m/ms), signed speed, moving direction, moved distance and acceleration of the first component, from physics velocity on a server dynamic body or from position change/interpolation otherwise, then updates the smoothed values `lastSpeed`, `lastSpeedReal`, etc. |
| `Vehicle:update(dt: any)` | 1927 | ✍ Per-frame update. On the server it detects NaN, out-of-world or below-terrain positions and resets the vehicle. Then it refreshes distance to camera, raises `onPreUpdate`, interpolates client positions, updates speed and action events, raises `onUpdate`/`onPostUpdate`, updates mass if dirty and keeps the vehicle awake while physics is not sleeping. |
| `Vehicle:updateTick(dt: number)` | 2075 | ✍ Fixed-step update. Refreshes water info and the on-field flag, on the server flags position changes for network sync (always if owned by a connection), handles the tailwater warning (breaks the vehicle beyond the threshold), accumulates operating time, then raises `onUpdateTick`/`onPostUpdateTick`. |
| `Vehicle:updateEnd(dt: any)` | 2169 | ✍ Last update before the vehicle goes to sleep: sets the update distance to 0 so specializations reach a consistent state, then raises `onUpdateEnd`. |
| `Vehicle:draw(subDraw: any)` | 2182 | ✍ Draw pass for the entered vehicle, if synchronized. Also draws the root and the selected vehicle when they differ, raises `onDraw` on the selected/root vehicle, runs debug drawing and shows the blinking water warning. |
| `Vehicle:drawUIInfo()` | 2223 | ✍ If synchronized, raises `onDrawUIInfo` and, when `g_showVehicleDistance` is set, renders the camera distance above the vehicle up to 350 m. |
| `Vehicle:setLoadingState(loadingState: any)` | 2239 | ✍ Sets the loading state if the value is a valid `VehicleLoadingState`; otherwise prints a callstack and logs an error. |
| `Vehicle:setLoadingStep(loadingStep: SpecializationLoadStep)` | 2251 | ✍ Sets the loading step by delegating to `SpecializationUtil.setLoadingStep` (validation is done there, not in this file). |
| `Vehicle:addToPhysics() → boolean` | 2258 | ✍ Adds all components to physics, links motorized components with vehicle links, and on the server creates component joints, a wake-up report and collision pair settings; marks mass dirty. Returns true if it was added, false if already in physics. |
| `Vehicle:removeFromPhysics()` | 2299 | ✍ Removes every component from physics and, on the server, invalidates the joint indices and the wake-up report. Always returns true. |
| `Vehicle:setVisibility(state: boolean)` | 2318 | ✍ Shows or hides all component nodes of the vehicle. |
| `Vehicle:setRelativePosition(positionX: number, offsetY: number, positionZ: number, yRot: number)` | 2330 | ✍ Places the vehicle at (x, z) at `offsetY` above the terrain height at that point, with yaw `yRot` (other angles 0), via `setAbsolutePosition`. |
| `Vehicle:setAbsolutePosition(positionX: any, positionY: any, positionZ: any, xRot: any, yRot: any, zRot: any, componentPositions: any)` | 2339 | ✍ Positions all components relative to a temporary root at the given world position and rotation, using each component's original offsets (or explicit `componentPositions` if one per component), and resets network interpolation. |
| `Vehicle:getLimitedVehicleYPosition(position: any)` | 2363 | ✍ Returns `position.posY` if present, otherwise the terrain height at (posX, posZ) plus `yOffset` (0 by default). Despite its name, no clamping is visible in this file. |
| `Vehicle:setWorldPosition(x: number, y: number, z: number, xRot: number, yRot: number, zRot: number, componentIndex: integer, changeInterp: boolean)` | 2383 | ✍ Sets world translation and Euler rotation of one component by index; with `changeInterp` also resets that component's network interpolators. Does nothing for an unknown index. |
| `Vehicle:setWorldPositionQuaternion(x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, componentIndex: integer, changeInterp: boolean)` | 2407 | ✍ Same as `setWorldPosition` but with a quaternion rotation; used by clients for interpolated movement and when reading streams. |
| `Vehicle:setDefaultComponentPosition(componentIndex: integer)` | 2430 | ✍ Moves a component (not the first one) back to its original offset relative to the vehicle root node. |
| `Vehicle:resetPositionToTerrainHeight()` | 2447 | ✍ Lifts all components above the terrain (largest penetration plus 10 m) while temporarily removed from physics, then re-adds them and does the same for attached child vehicles. |
| `Vehicle:getIsNodeActive(node: integer)` | 2475 | ✍ Walks up the node's parents to find which root-level component node contains it; returns false if that component is disabled by the component configuration or no match is found, true if active. |
| `Vehicle:getPrice()` | 2515 | ✍ Returns the stored purchase price of the vehicle. |
| `Vehicle:getSellPrice() → number` | 2522 | ✍ Returns the sell price from `Vehicle.calculateSellPrice` using the store item, age, operating time, price and repair/repaint costs of this vehicle. |
| `Vehicle.calculateSellPrice(storeItem: any, age: any, operatingTime: any, price: any, repairPrice: any, repaintPrice: any)` | 2529 | ✍ Computes a resale value: depreciation by operating hours (exponent 1.3 for non-motorized items) and by age in years (log curve capped at 0.85), minus repair and repaint costs, never below 3 percent of the price. |
| `Vehicle:getIsOnField() → boolean` | 2551 | ✍ Checks each component's center of mass and returns true if any of them is above a field per `FSDensityMapUtil.getFieldDataAtWorldPosition`; stops early if a component is more than 1 m below the terrain. |
| `Vehicle:getParentComponent(node: integer) → integer` | 2573 | ✍ Climbs from the given node up the scene graph and returns the first node that is a component of this vehicle, or 0 if none. |
| `Vehicle:getLastSpeed(useAttacherVehicleSpeed: boolean) → number` | 2587 | ✍ Returns the smoothed speed in km/h (internal value times 3600); with `useAttacherVehicleSpeed` it recurses to the attacher vehicle when there is one. |
| `Vehicle:getDeactivateOnLeave()` | 2600 | ✍ Default implementation: always true (the vehicle is deactivated when the player leaves it). Specializations may override. |
| `Vehicle:getIsSynchronized()` | 2606 | ✍ True once the loading step has reached SYNCHRONIZED (immediately after loading on the server, after `postReadStream` on clients). |
| `Vehicle:getIsVehicleNode(nodeId: integer) → boolean` | 2620 | ✍ Returns true if the node id is one of this vehicle's registered component nodes. |
| `Vehicle:getIsOperating() → boolean` | 2627 | ✍ Default: false. Specializations override it to say the vehicle is working; `updateTick` adds elapsed time to the operating time while it returns true. |
| `Vehicle:getIsActive()` | 2633 | ✍ Returns false when broken, true if `forceIsActive` is set, otherwise false. Specializations extend it (e.g. when entered or running). |
| `Vehicle:getIsActiveForInput(ignoreSelection: any, activeForAI: any)` | 2647 | ✍ Tells whether this vehicle may receive player input: input allowed, mission running, not AI-driven (unless `activeForAI`), selected (unless `ignoreSelection`) and the root vehicle also active; a root that cannot be entered must have an attacher. |
| `Vehicle:getIsActiveForSound()` | 2689 | ✍ Deprecated: prints a warning and returns false. |
| `Vehicle:getIsLowered(defaultIsLowered: any)` | 2696 | ✍ Default: returns false. Tools override it to report whether they are lowered. |
| `Vehicle:updateWaterInfo()` | 2702 | ✍ Starts an asynchronous downward raycast against water from the vehicle's mid-height; the result arrives in `onWaterRaycastCallback`. Skipped while a previous request is pending. |
| `Vehicle:onWaterRaycastCallback(nodeId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 2721 | ✍ Raycast result handler: sets `waterY`, `isInWater`, shallow/medium flags (depth of 0.5 m or less counts as shallow) and `tailwaterDepth`. Returns false to stop the raycast. |
| `Vehicle:setBroken()` | 2747 | ✍ Marks the vehicle broken. On the server it first broadcasts a `VehicleBrokenEvent`; raises `onSetBroken` and aborts a running guided tour if the vehicle belongs to it. |
| `Vehicle:getVehicleDamage()` | 2764 | ✍ Default: 0 (no damage). Overridden by wearable-style specializations; used by `getSpeedLimit`. |
| `Vehicle:getRepairPrice()` | 2770 | ✍ Default: 0. Specializations override it to give the repair cost used in the sell price. |
| `Vehicle:getRepaintPrice()` | 2776 | ✍ Default: 0. Specializations override it to give the repaint cost used in the sell price. |
| `Vehicle:requestActionEventUpdate()` | 2782 | ✍ Asks the root vehicle to rebuild input action events on its next update and removes the current action events of that root immediately. |
| `Vehicle:removeActionEvents()` | 2797 | ✍ Removes every input action event registered by this vehicle as target in `g_inputBinding`. |
| `Vehicle:updateActionEvents()` | 2803 | ✍ Re-registers the action events starting from the root vehicle (calls `registerActionEvents` on it). |
| `Vehicle:registerActionEvents(excludedVehicle: any)` | 2810 | ✍ Registers the input events of this vehicle and its specializations (raises `onPreRegisterActionEvents`/`onRegisterActionEvents`), the implement-switch actions when several objects are selectable, debug actions and automatic-control actions. Does nothing while a GUI is open, the player is frozen or the vehicle is excluded. |
| `Vehicle:removeActionEvent(actionEventsTable: any, inputAction: any)` | 2946 | ✍ Removes one action event from the given table (by input action) from `g_inputBinding` and clears the table entry. |
| `Vehicle:updateSelectableObjects()` | 2961 | ✍ Rebuilds the list of selectable objects; only the root vehicle fills it, by calling `registerSelectableObjects`. |
| `Vehicle:registerSelectableObjects(selectableObjects: any)` | 2970 | ✍ Adds this vehicle's selection object to the list and records its index, if it can be selected and selection is not blocked. |
| `Vehicle:addSubselection(subSelection: any)` | 2979 | ✍ Appends a sub-selection entry to this vehicle's selection object and returns its index. |
| `Vehicle:clearSubselections()` | 2986 | ✍ Empties the sub-selection list of this vehicle's selection object. |
| `Vehicle:getCanBeSelected()` | 2992 | ✍ Default: true only while a vehicle debug mode is active, so any vehicle can be inspected. Implements and drivable vehicles override it. |
| `Vehicle:getBlockSelection()` | 2998 | ✍ Returns true when the XML disallowed selection (`vehicle.base.selection#allowed`). |
| `Vehicle:getCanToggleSelectable()` | 3004 | ✍ Default: false. Overridden to allow switching between selectable implements with the input actions. |
| `Vehicle:getRootVehicle()` | 3010 | ✍ Returns the cached root vehicle of the attachment chain (self if not attached). |
| `Vehicle:findRootVehicle()` | 3016 | ✍ Computes the root vehicle by walking up the chain; the base version returns self, attacher specializations override it. |
| `Vehicle:getChildVehicles()` | 3022 | ✍ Returns the cached table of this vehicle plus all attached children. |
| `Vehicle:getChildVehicleHash()` | 3028 | ✍ Returns the string built from the child vehicle ids, usable to detect that the attachment chain changed. |
| `Vehicle:addChildVehicles(vehicles: any, rootVehicle: any)` | 3034 | ✍ Appends this vehicle to the given list and extends the root's child hash with its id. Attacher specializations extend it to add their implements. |
| `Vehicle:updateVehicleChain(secondCall: any)` | 3041 | ✍ Recomputes the root vehicle (raising `onRootVehicleChanged` if it changed), then rebuilds the child list and hash from the root and updates every child in turn. |
| `Vehicle:unselectVehicle()` | 3072 | ✍ Clears this vehicle's selected flag, raises `onUnselect` and requests an action event update. |
| `Vehicle:selectVehicle(subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3081 | ✍ Sets this vehicle's selected flag and raises `onSelect` with the sub-selection index; requests an action event update unless `ignoreActionEventUpdate` is true. |
| `Vehicle:setSelectedVehicle(vehicle: any, subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3092 | ✍ Selects the given vehicle, falling back to the first selectable one if it cannot be selected, and delegates to `setSelectedObject`. Returns whether the selection changed. |
| `Vehicle:setSelectedObject(object: any, subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3115 | ✍ Makes a selection object current if it is in the selectable list: unselects the others, updates index and sub-index and selects the new vehicle. Returns true when the selection changed; clears it if the old object disappeared. |
| `Vehicle:getIsSelected()` | 3174 | ✍ Returns whether this vehicle's selection object is currently selected (false if it has none). |
| `Vehicle:getSelectedObject()` | 3184 | ✍ Returns the current selection object of the root vehicle (nil if none). |
| `Vehicle:getSelectedVehicle()` | 3195 | ✍ Returns the vehicle belonging to the current selection object, or nil. |
| `Vehicle:hasInputConflictWithSelection(inputs: any)` | 3205 | ✍ Deprecated: prints the callstack and a warning, always returns false. |
| `Vehicle:setMassDirty()` | 3213 | ✍ Flags the mass for recomputation; `update` calls `updateMass` after the first update. |
| `Vehicle:updateMass()` | 3219 | ✍ Recomputes component masses (default plus additional mass), scales them down if the maximum total mass would be exceeded, and on the server applies `setMass` on dynamic components when the change exceeds 0.02 (mass in tonnes). Updates `serverMass` and `precalculatedMass`. |
| `Vehicle:getMaxComponentMassReached()` | 3274 | ✍ Returns true when the server mass has reached the allowed maximum (maxMass minus precalculated mass), with a 0.001 tolerance. |
| `Vehicle:getAvailableComponentMass()` | 3280 | ✍ Returns the remaining mass that can still be added before the maximum, never below 0. |
| `Vehicle:getAdditionalComponentMass(component: any)` | 3286 | ✍ Default: 0. Specializations (fill units, wheels, ...) override it to add mass to a component. |
| `Vehicle:getTotalMass(onlyGivenVehicle: boolean) → number` | 3294 | ✍ Sums the mass of this vehicle's components (tonnes). The base version ignores `onlyGivenVehicle`; attacher specializations include implements. |
| `Vehicle:getComponentMass(component: table) → number` | 3308 | ✍ Returns the mass of the given component table, or 0 if nil. |
| `Vehicle:getDefaultMass()` | 3318 | ✍ Sums the default (unloaded) masses of all components. |
| `Vehicle:getOverallCenterOfMass() → number, number, number` | 3333 | ✍ Returns the mass-weighted world center of mass (x, y, z) of all components. |
| `Vehicle:getVehicleWorldXRot() → number` | 3351 | ✍ Returns the pitch/slope angle in radians of the first component's forward axis relative to the horizontal, in the range -pi/2 to pi/2. |
| `Vehicle:getVehicleWorldDirection() → number, number, number` | 3366 | ✍ Returns the world-space forward direction (x, y, z) of the first component. |
| `Vehicle:getFillLevelInformation(display: table)` | 3373 | ✍ Empty hook (no body); fill-level specializations override it to add entries to the passed display table. |
| `Vehicle:getHasObjectMounted(object: table) → boolean` | 3380 | ✍ Default: false. Overridden by specializations that can carry mounted objects. |
| `Vehicle:activate()` | 3386 | ✍ Activates the action controller and raises `onActivate`. |
| `Vehicle:deactivate()` | 3396 | ✍ Deactivates the action controller and raises `onDeactivate`. |
| `Vehicle:setComponentJointFrame(jointDesc: table, anchorActor: integer)` | 3409 | ✍ Recomputes the local pose of a joint anchor (0 or 1) from the joint node and, if the physics joint exists, updates its frame with `setJointFrame`. |
| `Vehicle:setComponentJointRotLimit(componentJoint: table, axis: integer, minLimit: number, maxLimit: number)` | 3437 | ✍ Server only: stores new min/max rotation limits for a joint axis (1-3) and applies them to the physics joint, or disables the limit if min exceeds max. |
| `Vehicle:setComponentJointTransLimit(componentJoint: table, axis: integer, minLimit: number, maxLimit: number)` | 3458 | ✍ Server only: stores new min/max translation limits for a joint axis (1-3) and applies them to the physics joint, or disables the limit if min exceeds max. |
| `Vehicle:loadComponentFromXML(component: table, xmlFile: XMLFile, key: string, rootPosition: table, i: integer) → boolean` | 3481 | ✍ Initialises one component: rigid body flags (kinematic on clients), warns on missing collision bits, recentres on the first component, reads mass (kg, converted to tonnes), center of mass, inertia, solver iterations, clip distance, and registers the node as belonging to this vehicle. Returns true. |
| `Vehicle:loadComponentJointFromXML(jointDesc: table, xmlFile: XMLFile, key: string, componentJointI: integer, jointNode: integer, index1: integer, index2: integer) → boolean` | 3597 | ✍ Reads a component joint definition (limits, springs, damping, force limits, z-rotation node, breakability, rotational/translational drives) into `jointDesc`; angles are converted to radians. Only the server reads physics data; returns false on invalid component indices. |
| `Vehicle:createComponentJoint(component1: table, component2: table, jointDesc: table) → boolean` | 3740 | ✍ Builds the physics joint between two components from the joint description (limits, springs, drives, breakability, collision) with a `JointConstructor` and stores its index in `jointDesc.jointIndex`. Returns false if an argument is missing. |
| `Vehicle:loadSchemaOverlay(xmlFile: XMLFile)` | 3814 | ✍ Reads the HUD schema overlay settings (`vehicle.base.schemaOverlay`: positions, name with mod prefix, invisible borders) into a `VehicleSchemaOverlayData`; also warns about deprecated paths. |
| `Vehicle:getAdditionalSchemaText()` | 3860 | ✍ Default: nil. Overridden to supply extra text drawn on the vehicle's schema overlay. |
| `Vehicle:getUseTurnedOnSchema()` | 3866 | ✍ Default: false. Overridden to show the turned-on variant of the schema overlay. |
| `Vehicle:dayChanged()` | 3872 | ✍ Empty hook subscribed to the day-changed message; specializations may extend it. |
| `Vehicle:periodChanged()` | 3877 | ✍ Subscribed to the period-changed message; increments the vehicle age by one (age is counted in periods, i.e. months). |
| `Vehicle:raiseStateChange(state: any, ...: any)` | 3883 | ✍ Raises the `onStateChange` event with the given state and extra arguments. |
| `Vehicle:doCheckSpeedLimit()` | 3890 | ✍ Default: false. Overridden by working tools so the speed limit is only enforced while they work. |
| `Vehicle:getWorkLoad()` | 3897 | ✍ Default: returns 0, 0 (no work load). Overridden by tools that report a workload. |
| `Vehicle:interact(player: any)` | 3904 | ✍ Empty hook called when a player interacts with the vehicle; does nothing by default. |
| `Vehicle:getInteractionHelp()` | 3909 | ✍ Default: empty string (no help text). |
| `Vehicle:getDistanceToNode(node: any)` | 3919 | ✍ Default: resets the interaction flag to NONE and returns infinity. Overridden by vehicles that can be interacted with. |
| `Vehicle:getIsAIActive()` | 3926 | ✍ Returns whether an AI job drives this vehicle, by asking the attacher vehicle if there is one; false by default. |
| `Vehicle:getIsPowered()` | 3939 | ✍ Default: true. Overridden by vehicles that need external power. |
| `Vehicle:getRequiresPower()` | 3945 | ✍ Default: false. Overridden to tell that the vehicle currently needs power so the motor can be started automatically. |
| `Vehicle:getIsInShowroom()` | 3951 | ✍ Returns true when the property state is SHOP_CONFIG (shown in the shop configuration). |
| `Vehicle:addVehicleToAIImplementList(list: any)` | 3957 | ✍ Empty hook that lets specializations add this vehicle to an AI implement list. |
| `Vehicle:setOperatingTime(operatingTime: any, isLoading: any)` | 3962 | ✍ Sets the operating time (ms, minimum 0). Unless loading, for a leased vehicle it notifies the economy manager each time a full hour boundary is crossed. |
| `Vehicle:getOperatingTime()` | 3971 | ✍ Returns the operating time in milliseconds. |
| `Vehicle:doCollisionMaskCheck(targetCollisionMask: any, path: any, node: any, str: any)` | 3977 | ✍ Checks that the component(s) or the given node have all bits of `targetCollisionMask` in their filter mask, unless an XML boolean at `path` waives the check. Logs a warning with callstack and returns false on failure. |
| `Vehicle:getIsReadyForAutomatedTrainTravel()` | 4005 | ✍ Default: true. Train-related specializations override it. |
| `Vehicle:getIsAutomaticShiftingAllowed()` | 4011 | ✍ Default: true. Overridden to forbid automatic gear shifting in some situations. |
| `Vehicle:getSpeedLimit(onlyIfWorking: boolean) → number, boolean` | 4020 | ✍ Returns the effective speed limit and whether it is being checked: raw limit reduced by damage (`DAMAGED_SPEEDLIMIT_REDUCTION`), combined with the minimum over attached implements. With `onlyIfWorking`, limits only count for vehicles that request the check. |
| `Vehicle:getRawSpeedLimit() → number` | 4053 | ✍ Returns the speed limit stored for this vehicle (from XML or specialization defaults), without damage or implements. |
| `Vehicle:onVehicleWakeUpCallback(id: any)` | 4059 | ✍ Physics wake-up callback: calls `raiseActive` so the vehicle gets updated again. |
| `Vehicle:getCanBeMounted()` | 4065 | ✍ Returns whether the first component node still exists in the engine. |
| `Vehicle:getDailyUpkeep() → number` | 4072 | ✍ Returns the daily upkeep cost from `Vehicle.calculateDailyUpkeep` for this vehicle's store item, age, operating time and configurations. |
| `Vehicle.calculateDailyUpkeep(storeItem: any, age: any, operatingTime: any, configurations: any)` | 4079 | ✍ Base store upkeep multiplied by a wear factor that grows with age (up to 30 percent weight) and operating hours (up to 70 percent weight), scaled by `EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER`. Constants of `EconomyManager` are not in the dump (UNVERIFIED). |
| `Vehicle:getUppercaseName() → string` | 4094 | ✍ Returns the full name (brand plus name) converted to upper case with `utf8ToUpper`. |
| `Vehicle:getName()` | 4102 | ✍ Returns the display name: the `vehicleName` of the first active configuration that defines one, else the store item name, or "Unknown" without a store item. |
| `Vehicle:getFullName()` | 4123 | ✍ Returns the brand title followed by the name (brand omitted when it is NONE or no store item exists). |
| `Vehicle:getBrand()` | 4138 | ✍ Returns the brand index: a configuration's `vehicleBrand` if any, else the store item's brand index, or `Brand.LIZARD` without a store item. |
| `Vehicle:getImageFilename()` | 4159 | ✍ Returns the shop icon path: a configuration's `vehicleIcon` if set, else the store item image, or the shop's empty image without a store item. Warns on an invalid configuration index. |
| `Vehicle:getCanBePickedUp(byPlayer: Player) → boolean` | 4184 | ✍ True if the vehicle supports hand pick-up (XML flag) and the access handler lets the given player access it. |
| `Vehicle:getCanBeReset()` | 4190 | ✍ True if the XML allows reset and no guided tour is running. |
| `Vehicle:getResetPlaces()` | 4196 | ✍ Returns the mission's reset places and its used load places (two values). |
| `Vehicle:getResetDialogTexts() → string, string, string` | 4206 | ✍ Returns three localized texts (confirmation, success, failure) shown around a reset; specializations can override it if their reset does something else. |
| `Vehicle:getCanBeSold()` | 4216 | ✍ Returns the store item's `canBeSold` flag, true if there is no store item. |
| `Vehicle:getCanBeAddedToSales()` | 4227 | ✍ Default: true. Overridden to prevent listing the vehicle in the sales. |
| `Vehicle:getReloadXML() → string` | 4234 | ✍ Creates an in-memory savegame-style XMLFile containing this vehicle (filename plus `saveToXMLFile` data), used by `reset` to reload it. Returns nil if creation fails; the caller must delete the XMLFile. |
| `Vehicle:getIsInUse(connection: any)` | 4250 | ✍ Default: false. Overridden to say whether the vehicle is currently used by the given connection. |
| `Vehicle:getPropertyState()` | 4256 | ✍ Returns the property state (owned, leased, shop configuration, ...). |
| `Vehicle:getAreControlledActionsAvailable()` | 4262 | ✍ False while an AI is active; otherwise asks the action controller whether controlled actions are available (false without controller). |
| `Vehicle:getAreControlledActionsAccessible()` | 4276 | ✍ False while an AI is active; otherwise delegates to the action controller's accessibility check (false without controller). |
| `Vehicle:getControlledActionIcons()` | 4290 | ✍ Returns the positive/negative icons and color-change flag from the action controller, or `TURN_ON`, `TURN_ON`, true by default. |
| `Vehicle:getAreControlledActionsAllowed() → boolean, string` | 4305 | ✍ Returns true (allowed) when no AI is active, plus an empty warning text. |
| `Vehicle:playControlledActions()` | 4311 | ✍ Asks the action controller to play its recorded controlled actions, if there is one. |
| `Vehicle:getActionControllerDirection()` | 4319 | ✍ Returns the action controller's direction, or 1 without controller. |
| `Vehicle:createMapHotspot()` | 4329 | ✍ Creates a `VehicleHotspot` for this vehicle (type, owner farm), stores it and adds it to the mission's map hotspots. |
| `Vehicle:deleteMapHotspot()` | 4341 | ✍ Removes the hotspot from the mission and deletes it, if present. |
| `Vehicle:getMapHotspot()` | 4351 | ✍ Returns the vehicle's map hotspot (nil if none). |
| `Vehicle:updateMapHotspot()` | 4357 | ✍ Sets the hotspot's visibility from `getIsMapHotspotVisible`; called every frame at the end of `update`. |
| `Vehicle:getIsMapHotspotVisible()` | 4365 | ✍ Default: true. Overridden to hide the hotspot in some states. |
| `Vehicle:getShowInVehiclesOverview()` | 4380 | ✍ True if the XML shows the vehicle in the vehicle menu and it is owned or leased. |
| `Vehicle:showInfo(box: any)` | 4386 | ✍ Adds the "vehicle broken, needs reset" line to the info HUD box when the vehicle is broken. Specializations extend it with their own lines. |
| `Vehicle:loadObjectChangeValuesFromXML(xmlFile: integer, key: string, node: integer, object: table)` | 4398 | ✍ Empty hook called by the object-change loader so specializations can read extra values per object change. |
| `Vehicle:setObjectChangeValues(object: table, isActive: boolean)` | 4405 | ✍ Empty hook called when an object change is applied or reverted, so specializations can react. |
| `Vehicle:wakeUp()` | 4410 | ✍ Briefly wakes the physics of the first component via `I3DUtil.wakeUpObject`. |
| `Vehicle:register(alreadySent: any)` | 4416 | ✍ Registers the vehicle as a network object (superclass) and raises `onRegistered`. Network registration details live in `Object` (not in this file). |
| `Vehicle:clearDirtyMask()` | 4424 | ✍ Resets the network dirty mask to 0 and raises `onDirtyMaskCleared`. |
| `Vehicle:setOwnerFarmId(farmId: any, noEventSend: any)` | 4431 | ✍ Sets the owner farm through the superclass (optionally without sending an event) and updates the map hotspot's owner farm. |
| `Vehicle:getUniqueId() → string` | 4442 | ✍ Returns the vehicle's unique id string (nil until set), used to reference it across saves. |
| `Vehicle:setUniqueId(uniqueId: string)` | 4449 | ✍ Stores the unique id. It should be set only once; the check is a debug-only assertion that is stripped from the dump. |
| `Vehicle.actionEventToggleSelection(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4457 | ✍ Input callback: moves the selection to the next sub-selection, or to the next selectable object (wrapping to the first), and applies it with `setSelectedObject`. |
| `Vehicle.actionEventToggleSelectionReverse(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4490 | ✍ Input callback for the reverse direction: moves to the previous sub-selection or object (wrapping to the last) and applies it with `setSelectedObject`. |
| `Vehicle.getSpecValueDailyUpkeep(storeItem: any, realItem: any, _: any, saleItem: any)` | 4535 | ✍ Shop spec text for daily upkeep (formatted money), taken from the real item when available; returns nil when upkeep is 0. |
| `Vehicle.getSpecValueOperatingTime(storeItem: any, realItem: any, _: any, saleItem: any)` | 4553 | ✍ Shop spec text for operating time as hours and tenths, from the real item or the sale item; nil if neither is given. |
| `Vehicle.loadSpecValueWorkingWidth(xmlFile: any, customEnvironment: any, baseDir: any)` | 4573 | ✍ Reads `vehicle.storeData.specs.workingWidth` (and `#minWidth`, default same) into a table, or returns nil if absent. |
| `Vehicle.getSpecValueWorkingWidth(storeItem: any, realItem: any)` | 4585 | ✍ Formats the working width for the shop, as a range when min and max differ; nil if the store item has none. |
| `Vehicle.loadSpecValueWorkingWidthConfig(xmlFile: any, customEnvironment: any, baseDir: any)` | 4600 | ✍ Scans every configuration item for a `#workingWidth` (and `#isSelectable`) and returns a table by configuration name and index, or nil if none. |
| `Vehicle.getSpecValueWorkingWidthConfig(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4619 | ✍ Returns the working width of the chosen configuration for a real or sale item, otherwise the min-max range over selectable configurations. Gives formatted text, or the raw number with `returnValues`. |
| `Vehicle.loadSpecValueSpeedLimit(xmlFile: any, customEnvironment: any, baseDir: any)` | 4664 | ✍ Reads `vehicle.base.speedLimit#value` for the shop. |
| `Vehicle.getSpecValueSpeedLimit(storeItem: any, realItem: any)` | 4670 | ✍ Formats the max speed with the player's speed unit for the shop; nil if the store item has no speed limit. |
| `Vehicle.loadSpecValueWeight(xmlFile: any, customEnvironment: any, baseDir: any)` | 4679 | ✍ Reads mass data from the XML for the shop: component masses (and per configuration, in tonnes), fill unit and wheel mass data, and store weight overrides/ranges. Returns nil if `weight#ignore` is set or nothing is found. |
| `Vehicle.getSpecConfigValuesWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4738 | ✍ Returns the list of weight values per configuration from the store data, or nil if none are defined. |
| `Vehicle.getSpecValueWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4749 | ✍ Shop weight: for a real item it recomputes mass and uses the total; otherwise it uses the store min/max or the sum of component, wheel and starting fill mass. Returns formatted text, or numbers with `returnValues`. |
| `Vehicle.loadSpecValueAdditionalWeight(xmlFile: any, customEnvironment: any, baseDir: any)` | 4795 | ✍ Reads `vehicle.base.components#maxMass` (kg) and returns it in tonnes, or nil if absent. |
| `Vehicle.getSpecValueAdditionalWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4806 | ✍ Shop text for how much mass can be added (max mass minus base weight); nil unless the savegame option `trailerFillLimit` is on. |
| `Vehicle.loadSpecValueCombinations(xmlFile: any, customEnvironment: any, baseDirectory: any)` | 4829 | ✍ Reads the `vehicle.storeData.specs.combination` entries (xmlFilename, filter categories, filter spec and range) into a list, warning if a referenced vehicle is unknown. |
| `Vehicle.getSpecValueCombinations(storeItem: any, realItem: any)` | 4867 | ✍ Returns the stored combination list of the store item. |
| `Vehicle.getSpecValueSlots(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4873 | ✍ Shop text for vehicle slot usage: "+n" for buying (summed over bundle items) or "-n" for selling, from the slot system; nil when the usage is 0. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreLoad` | 81 |
| registerEvent | `onLoad` | 82 |
| registerEvent | `onPostLoad` | 83 |
| registerEvent | `onPreInitComponentPlacement` | 84 |
| registerEvent | `onPreLoadFinished` | 85 |
| registerEvent | `onLoadFinished` | 86 |
| registerEvent | `onLoadEnd` | 87 |
| registerEvent | `onRegistered` | 88 |
| registerEvent | `onDirtyMaskCleared` | 89 |
| registerEvent | `onPreDelete` | 90 |
| registerEvent | `onDelete` | 91 |
| registerEvent | `onSave` | 92 |
| registerEvent | `onReadStream` | 93 |
| registerEvent | `onWriteStream` | 94 |
| registerEvent | `onReadUpdateStream` | 95 |
| registerEvent | `onWriteUpdateStream` | 96 |
| registerEvent | `onReadPositionUpdateStream` | 97 |
| registerEvent | `onWritePositionUpdateStream` | 98 |
| registerEvent | `onHandToolTaken` | 99 |
| registerEvent | `onHandToolPlaced` | 100 |
| registerEvent | `onPreUpdate` | 101 |
| registerEvent | `onUpdate` | 102 |
| registerEvent | `onUpdateInterpolation` | 103 |
| registerEvent | `onUpdateDebug` | 104 |
| registerEvent | `onPostUpdate` | 105 |
| registerEvent | `onUpdateTick` | 106 |
| registerEvent | `onPostUpdateTick` | 107 |
| registerEvent | `onUpdateEnd` | 108 |
| registerEvent | `onDraw` | 109 |
| registerEvent | `onDrawUIInfo` | 110 |
| registerEvent | `onActivate` | 111 |
| registerEvent | `onDeactivate` | 112 |
| registerEvent | `onStateChange` | 113 |
| registerEvent | `onPreRegisterActionEvents` | 114 |
| registerEvent | `onRegisterActionEvents` | 115 |
| registerEvent | `onRootVehicleChanged` | 116 |
| registerEvent | `onSelect` | 117 |
| registerEvent | `onUnselect` | 118 |
| registerEvent | `onSetBroken` | 119 |
| registerEvent | `onSaleItemSet` | 120 |
| registerFunction | `register` | 126 |
| registerFunction | `setOwnerFarmId` | 127 |
| registerFunction | `loadSubSharedI3DFile` | 128 |
| registerFunction | `drawUIInfo` | 129 |
| registerFunction | `raiseActive` | 130 |
| registerFunction | `setLoadingState` | 131 |
| registerFunction | `setLoadingStep` | 132 |
| registerFunction | `addToPhysics` | 133 |
| registerFunction | `removeFromPhysics` | 134 |
| registerFunction | `setVisibility` | 135 |
| registerFunction | `setRelativePosition` | 136 |
| registerFunction | `setAbsolutePosition` | 137 |
| registerFunction | `getLimitedVehicleYPosition` | 138 |
| registerFunction | `setWorldPosition` | 139 |
| registerFunction | `setWorldPositionQuaternion` | 140 |
| registerFunction | `setDefaultComponentPosition` | 141 |
| registerFunction | `getIsNodeActive` | 142 |
| registerFunction | `updateVehicleSpeed` | 143 |
| registerFunction | `getUpdatePriority` | 144 |
| registerFunction | `getPrice` | 145 |
| registerFunction | `getSellPrice` | 146 |
| registerFunction | `getDailyUpkeep` | 147 |
| registerFunction | `getIsOnField` | 148 |
| registerFunction | `getParentComponent` | 149 |
| registerFunction | `getLastSpeed` | 150 |
| registerFunction | `getDeactivateOnLeave` | 151 |
| registerFunction | `getOwnerConnection` | 152 |
| registerFunction | `getIsVehicleNode` | 153 |
| registerFunction | `getIsOperating` | 154 |
| registerFunction | `getIsActive` | 155 |
| registerFunction | `getIsActiveForInput` | 156 |
| registerFunction | `getIsActiveForSound` | 157 |
| registerFunction | `getIsLowered` | 158 |
| registerFunction | `updateWaterInfo` | 159 |
| registerFunction | `onWaterRaycastCallback` | 160 |
| registerFunction | `setBroken` | 161 |
| registerFunction | `getVehicleDamage` | 162 |
| registerFunction | `getRepairPrice` | 163 |
| registerFunction | `getRepaintPrice` | 164 |
| registerFunction | `setMassDirty` | 165 |
| registerFunction | `updateMass` | 166 |
| registerFunction | `getMaxComponentMassReached` | 167 |
| registerFunction | `getAdditionalComponentMass` | 168 |
| registerFunction | `getTotalMass` | 169 |
| registerFunction | `getComponentMass` | 170 |
| registerFunction | `getDefaultMass` | 171 |
| registerFunction | `getOverallCenterOfMass` | 172 |
| registerFunction | `getVehicleWorldXRot` | 173 |
| registerFunction | `getVehicleWorldDirection` | 174 |
| registerFunction | `getFillLevelInformation` | 175 |
| registerFunction | `getHasObjectMounted` | 176 |
| registerFunction | `activate` | 177 |
| registerFunction | `deactivate` | 178 |
| registerFunction | `setComponentJointFrame` | 179 |
| registerFunction | `setComponentJointRotLimit` | 180 |
| registerFunction | `setComponentJointTransLimit` | 181 |
| registerFunction | `loadComponentFromXML` | 182 |
| registerFunction | `loadComponentJointFromXML` | 183 |
| registerFunction | `createComponentJoint` | 184 |
| registerFunction | `loadSchemaOverlay` | 185 |
| registerFunction | `getAdditionalSchemaText` | 186 |
| registerFunction | `getUseTurnedOnSchema` | 187 |
| registerFunction | `dayChanged` | 188 |
| registerFunction | `periodChanged` | 189 |
| registerFunction | `raiseStateChange` | 190 |
| registerFunction | `doCheckSpeedLimit` | 191 |
| registerFunction | `interact` | 192 |
| registerFunction | `getInteractionHelp` | 193 |
| registerFunction | `getIsInteractive` | 194 |
| registerFunction | `getDistanceToNode` | 195 |
| registerFunction | `getIsAIActive` | 196 |
| registerFunction | `getIsPowered` | 197 |
| registerFunction | `getRequiresPower` | 198 |
| registerFunction | `getIsInShowroom` | 199 |
| registerFunction | `addVehicleToAIImplementList` | 200 |
| registerFunction | `setOperatingTime` | 201 |
| registerFunction | `requestActionEventUpdate` | 203 |
| registerFunction | `removeActionEvents` | 204 |
| registerFunction | `updateActionEvents` | 205 |
| registerFunction | `registerActionEvents` | 206 |
| registerFunction | `addActionEvent` | 207 |
| registerFunction | `updateSelectableObjects` | 209 |
| registerFunction | `registerSelectableObjects` | 210 |
| registerFunction | `addSubselection` | 211 |
| registerFunction | `getRootVehicle` | 212 |
| registerFunction | `findRootVehicle` | 213 |
| registerFunction | `getChildVehicles` | 214 |
| registerFunction | `addChildVehicles` | 215 |
| registerFunction | `updateVehicleChain` | 216 |
| registerFunction | `getCanBeSelected` | 217 |
| registerFunction | `getBlockSelection` | 218 |
| registerFunction | `getCanToggleSelectable` | 219 |
| registerFunction | `unselectVehicle` | 220 |
| registerFunction | `selectVehicle` | 221 |
| registerFunction | `getIsSelected` | 222 |
| registerFunction | `getSelectedObject` | 223 |
| registerFunction | `getSelectedVehicle` | 224 |
| registerFunction | `setSelectedVehicle` | 225 |
| registerFunction | `setSelectedObject` | 226 |
| registerFunction | `getIsReadyForAutomatedTrainTravel` | 227 |
| registerFunction | `getIsAutomaticShiftingAllowed` | 228 |
| registerFunction | `getSpeedLimit` | 229 |
| registerFunction | `getRawSpeedLimit` | 230 |
| registerFunction | `getActiveFarm` | 231 |
| registerFunction | `onVehicleWakeUpCallback` | 232 |
| registerFunction | `getCanBeMounted` | 233 |
| registerFunction | `getName` | 234 |
| registerFunction | `getFullName` | 235 |
| registerFunction | `getBrand` | 236 |
| registerFunction | `getImageFilename` | 237 |
| registerFunction | `getCanBePickedUp` | 238 |
| registerFunction | `getCanBeReset` | 239 |
| registerFunction | `getResetPlaces` | 240 |
| registerFunction | `getResetDialogTexts` | 241 |
| registerFunction | `reset` | 242 |
| registerFunction | `getCanBeSold` | 243 |
| registerFunction | `getCanBeAddedToSales` | 244 |
| registerFunction | `getReloadXML` | 245 |
| registerFunction | `getIsInUse` | 246 |
| registerFunction | `getPropertyState` | 247 |
| registerFunction | `getAreControlledActionsAllowed` | 248 |
| registerFunction | `getAreControlledActionsAvailable` | 249 |
| registerFunction | `getAreControlledActionsAccessible` | 250 |
| registerFunction | `getControlledActionIcons` | 251 |
| registerFunction | `playControlledActions` | 252 |
| registerFunction | `getActionControllerDirection` | 253 |
| registerFunction | `createMapHotspot` | 254 |
| registerFunction | `getMapHotspot` | 255 |
| registerFunction | `updateMapHotspot` | 256 |
| registerFunction | `getIsMapHotspotVisible` | 257 |
| registerFunction | `getMapHotspotRotation` | 258 |
| registerFunction | `getMapHotspotPosition` | 259 |
| registerFunction | `getShowInVehiclesOverview` | 260 |
| registerFunction | `showInfo` | 261 |
| registerFunction | `loadObjectChangeValuesFromXML` | 262 |
| registerFunction | `setObjectChangeValues` | 263 |
| registerFunction | `getIsSynchronized` | 264 |

## Messages

- subscribes `MessageType.DAY_CHANGED` (l.1028)
- subscribes `MessageType.PERIOD_CHANGED` (l.1029)
- publishes `MessageType.VEHICLE_RESET` (l.1481)
