---@meta
-- FS25 1.25.1.0 : vehicles/Vehicle.lua (generated stub, FS25 Lua Atlas)

--- Base class of every in-game vehicle (extends `Object`). It loads the vehicle XML and i3d asynchronously, builds the physics components and joints, instantiates the specializations of the vehicle type and dispatches the lifecycle events (`onLoad`, `onUpdate`, `onDelete`, ...) to them. It also handles network streams and position interpolation on clients, saving to the savegame, selection of implements, mass, price/upkeep, water detection and shop spec values. Many methods are registered as overridable functions on each vehicle type via `Vehicle.registerFunctions`. The `Environment`, `XMLFile`, `FSBaseMission` classes and vehicle system are not in the dump (UNVERIFIED).
---@class Vehicle : Object
Vehicle = {}

--- Creates a numbered `Vehicle.INTERACTION_FLAG_<NAME>` constant on first use (name upper-cased) and returns its value; calling again with the same name returns the existing flag.
---@param name string
function Vehicle.registerInteractionFlag(name) end

--- Registers on a vehicle type all base lifecycle events (`onPreLoad`, `onLoad`, `onPostLoad`, `onUpdate`, `onUpdateTick`, `onDraw`, `onDelete`, `onSave`, stream read/write, selection, `onSetBroken`, ...). Specializations can then listen to them.
---@param vehicleType any
function Vehicle.registerEvents(vehicleType) end

--- Registers about a hundred `Vehicle` methods (position, mass, selection, speed limit, naming, map hotspot, action events, ...) as overridable functions on a vehicle type through `SpecializationUtil.registerFunction`.
---@param vehicleType any
function Vehicle.registerFunctions(vehicleType) end

--- One-time class initialisation: declares the vehicle configuration types (baseColor, vehicleType, component, design 1-16 and designColor), adds the shop spec types (age, operatingTime, weight, workingWidth, slots, ...), creates the XML schemas (vehicle, sounds, savegame) and calls `Vehicle.registers`.
function Vehicle.init() end

