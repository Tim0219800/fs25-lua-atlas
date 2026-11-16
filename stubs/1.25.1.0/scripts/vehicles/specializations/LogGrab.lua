---@meta
-- FS25 1.25.1.0 : vehicles/specializations/LogGrab.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function LogGrab.prerequisitesPresent(specializations) end

--- Registers the `logGrab` vehicle configuration type, the grab XML paths (base and per configuration) and the savegame attribute for each grab's claw state.
function LogGrab.initSpecialization() end

--- Registers all XML paths of one grab: joint nodes, limits, claws and their moving tools, claw and lock animations, tree detection, component joint limits and mass-based drive force settings. Note: `clawAnimation#foldMaxLimit` has default 1 in the schema but 0 in the loader.
---@param schema any
---@param basePath any
function LogGrab.registerLogGrabXMLPaths(schema, basePath) end

--- Registers the specialization event `onLogGrabMountedTreesChanged`.
---@param vehicleType table
function LogGrab.registerEvents(vehicleType) end

--- Registers the grab loading, claw state, mounting and unmounting functions on the vehicle type.
---@param vehicleType table
function LogGrab.registerFunctions(vehicleType) end

--- Overrides `setComponentJointFrame`, `getMovingToolMoveValue` and `onDelimbTree`. Note: `addNodeObjectMapping`, `removeNodeObjectMapping` and `updateDebugValues` are defined below but not registered here (UNVERIFIED whether registered elsewhere).
---@param vehicleType table
function LogGrab.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, onReadStream, onWriteStream, onUpdateTick, onCutTree, onTurnedOn, onRegisterActionEvents, onLogGrabMountedTreesChanged, onFoldStateChanged and onFoldTimeChanged. Note: onTurnedOff is not subscribed here.
---@param vehicleType table
function LogGrab.registerEventListeners(vehicleType) end

--- Loads the grabs of the selected configuration and of the base `vehicle.logGrab` block. If none loads, removes all other event listeners of the specialization.
---@param savegame table
function LogGrab:onLoad(savegame) end

--- Restores the saved claw state (or initial state) and plays the closed animation instantly if closed; resolves the moving tool references and drops entries that cannot be found.
---@param savegame table
function LogGrab:onPostLoad(savegame) end

--- Removes the tree trigger callbacks of all grabs.
function LogGrab:onDelete() end

--- Saves the claw animation state of each grab that has a claw animation.
---@param xmlFile any
---@param key any
---@param usedModNames any
function LogGrab:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads the claw state of each animated grab and applies it without sending an event.
---@param streamId integer
---@param connection Connection
function LogGrab:onReadStream(streamId, connection) end

--- Server join: writes the claw state of each animated grab.
---@param streamId integer
---@param connection Connection
function LogGrab:onWriteStream(streamId, connection) end

--- Server only. Decides per grab whether it is closed (from claw joint angles or the claw animation), mounts pending tree shapes with joints when closed, unmounts them when open, adjusts joint spring damping, lock animation and component joint limits.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function LogGrab:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one grab into the given table: claws, animations, joint nodes, tree trigger (must have only the Tree collision bit), detection node, joint limits and mass settings. Returns false if the trigger or detection node is missing; a wrong trigger mask returns nil.
---@param xmlFile any
---@param key any
---@param logGrab any
function LogGrab:loadLogGrabFromXML(xmlFile, key, logGrab) end

--- Measures the claw joint rotation on its axis and returns true when the claw counts as closed (past the threshold, or fully closed moving tool) for long enough, or after a joint change timeout; otherwise false. `ignoreTiming` skips the timers.
---@param claw any
---@param dt any
---@param ignoreTiming any
---@param forceDirty any
function LogGrab:updateLogGrabClawState(claw, dt, ignoreTiming, forceDirty) end

--- Server only: when a new tree is cut with a positive radius, closes every grab whose state change is allowed.
---@param radius any
---@param isNewTree any
function LogGrab:onCutTree(radius, isNewTree) end

--- Server only: opens every grab whose state change is allowed.
function LogGrab:onTurnedOn() end

--- Server only: closes every grab whose state change is allowed. Note: not registered as a listener in `registerEventListeners`, so it may never be called by this specialization (UNVERIFIED).
function LogGrab:onTurnedOff() end

--- Client: registers one input action per grab with a claw animation (respecting the control group) and refreshes the labels.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function LogGrab:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: toggles the claw state of the grab whose index is passed as callback state, if allowed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function LogGrab.actionEventClawAnimation(self, actionName, inputValue, callbackState, isAnalog) end

--- Updates each grab's input hint text (open or close) and enables it only when the state change is allowed.
---@param self any
function LogGrab.updateActionEvents(self) end

--- Override: after the parent, records the time when a claw component joint was reframed, used to ignore claw state changes for a short time.
---@param superFunc any
---@param jointDesc any
---@param anchorActor any
function LogGrab:setComponentJointFrame(superFunc, jointDesc, anchorActor) end

--- Override: stores the last move value of claw moving tools and blocks movement in the closing direction once the claw is past its closing threshold.
---@param superFunc any
---@param movingTool any
function LogGrab:getMovingToolMoveValue(superFunc, movingTool) end

--- Override: opens any closed claw animation grab before delegating to the parent delimbing behaviour.
---@param superFunc any
---@param state any
function LogGrab:onDelimbTree(superFunc, state, ...) end

--- Returns false if the vehicle's fold time is outside the grab's mounting limits, true otherwise.
---@param grab any
---@param shapeId any
function LogGrab:getGrabCanMountSplitShape(grab, shapeId) end

--- Creates a physics joint between the grab root and the tree shape, placed at the detected tree area (or at the joint node, locked, if the test fails). Publishes `TREE_SHAPE_MOUNTED`, raises `onLogGrabMountedTreesChanged` and returns the joint index and transform.
---@param grab any
---@param shapeId any
function LogGrab:mountSplitShape(grab, shapeId) end

--- Removes the joint and its transform for a tree shape. The shape returns to the pending list unless `isDeleting` is true. Raises `onLogGrabMountedTreesChanged`.
---@param grab any
---@param shapeId any
---@param jointIndex any
---@param jointTransform any
---@param isDeleting any
function LogGrab:unmountSplitShape(grab, shapeId, jointIndex, jointTransform, isDeleting) end

--- Server only: sums the mass of mounted trees and adjusts the angular drive max force of configured component joints by interpolation. Note: the code assigns index 1 twice and never index 2 of the force array, which looks like a bug.
---@param grab any
function LogGrab:onLogGrabMountedTreesChanged(grab) end

--- Opens or closes grabs configured with open/close during folding when folding goes against the turn-on direction.
---@param direction any
---@param moveToMiddle any
function LogGrab:onFoldStateChanged(direction, moveToMiddle) end

--- Refreshes the input hints when the fold time changes.
---@param time any
function LogGrab:onFoldTimeChanged(time) end

--- Returns false if the fold time is outside the claw animation fold limits of that grab, otherwise true.
---@param grabIndex any
function LogGrab:getIsLogGrabClawStateChangeAllowed(grabIndex) end

--- Sets the claw state of a grab (nil toggles) and plays the claw animation forward or backward, refreshes the hints and calls `LogGrabClawStateEvent.sendEvent` for network sync.
---@param grabIndex any
---@param state any
---@param noEventSend any
function LogGrab:setLogGrabClawState(grabIndex, state, noEventSend) end

--- Trigger callback: adds dynamic or kinematic split shapes entering the grab trigger to the pending list; on leave, removes them from pending or unmounts them if mounted.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function LogGrab:logGrabTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Override-style function: after the parent, maps each grab trigger node to this vehicle in the given list.
---@param superFunc any
---@param list any
function LogGrab:addNodeObjectMapping(superFunc, list) end

--- Override-style function: after the parent, removes the grab trigger node entries from the given list.
---@param superFunc any
---@param list any
function LogGrab:removeNodeObjectMapping(superFunc, list) end

--- Server only: appends debug rows (claw offsets and thresholds, moving tool closing state, mounted and pending shapes) to the given values list.
---@param values any
function LogGrab:updateDebugValues(values) end