--- Deferred step after init: for every known configuration type, adds async subtasks that register its XML paths in the vehicle and savegame schemas (including #workingWidth and #typeDesc), plus a legacy `boughtConfiguration` savegame path.
function Vehicle.postInit() end

--- Registers the base XML paths of vehicle files (`vehicle.base.*`: filename, size, mass components, joints, hotspot, speed limit, tailwater depth, schema overlay, store specs) and the savegame attributes of `vehicles.vehicle(?)` (uniqueId, age, price, farmId, operatingTime, component positions).
function Vehicle.registers() end

--- Registers under `basePath` the XML paths for physical components (index, mass in kg, center of mass, inertia scale, solver iterations), component joints (limits, springs, drives, breakability) and collision pairs. Used for both the default and per-configuration component sets.
---@param schema any
---@param basePath any
function Vehicle.registerComponentXMLPaths(schema, basePath) end

--- Constructor. Builds an `Object` with the vehicle metatable and initialises loading state, loading step, task list, unique id (nil) and a `VehicleActionController`. No XML or i3d is loaded yet.
---@param isServer any
---@param isClient any
---@param customMt any
function Vehicle.new(isServer, isClient, customMt) end

--- Stores the vehicle XML path and derives the cleaned name, the mod environment name and the base directory from it. Must be called before `setType`.
---@param filename any
function Vehicle:setFilename(filename) end

--- Stores the selected and bought configurations (and optional configuration data) and builds an alphabetically sorted list of configuration names.
---@param configurations any
---@param boughtConfigurations any
---@param configurationData any
function Vehicle:setConfigurations(configurations, boughtConfigurations, configurationData) end

--- Applies the vehicle type: if a `vehicleType` configuration item names a different known type it replaces the given one (warning if unknown), then the type's specializations are initialised on this vehicle. Asserts that a filename was set.
---@param typeDef any
function Vehicle:setType(typeDef) end

--- Remembers the function, target and arguments to call once loading finishes or fails. See `loadCallback`.
---@param loadCallbackFunction any
---@param loadCallbackFunctionTarget any
---@param loadCallbackFunctionArguments any
function Vehicle:setLoadCallback(loadCallbackFunction, loadCallbackFunctionTarget, loadCallbackFunctionArguments) end

--- Calls the stored load callback with (target, vehicle, loadingState, arguments) and then clears it, so it fires at most once.
function Vehicle:loadCallback() end

--- Starts loading from the XML: validates the type, loads the XMLFile, resolves store item, brand and sounds file, reconciles saved configurations with the store item's configuration sets, creates specialization environments, raises `onPreLoad` and requests the i3d asynchronously. Returns nil while pending, or the error state/false if pre-load fails.
---@param vehicleLoadingData any
function Vehicle:load(vehicleLoadingData) end

--- Callback of the shared i3d request. On failure sets the ERROR loading state and fires the load callback; otherwise stores the node, hides it and queues `loadFinished` on the async task manager.
---@param i3dNode any
---@param failedReason any
---@param arguments any
---@param i3dLoadingId any
function Vehicle:i3dFileLoaded(i3dNode, failedReason, arguments, i3dLoadingId) end

--- Main asynchronous loading pipeline, split into many named tasks: components and root nodes, i3d mappings, joints, collision pairs, size, misc data (speed limit, water thresholds, day/period subscriptions), then `onLoad`, `onPostLoad`, `onPreInitComponentPlacement`, savegame values, positioning and selection. Ends in `onFinishedLoading` or waits for sub i3d tasks.
function Vehicle:loadFinished() end

--- Requests an extra shared i3d for the vehicle and registers a loading task so the vehicle waits for it. If the vehicle was deleted meanwhile, the loaded node is freed and the callback gets node 0. Returns the shared load request id.
---@param filename any
---@param callOnCreate any
---@param addToPhysics any
---@param asyncCallbackFunction any
---@param asyncCallbackObject any
---@param asyncCallbackArguments any
function Vehicle:loadSubSharedI3DFile(filename, callOnCreate, addToPhysics, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

--- Final loading step. The server shows the vehicle and adds it to physics (clients do it later in `postReadStream`); then raises `onLoadFinished`, creates the map hotspot, registers the vehicle in the vehicle system, owned/leased item lists, optionally `register()`, raises `onLoadEnd` and fires the load callback.
function Vehicle:onFinishedLoading() end

--- Creates a pending loading task for `target` via `SpecializationUtil.createLoadingTask` and returns it. The vehicle will not finish loading until the task is finished.
---@param target any
---@return table
function Vehicle:createLoadingTask(target) end

--- Marks a loading task as done through `SpecializationUtil.finishLoadingTask`; the exact trigger of `onFinishedLoading` lives in that helper (not in this file).
---@param task table
function Vehicle:finishLoadingTask(task) end

--- Deletes the vehicle. First call cleans up hotspot, tour, messages, AI job and owned/leased lists, then (unless `immediate` or game exit) hands deletion to the vehicle system for later. The real deletion raises `onPreDelete`/`onDelete`, removes joints, frees nodes, i3d and XML, and calls the superclass.
---@param immediate any
function Vehicle:delete(immediate) end

--- Replaces the vehicle by a fresh copy reloaded from its own save-style XML (see `getReloadXML`), optionally deleting the old one first and teleporting the local player out. Publishes `MessageType.VEHICLE_RESET` on success; `callback(success)` is called when done. Ignored if a reset is already running.
---@param forceDelete any
---@param callback any
---@param resetPlayer any
function Vehicle:reset(forceDelete, callback, resetPlayer) end

--- Returns whether the vehicle is saved in the savegame (the `isSaved` flag from its loading data).
function Vehicle:getNeedsSaving() end

--- Writes the vehicle to the savegame XML: uniqueId, age, price, farm, property state, operating time (seconds), tour id, selection indices on the root vehicle, broken flag, component world positions and rotations, configurations, then each specialization's `saveToXMLFile` and the action controller.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Vehicle:saveToXMLFile(xmlFile, key, usedModNames) end

--- Writes name, category, type and position of the vehicle into a stats XML (using the legacy `setXML*` functions) and lets each specialization add its own stats. Returns false if the vehicle is deleted, unsaved or not tabbable.
---@param xmlFile any
---@param key any
---@return string
function Vehicle:saveStatsToXMLFile(xmlFile, key) end

--- Client side, on join: reads the filename, configurations and property state from the stream and starts loading the vehicle asynchronously via `VehicleLoadingData:loadVehicleOnClient`. Logs an error if loading was already started; notifies `g_client` when done.
---@param streamId integer
---@param connection table
---@param objectId any
function Vehicle:readStream(streamId, connection, objectId) end

--- Client side, once the vehicle is loaded: reads compressed component positions and rotations, mass, age, operating time, price and broken flag, raises `onReadStream` for the specializations, makes the vehicle visible, adds it to physics and sets the SYNCHRONIZED step.
---@param streamId integer
---@param connection table
function Vehicle:postReadStream(streamId, connection) end

--- Server side, on client join: writes the network filename, configurations and property state. The rest is sent later by `postWriteStream`.
---@param streamId integer
---@param connection table
function Vehicle:writeStream(streamId, connection) end

--- Server side, once the client has loaded the vehicle: writes compressed component positions and rotations, server mass, age, operating time, price and broken flag, then raises `onWriteStream`. Mirrors `postReadStream`.
---@param streamId integer
---@param connection table
function Vehicle:postWriteStream(streamId, connection) end

--- Client side per-update read: if the server sent a position update, feeds the target positions/quaternions of non-static components to the network interpolators and raises `onReadPositionUpdateStream`; then raises `onReadUpdateStream`.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Vehicle:readUpdateStream(streamId, timestamp, connection) end

--- Server side per-update write: when the vehicle dirty flag is set, writes compressed positions and rotations of non-static components and raises `onWritePositionUpdateStream`; always raises `onWriteUpdateStream` for the specializations.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Vehicle:writeUpdateStream(streamId, connection, dirtyMask) end

--- Computes speed (m/ms), signed speed, moving direction, moved distance and acceleration of the first component, from physics velocity on a server dynamic body or from position change/interpolation otherwise, then updates the smoothed values `lastSpeed`, `lastSpeedReal`, etc.
---@param dt any
function Vehicle:updateVehicleSpeed(dt) end

--- Per-frame update. On the server it detects NaN, out-of-world or below-terrain positions and resets the vehicle. Then it refreshes distance to camera, raises `onPreUpdate`, interpolates client positions, updates speed and action events, raises `onUpdate`/`onPostUpdate`, updates mass if dirty and keeps the vehicle awake while physics is not sleeping.
---@param dt any
function Vehicle:update(dt) end

--- Fixed-step update. Refreshes water info and the on-field flag, on the server flags position changes for network sync (always if owned by a connection), handles the tailwater warning (breaks the vehicle beyond the threshold), accumulates operating time, then raises `onUpdateTick`/`onPostUpdateTick`.
---@param dt number
function Vehicle:updateTick(dt) end

--- Last update before the vehicle goes to sleep: sets the update distance to 0 so specializations reach a consistent state, then raises `onUpdateEnd`.
---@param dt any
function Vehicle:updateEnd(dt) end

--- Draw pass for the entered vehicle, if synchronized. Also draws the root and the selected vehicle when they differ, raises `onDraw` on the selected/root vehicle, runs debug drawing and shows the blinking water warning.
---@param subDraw any
function Vehicle:draw(subDraw) end

--- If synchronized, raises `onDrawUIInfo` and, when `g_showVehicleDistance` is set, renders the camera distance above the vehicle up to 350 m.
function Vehicle:drawUIInfo() end

--- Sets the loading state if the value is a valid `VehicleLoadingState`; otherwise prints a callstack and logs an error.
---@param loadingState any
function Vehicle:setLoadingState(loadingState) end

--- Sets the loading step by delegating to `SpecializationUtil.setLoadingStep` (validation is done there, not in this file).
---@param loadingStep SpecializationLoadStep
function Vehicle:setLoadingStep(loadingStep) end

--- Adds all components to physics, links motorized components with vehicle links, and on the server creates component joints, a wake-up report and collision pair settings; marks mass dirty. Returns true if it was added, false if already in physics.
---@return boolean
function Vehicle:addToPhysics() end

--- Removes every component from physics and, on the server, invalidates the joint indices and the wake-up report. Always returns true.
function Vehicle:removeFromPhysics() end

--- Shows or hides all component nodes of the vehicle.
---@param state boolean
function Vehicle:setVisibility(state) end

--- Places the vehicle at (x, z) at `offsetY` above the terrain height at that point, with yaw `yRot` (other angles 0), via `setAbsolutePosition`.
---@param positionX number
---@param offsetY number
---@param positionZ number
---@param yRot number
function Vehicle:setRelativePosition(positionX, offsetY, positionZ, yRot) end

--- Positions all components relative to a temporary root at the given world position and rotation, using each component's original offsets (or explicit `componentPositions` if one per component), and resets network interpolation.
---@param positionX any
---@param positionY any
---@param positionZ any
---@param xRot any
---@param yRot any
---@param zRot any
---@param componentPositions any
function Vehicle:setAbsolutePosition(positionX, positionY, positionZ, xRot, yRot, zRot, componentPositions) end

--- Returns `position.posY` if present, otherwise the terrain height at (posX, posZ) plus `yOffset` (0 by default). Despite its name, no clamping is visible in this file.
---@param position any
function Vehicle:getLimitedVehicleYPosition(position) end

--- Sets world translation and Euler rotation of one component by index; with `changeInterp` also resets that component's network interpolators. Does nothing for an unknown index.
---@param x number
---@param y number
---@param z number
---@param xRot number
---@param yRot number
---@param zRot number
---@param componentIndex integer
---@param changeInterp boolean
function Vehicle:setWorldPosition(x, y, z, xRot, yRot, zRot, componentIndex, changeInterp) end

--- Same as `setWorldPosition` but with a quaternion rotation; used by clients for interpolated movement and when reading streams.
---@param x number
---@param y number
---@param z number
---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@param componentIndex integer
---@param changeInterp boolean
function Vehicle:setWorldPositionQuaternion(x, y, z, qx, qy, qz, qw, componentIndex, changeInterp) end

--- Moves a component (not the first one) back to its original offset relative to the vehicle root node.
---@param componentIndex integer
function Vehicle:setDefaultComponentPosition(componentIndex) end

--- Lifts all components above the terrain (largest penetration plus 10 m) while temporarily removed from physics, then re-adds them and does the same for attached child vehicles.
function Vehicle:resetPositionToTerrainHeight() end

--- Walks up the node's parents to find which root-level component node contains it; returns false if that component is disabled by the component configuration or no match is found, true if active.
---@param node integer
function Vehicle:getIsNodeActive(node) end

--- Returns the stored purchase price of the vehicle.
function Vehicle:getPrice() end

--- Returns the sell price from `Vehicle.calculateSellPrice` using the store item, age, operating time, price and repair/repaint costs of this vehicle.
---@return number
function Vehicle:getSellPrice() end

--- Computes a resale value: depreciation by operating hours (exponent 1.3 for non-motorized items) and by age in years (log curve capped at 0.85), minus repair and repaint costs, never below 3 percent of the price.
---@param storeItem any
---@param age any
---@param operatingTime any
---@param price any
---@param repairPrice any
---@param repaintPrice any
function Vehicle.calculateSellPrice(storeItem, age, operatingTime, price, repairPrice, repaintPrice) end

--- Checks each component's center of mass and returns true if any of them is above a field per `FSDensityMapUtil.getFieldDataAtWorldPosition`; stops early if a component is more than 1 m below the terrain.
---@return boolean
function Vehicle:getIsOnField() end

--- Climbs from the given node up the scene graph and returns the first node that is a component of this vehicle, or 0 if none.
---@param node integer
---@return integer
function Vehicle:getParentComponent(node) end

--- Returns the smoothed speed in km/h (internal value times 3600); with `useAttacherVehicleSpeed` it recurses to the attacher vehicle when there is one.
---@param useAttacherVehicleSpeed boolean
---@return number
function Vehicle:getLastSpeed(useAttacherVehicleSpeed) end

--- Default implementation: always true (the vehicle is deactivated when the player leaves it). Specializations may override.
function Vehicle:getDeactivateOnLeave() end

--- True once the loading step has reached SYNCHRONIZED (immediately after loading on the server, after `postReadStream` on clients).
function Vehicle:getIsSynchronized() end

--- Returns true if the node id is one of this vehicle's registered component nodes.
---@param nodeId integer
---@return boolean
function Vehicle:getIsVehicleNode(nodeId) end

--- Default: false. Specializations override it to say the vehicle is working; `updateTick` adds elapsed time to the operating time while it returns true.
---@return boolean
function Vehicle:getIsOperating() end

--- Returns false when broken, true if `forceIsActive` is set, otherwise false. Specializations extend it (e.g. when entered or running).
function Vehicle:getIsActive() end

--- Tells whether this vehicle may receive player input: input allowed, mission running, not AI-driven (unless `activeForAI`), selected (unless `ignoreSelection`) and the root vehicle also active; a root that cannot be entered must have an attacher.
---@param ignoreSelection any
---@param activeForAI any
function Vehicle:getIsActiveForInput(ignoreSelection, activeForAI) end

--- Deprecated: prints a warning and returns false.
function Vehicle:getIsActiveForSound() end

--- Default: returns false. Tools override it to report whether they are lowered.
---@param defaultIsLowered any
function Vehicle:getIsLowered(defaultIsLowered) end

--- Starts an asynchronous downward raycast against water from the vehicle's mid-height; the result arrives in `onWaterRaycastCallback`. Skipped while a previous request is pending.
function Vehicle:updateWaterInfo() end

--- Raycast result handler: sets `waterY`, `isInWater`, shallow/medium flags (depth of 0.5 m or less counts as shallow) and `tailwaterDepth`. Returns false to stop the raycast.
---@param nodeId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function Vehicle:onWaterRaycastCallback(nodeId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Marks the vehicle broken. On the server it first broadcasts a `VehicleBrokenEvent`; raises `onSetBroken` and aborts a running guided tour if the vehicle belongs to it.
function Vehicle:setBroken() end

--- Default: 0 (no damage). Overridden by wearable-style specializations; used by `getSpeedLimit`.
function Vehicle:getVehicleDamage() end

--- Default: 0. Specializations override it to give the repair cost used in the sell price.
function Vehicle:getRepairPrice() end

--- Default: 0. Specializations override it to give the repaint cost used in the sell price.
function Vehicle:getRepaintPrice() end

--- Asks the root vehicle to rebuild input action events on its next update and removes the current action events of that root immediately.
function Vehicle:requestActionEventUpdate() end

--- Removes every input action event registered by this vehicle as target in `g_inputBinding`.
function Vehicle:removeActionEvents() end

--- Re-registers the action events starting from the root vehicle (calls `registerActionEvents` on it).
function Vehicle:updateActionEvents() end

--- Registers the input events of this vehicle and its specializations (raises `onPreRegisterActionEvents`/`onRegisterActionEvents`), the implement-switch actions when several objects are selectable, debug actions and automatic-control actions. Does nothing while a GUI is open, the player is frozen or the vehicle is excluded.
---@param excludedVehicle any
function Vehicle:registerActionEvents(excludedVehicle) end

--- Removes one action event from the given table (by input action) from `g_inputBinding` and clears the table entry.
---@param actionEventsTable any
---@param inputAction any
function Vehicle:removeActionEvent(actionEventsTable, inputAction) end

--- Rebuilds the list of selectable objects; only the root vehicle fills it, by calling `registerSelectableObjects`.
function Vehicle:updateSelectableObjects() end

--- Adds this vehicle's selection object to the list and records its index, if it can be selected and selection is not blocked.
---@param selectableObjects any
function Vehicle:registerSelectableObjects(selectableObjects) end

--- Appends a sub-selection entry to this vehicle's selection object and returns its index.
---@param subSelection any
function Vehicle:addSubselection(subSelection) end

--- Empties the sub-selection list of this vehicle's selection object.
function Vehicle:clearSubselections() end

--- Default: true only while a vehicle debug mode is active, so any vehicle can be inspected. Implements and drivable vehicles override it.
function Vehicle:getCanBeSelected() end

--- Returns true when the XML disallowed selection (`vehicle.base.selection#allowed`).
function Vehicle:getBlockSelection() end

--- Default: false. Overridden to allow switching between selectable implements with the input actions.
function Vehicle:getCanToggleSelectable() end

--- Returns the cached root vehicle of the attachment chain (self if not attached).
function Vehicle:getRootVehicle() end

--- Computes the root vehicle by walking up the chain; the base version returns self, attacher specializations override it.
function Vehicle:findRootVehicle() end

--- Returns the cached table of this vehicle plus all attached children.
function Vehicle:getChildVehicles() end

--- Returns the string built from the child vehicle ids, usable to detect that the attachment chain changed.
function Vehicle:getChildVehicleHash() end

--- Appends this vehicle to the given list and extends the root's child hash with its id. Attacher specializations extend it to add their implements.
---@param vehicles any
---@param rootVehicle any
function Vehicle:addChildVehicles(vehicles, rootVehicle) end

--- Recomputes the root vehicle (raising `onRootVehicleChanged` if it changed), then rebuilds the child list and hash from the root and updates every child in turn.
---@param secondCall any
function Vehicle:updateVehicleChain(secondCall) end

--- Clears this vehicle's selected flag, raises `onUnselect` and requests an action event update.
function Vehicle:unselectVehicle() end

--- Sets this vehicle's selected flag and raises `onSelect` with the sub-selection index; requests an action event update unless `ignoreActionEventUpdate` is true.
---@param subSelectionIndex any
---@param ignoreActionEventUpdate any
function Vehicle:selectVehicle(subSelectionIndex, ignoreActionEventUpdate) end

--- Selects the given vehicle, falling back to the first selectable one if it cannot be selected, and delegates to `setSelectedObject`. Returns whether the selection changed.
---@param vehicle any
---@param subSelectionIndex any
---@param ignoreActionEventUpdate any
function Vehicle:setSelectedVehicle(vehicle, subSelectionIndex, ignoreActionEventUpdate) end

--- Makes a selection object current if it is in the selectable list: unselects the others, updates index and sub-index and selects the new vehicle. Returns true when the selection changed; clears it if the old object disappeared.
---@param object any
---@param subSelectionIndex any
---@param ignoreActionEventUpdate any
function Vehicle:setSelectedObject(object, subSelectionIndex, ignoreActionEventUpdate) end

--- Returns whether this vehicle's selection object is currently selected (false if it has none).
function Vehicle:getIsSelected() end

--- Returns the current selection object of the root vehicle (nil if none).
function Vehicle:getSelectedObject() end

--- Returns the vehicle belonging to the current selection object, or nil.
function Vehicle:getSelectedVehicle() end

--- Deprecated: prints the callstack and a warning, always returns false.
---@param inputs any
function Vehicle:hasInputConflictWithSelection(inputs) end

--- Flags the mass for recomputation; `update` calls `updateMass` after the first update.
function Vehicle:setMassDirty() end

--- Recomputes component masses (default plus additional mass), scales them down if the maximum total mass would be exceeded, and on the server applies `setMass` on dynamic components when the change exceeds 0.02 (mass in tonnes). Updates `serverMass` and `precalculatedMass`.
function Vehicle:updateMass() end

--- Returns true when the server mass has reached the allowed maximum (maxMass minus precalculated mass), with a 0.001 tolerance.
function Vehicle:getMaxComponentMassReached() end

--- Returns the remaining mass that can still be added before the maximum, never below 0.
function Vehicle:getAvailableComponentMass() end

--- Default: 0. Specializations (fill units, wheels, ...) override it to add mass to a component.
---@param component any
function Vehicle:getAdditionalComponentMass(component) end

--- Sums the mass of this vehicle's components (tonnes). The base version ignores `onlyGivenVehicle`; attacher specializations include implements.
---@param onlyGivenVehicle boolean
---@return number
function Vehicle:getTotalMass(onlyGivenVehicle) end

--- Returns the mass of the given component table, or 0 if nil.
---@param component table
---@return number
function Vehicle:getComponentMass(component) end

--- Sums the default (unloaded) masses of all components.
function Vehicle:getDefaultMass() end

--- Returns the mass-weighted world center of mass (x, y, z) of all components.
---@return number
---@return number
---@return number
function Vehicle:getOverallCenterOfMass() end

--- Returns the pitch/slope angle in radians of the first component's forward axis relative to the horizontal, in the range -pi/2 to pi/2.
---@return number
function Vehicle:getVehicleWorldXRot() end

--- Returns the world-space forward direction (x, y, z) of the first component.
---@return number
---@return number
---@return number
function Vehicle:getVehicleWorldDirection() end

--- Empty hook (no body); fill-level specializations override it to add entries to the passed display table.
---@param display table
function Vehicle:getFillLevelInformation(display) end

--- Default: false. Overridden by specializations that can carry mounted objects.
---@param object table
---@return boolean
function Vehicle:getHasObjectMounted(object) end

--- Activates the action controller and raises `onActivate`.
function Vehicle:activate() end

--- Deactivates the action controller and raises `onDeactivate`.
function Vehicle:deactivate() end

--- Recomputes the local pose of a joint anchor (0 or 1) from the joint node and, if the physics joint exists, updates its frame with `setJointFrame`.
---@param jointDesc table
---@param anchorActor integer
function Vehicle:setComponentJointFrame(jointDesc, anchorActor) end

--- Server only: stores new min/max rotation limits for a joint axis (1-3) and applies them to the physics joint, or disables the limit if min exceeds max.
---@param componentJoint table
---@param axis integer
---@param minLimit number
---@param maxLimit number
function Vehicle:setComponentJointRotLimit(componentJoint, axis, minLimit, maxLimit) end

--- Server only: stores new min/max translation limits for a joint axis (1-3) and applies them to the physics joint, or disables the limit if min exceeds max.
---@param componentJoint table
---@param axis integer
---@param minLimit number
---@param maxLimit number
function Vehicle:setComponentJointTransLimit(componentJoint, axis, minLimit, maxLimit) end

--- Initialises one component: rigid body flags (kinematic on clients), warns on missing collision bits, recentres on the first component, reads mass (kg, converted to tonnes), center of mass, inertia, solver iterations, clip distance, and registers the node as belonging to this vehicle. Returns true.
---@param component table
---@param xmlFile XMLFile
---@param key string
---@param rootPosition table
---@param i integer
---@return boolean
function Vehicle:loadComponentFromXML(component, xmlFile, key, rootPosition, i) end

--- Reads a component joint definition (limits, springs, damping, force limits, z-rotation node, breakability, rotational/translational drives) into `jointDesc`; angles are converted to radians. Only the server reads physics data; returns false on invalid component indices.
---@param jointDesc table
---@param xmlFile XMLFile
---@param key string
---@param componentJointI integer
---@param jointNode integer
---@param index1 integer
---@param index2 integer
---@return boolean
function Vehicle:loadComponentJointFromXML(jointDesc, xmlFile, key, componentJointI, jointNode, index1, index2) end

--- Builds the physics joint between two components from the joint description (limits, springs, drives, breakability, collision) with a `JointConstructor` and stores its index in `jointDesc.jointIndex`. Returns false if an argument is missing.
---@param component1 table
---@param component2 table
---@param jointDesc table
---@return boolean
function Vehicle:createComponentJoint(component1, component2, jointDesc) end

--- Reads the HUD schema overlay settings (`vehicle.base.schemaOverlay`: positions, name with mod prefix, invisible borders) into a `VehicleSchemaOverlayData`; also warns about deprecated paths.
---@param xmlFile XMLFile
function Vehicle:loadSchemaOverlay(xmlFile) end

--- Default: nil. Overridden to supply extra text drawn on the vehicle's schema overlay.
function Vehicle:getAdditionalSchemaText() end

--- Default: false. Overridden to show the turned-on variant of the schema overlay.
function Vehicle:getUseTurnedOnSchema() end

--- Empty hook subscribed to the day-changed message; specializations may extend it.
function Vehicle:dayChanged() end

--- Subscribed to the period-changed message; increments the vehicle age by one (age is counted in periods, i.e. months).
function Vehicle:periodChanged() end

--- Raises the `onStateChange` event with the given state and extra arguments.
---@param state any
function Vehicle:raiseStateChange(state, ...) end

--- Default: false. Overridden by working tools so the speed limit is only enforced while they work.
function Vehicle:doCheckSpeedLimit() end

--- Default: returns 0, 0 (no work load). Overridden by tools that report a workload.
function Vehicle:getWorkLoad() end

--- Empty hook called when a player interacts with the vehicle; does nothing by default.
---@param player any
function Vehicle:interact(player) end

--- Default: empty string (no help text).
function Vehicle:getInteractionHelp() end

--- Default: resets the interaction flag to NONE and returns infinity. Overridden by vehicles that can be interacted with.
---@param node any
function Vehicle:getDistanceToNode(node) end

--- Returns whether an AI job drives this vehicle, by asking the attacher vehicle if there is one; false by default.
function Vehicle:getIsAIActive() end

--- Default: true. Overridden by vehicles that need external power.
function Vehicle:getIsPowered() end

--- Default: false. Overridden to tell that the vehicle currently needs power so the motor can be started automatically.
function Vehicle:getRequiresPower() end

--- Returns true when the property state is SHOP_CONFIG (shown in the shop configuration).
function Vehicle:getIsInShowroom() end

--- Empty hook that lets specializations add this vehicle to an AI implement list.
---@param list any
function Vehicle:addVehicleToAIImplementList(list) end

--- Sets the operating time (ms, minimum 0). Unless loading, for a leased vehicle it notifies the economy manager each time a full hour boundary is crossed.
---@param operatingTime any
---@param isLoading any
function Vehicle:setOperatingTime(operatingTime, isLoading) end

--- Returns the operating time in milliseconds.
function Vehicle:getOperatingTime() end

--- Checks that the component(s) or the given node have all bits of `targetCollisionMask` in their filter mask, unless an XML boolean at `path` waives the check. Logs a warning with callstack and returns false on failure.
---@param targetCollisionMask any
---@param path any
---@param node any
---@param str any
function Vehicle:doCollisionMaskCheck(targetCollisionMask, path, node, str) end

--- Default: true. Train-related specializations override it.
function Vehicle:getIsReadyForAutomatedTrainTravel() end

--- Default: true. Overridden to forbid automatic gear shifting in some situations.
function Vehicle:getIsAutomaticShiftingAllowed() end

--- Returns the effective speed limit and whether it is being checked: raw limit reduced by damage (`DAMAGED_SPEEDLIMIT_REDUCTION`), combined with the minimum over attached implements. With `onlyIfWorking`, limits only count for vehicles that request the check.
---@param onlyIfWorking boolean
---@return number
---@return boolean
function Vehicle:getSpeedLimit(onlyIfWorking) end

--- Returns the speed limit stored for this vehicle (from XML or specialization defaults), without damage or implements.
---@return number
function Vehicle:getRawSpeedLimit() end

--- Physics wake-up callback: calls `raiseActive` so the vehicle gets updated again.
---@param id any
function Vehicle:onVehicleWakeUpCallback(id) end

--- Returns whether the first component node still exists in the engine.
function Vehicle:getCanBeMounted() end

--- Returns the daily upkeep cost from `Vehicle.calculateDailyUpkeep` for this vehicle's store item, age, operating time and configurations.
---@return number
function Vehicle:getDailyUpkeep() end

--- Base store upkeep multiplied by a wear factor that grows with age (up to 30 percent weight) and operating hours (up to 70 percent weight), scaled by `EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER`. Constants of `EconomyManager` are not in the dump (UNVERIFIED).
---@param storeItem any
---@param age any
---@param operatingTime any
---@param configurations any
function Vehicle.calculateDailyUpkeep(storeItem, age, operatingTime, configurations) end

--- Returns the full name (brand plus name) converted to upper case with `utf8ToUpper`.
---@return string
function Vehicle:getUppercaseName() end

--- Returns the display name: the `vehicleName` of the first active configuration that defines one, else the store item name, or "Unknown" without a store item.
function Vehicle:getName() end

--- Returns the brand title followed by the name (brand omitted when it is NONE or no store item exists).
function Vehicle:getFullName() end

--- Returns the brand index: a configuration's `vehicleBrand` if any, else the store item's brand index, or `Brand.LIZARD` without a store item.
function Vehicle:getBrand() end

--- Returns the shop icon path: a configuration's `vehicleIcon` if set, else the store item image, or the shop's empty image without a store item. Warns on an invalid configuration index.
function Vehicle:getImageFilename() end

--- True if the vehicle supports hand pick-up (XML flag) and the access handler lets the given player access it.
---@param byPlayer Player
---@return boolean
function Vehicle:getCanBePickedUp(byPlayer) end

--- True if the XML allows reset and no guided tour is running.
function Vehicle:getCanBeReset() end

--- Returns the mission's reset places and its used load places (two values).
function Vehicle:getResetPlaces() end

--- Returns three localized texts (confirmation, success, failure) shown around a reset; specializations can override it if their reset does something else.
---@return string
---@return string
---@return string
function Vehicle:getResetDialogTexts() end

--- Returns the store item's `canBeSold` flag, true if there is no store item.
function Vehicle:getCanBeSold() end

--- Default: true. Overridden to prevent listing the vehicle in the sales.
function Vehicle:getCanBeAddedToSales() end

--- Creates an in-memory savegame-style XMLFile containing this vehicle (filename plus `saveToXMLFile` data), used by `reset` to reload it. Returns nil if creation fails; the caller must delete the XMLFile.
---@return string
function Vehicle:getReloadXML() end

--- Default: false. Overridden to say whether the vehicle is currently used by the given connection.
---@param connection any
function Vehicle:getIsInUse(connection) end

--- Returns the property state (owned, leased, shop configuration, ...).
function Vehicle:getPropertyState() end

--- False while an AI is active; otherwise asks the action controller whether controlled actions are available (false without controller).
function Vehicle:getAreControlledActionsAvailable() end

--- False while an AI is active; otherwise delegates to the action controller's accessibility check (false without controller).
function Vehicle:getAreControlledActionsAccessible() end

--- Returns the positive/negative icons and color-change flag from the action controller, or `TURN_ON`, `TURN_ON`, true by default.
function Vehicle:getControlledActionIcons() end

--- Returns true (allowed) when no AI is active, plus an empty warning text.
---@return boolean
---@return string
function Vehicle:getAreControlledActionsAllowed() end

--- Asks the action controller to play its recorded controlled actions, if there is one.
function Vehicle:playControlledActions() end

--- Returns the action controller's direction, or 1 without controller.
function Vehicle:getActionControllerDirection() end

--- Creates a `VehicleHotspot` for this vehicle (type, owner farm), stores it and adds it to the mission's map hotspots.
function Vehicle:createMapHotspot() end

--- Removes the hotspot from the mission and deletes it, if present.
function Vehicle:deleteMapHotspot() end

--- Returns the vehicle's map hotspot (nil if none).
function Vehicle:getMapHotspot() end

--- Sets the hotspot's visibility from `getIsMapHotspotVisible`; called every frame at the end of `update`.
function Vehicle:updateMapHotspot() end

--- Default: true. Overridden to hide the hotspot in some states.
function Vehicle:getIsMapHotspotVisible() end

--- True if the XML shows the vehicle in the vehicle menu and it is owned or leased.
function Vehicle:getShowInVehiclesOverview() end

--- Adds the "vehicle broken, needs reset" line to the info HUD box when the vehicle is broken. Specializations extend it with their own lines.
---@param box any
function Vehicle:showInfo(box) end

--- Empty hook called by the object-change loader so specializations can read extra values per object change.
---@param xmlFile integer
---@param key string
---@param node integer
---@param object table
function Vehicle:loadObjectChangeValuesFromXML(xmlFile, key, node, object) end

--- Empty hook called when an object change is applied or reverted, so specializations can react.
---@param object table
---@param isActive boolean
function Vehicle:setObjectChangeValues(object, isActive) end

--- Briefly wakes the physics of the first component via `I3DUtil.wakeUpObject`.
function Vehicle:wakeUp() end

--- Registers the vehicle as a network object (superclass) and raises `onRegistered`. Network registration details live in `Object` (not in this file).
---@param alreadySent any
function Vehicle:register(alreadySent) end

--- Resets the network dirty mask to 0 and raises `onDirtyMaskCleared`.
function Vehicle:clearDirtyMask() end

--- Sets the owner farm through the superclass (optionally without sending an event) and updates the map hotspot's owner farm.
---@param farmId any
---@param noEventSend any
function Vehicle:setOwnerFarmId(farmId, noEventSend) end

--- Returns the vehicle's unique id string (nil until set), used to reference it across saves.
---@return string
function Vehicle:getUniqueId() end

--- Stores the unique id. It should be set only once; the check is a debug-only assertion that is stripped from the dump.
---@param uniqueId string
function Vehicle:setUniqueId(uniqueId) end

--- Input callback: moves the selection to the next sub-selection, or to the next selectable object (wrapping to the first), and applies it with `setSelectedObject`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Vehicle.actionEventToggleSelection(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for the reverse direction: moves to the previous sub-selection or object (wrapping to the last) and applies it with `setSelectedObject`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Vehicle.actionEventToggleSelectionReverse(self, actionName, inputValue, callbackState, isAnalog) end

--- Shop spec text for daily upkeep (formatted money), taken from the real item when available; returns nil when upkeep is 0.
---@param storeItem any
---@param realItem any
---@param _ any
---@param saleItem any
function Vehicle.getSpecValueDailyUpkeep(storeItem, realItem, _, saleItem) end

--- Shop spec text for operating time as hours and tenths, from the real item or the sale item; nil if neither is given.
---@param storeItem any
---@param realItem any
---@param _ any
---@param saleItem any
function Vehicle.getSpecValueOperatingTime(storeItem, realItem, _, saleItem) end

--- Reads `vehicle.storeData.specs.workingWidth` (and `#minWidth`, default same) into a table, or returns nil if absent.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueWorkingWidth(xmlFile, customEnvironment, baseDir) end

--- Formats the working width for the shop, as a range when min and max differ; nil if the store item has none.
---@param storeItem any
---@param realItem any
function Vehicle.getSpecValueWorkingWidth(storeItem, realItem) end

--- Scans every configuration item for a `#workingWidth` (and `#isSelectable`) and returns a table by configuration name and index, or nil if none.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueWorkingWidthConfig(xmlFile, customEnvironment, baseDir) end

--- Returns the working width of the chosen configuration for a real or sale item, otherwise the min-max range over selectable configurations. Gives formatted text, or the raw number with `returnValues`.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecValueWorkingWidthConfig(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Reads `vehicle.base.speedLimit#value` for the shop.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueSpeedLimit(xmlFile, customEnvironment, baseDir) end

--- Formats the max speed with the player's speed unit for the shop; nil if the store item has no speed limit.
---@param storeItem any
---@param realItem any
function Vehicle.getSpecValueSpeedLimit(storeItem, realItem) end

--- Reads mass data from the XML for the shop: component masses (and per configuration, in tonnes), fill unit and wheel mass data, and store weight overrides/ranges. Returns nil if `weight#ignore` is set or nothing is found.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueWeight(xmlFile, customEnvironment, baseDir) end

--- Returns the list of weight values per configuration from the store data, or nil if none are defined.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecConfigValuesWeight(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Shop weight: for a real item it recomputes mass and uses the total; otherwise it uses the store min/max or the sum of component, wheel and starting fill mass. Returns formatted text, or numbers with `returnValues`.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecValueWeight(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Reads `vehicle.base.components#maxMass` (kg) and returns it in tonnes, or nil if absent.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueAdditionalWeight(xmlFile, customEnvironment, baseDir) end

--- Shop text for how much mass can be added (max mass minus base weight); nil unless the savegame option `trailerFillLimit` is on.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecValueAdditionalWeight(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Reads the `vehicle.storeData.specs.combination` entries (xmlFilename, filter categories, filter spec and range) into a list, warning if a referenced vehicle is unknown.
---@param xmlFile any
---@param customEnvironment any
---@param baseDirectory any
function Vehicle.loadSpecValueCombinations(xmlFile, customEnvironment, baseDirectory) end

--- Returns the stored combination list of the store item.
---@param storeItem any
---@param realItem any
function Vehicle.getSpecValueCombinations(storeItem, realItem) end

--- Shop text for vehicle slot usage: "+n" for buying (summed over bundle items) or "-n" for selling, from the slot system; nil when the usage is 0.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecValueSlots(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
