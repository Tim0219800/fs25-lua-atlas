---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TensionBelts.lua (generated stub, FS25 Lua Atlas)

--- Specialization (no prerequisites) for vehicles that strap loads (bales, pallets, vehicles, tree trunks) with tension belts. Belts are described per configuration under vehicle.tensionBelts and are built as geometry with TensionBeltGeometryConstructor, using belt data from g_tensionBeltManager. The server mounts found objects with physics joints (or kinematic links for trees on trains) and syncs the state through TensionBeltsEvent and a stream bool per belt. A TensionBeltsActivatable offers the per-belt interaction, and the file also holds the toggle action and a debug console command.
---@class TensionBelts
TensionBelts = {}

--- Specialization (no prerequisites) for vehicles that strap loads (bales, pallets, vehicles, tree trunks) with tension belts. Belts are described per configuration under vehicle.tensionBelts and are built as geometry with TensionBeltGeometryConstructor, using belt data from g_tensionBeltManager. The server mounts found objects with physics joints (or kinematic links for trees on trains) and syncs the state through TensionBeltsEvent and a stream bool per belt. A TensionBeltsActivatable offers the per-belt interaction, and the file also holds the toggle action and a debug console command.
---@class TensionBeltsActivatable
TensionBeltsActivatable = {}

--- Always returns true: no prerequisite specialization.
---@param specializations any
function TensionBelts.prerequisitesPresent(specializations) end

--- Registers the 'tensionBelts' configuration type and the XML schema (interaction radii, trigger, belt type, width, hooks, offsets, per-belt nodes, object changes, sounds, moving-tool flag) plus the savegame key for belt active state.
function TensionBelts.initSpecialization() end

--- Registers the belt functions: create/remove, set active, mount/unmount queries, refresh, free/lock object, player range, dynamic mount check, trigger callback and tree-cut handler.
---@param vehicleType any
function TensionBelts.registerFunctions(vehicleType) end

--- Overrides automated train travel readiness, selectability, fold permission, moving tool loading/activity, discharge checks, fill level info, mounted-object check and additional component mass.
---@param vehicleType any
function TensionBelts.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, onPreDelete, onReadStream, onWriteStream, onUpdate, onUpdateTick, onDraw and onRegisterActionEvents.
---@param vehicleType any
function TensionBelts.registerEventListeners(vehicleType) end

--- Reads the selected tension belt configuration: radii, optional player trigger (checks collision filters), belt type data, nodes and each tensionBelt entry (end node x/y must be 0). Computes the interaction centre, subscribes to tree cut messages, and removes listeners when no belts exist. Sets a loading error if linkNode is missing.
---@param savegame table
function TensionBelts:onLoad(savegame) end

--- When loading a savegame, collects the indices of belts stored as active so onUpdate can refasten them one per frame.
---@param savegame table
function TensionBelts:onPostLoad(savegame) end

--- Writes the isActive flag of every belt to the savegame (true if the belt has a mesh).
---@param xmlFile any
---@param key any
---@param usedModNames any
function TensionBelts:saveToXMLFile(xmlFile, key, usedModNames) end

--- Before deletion, wakes the physics of every object currently under a belt's mount area so they do not stay asleep.
function TensionBelts:onPreDelete() end

--- Removes the activatable, unfastens all belts silently, removes the activation trigger and deletes the sounds.
function TensionBelts:onDelete() end

--- Client join: reads one bool per belt and queues the active ones for refastening.
---@param streamId integer
---@param connection Connection
function TensionBelts:onReadStream(streamId, connection) end

--- Server join sync: writes one bool per belt telling whether it has a mesh.
---@param streamId integer
---@param connection Connection
function TensionBelts:onWriteStream(streamId, connection) end

--- Refastens queued belts, on the server updates dynamic joint frames if the link node moved, on clients steps a fasten/unfasten-all sequence, manages the nearest belt preview (dummy belt) and the activatable when the local player is in range, and draws debug shapes if enabled.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TensionBelts:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server only, every 500 ms: checks whether a mounted physics object no longer exists and, if so, drops it and refreshes the belts.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TensionBelts:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- For the selected, input-active vehicle, sets the toggle action text to fasten or unfasten depending on whether all belts are fastened.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TensionBelts:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server broadcasts TensionBeltsRefreshEvent, then rebuilds every fastened belt geometry around the objects currently in range.
function TensionBelts:refreshTensionBelts() end

--- Releases an object from its mount: server removes the joint, restores mass, inertia and flags (can be sold, mount type) or relinks/unmounts kinematic objects; clears the tree mounted attribute and forgets the object.
---@param objectId any
---@param objectsToJointTable any
---@param isDynamic any
---@param object any
function TensionBelts:freeTensionBeltObject(objectId, objectsToJointTable, isDynamic, object) end

--- Mounts an object: server creates a joint at its centre of mass (with spring limits, reduced mass, mount type set), or kinematically links trees on non-dynamic joint nodes. Clients just record it. Publishes TREE_SHAPE_MOUNTED for trees. Note: the kinematic mount branch is never selected in this code.
---@param objectId any
---@param objectsToJointTable any
---@param isDynamic any
---@param jointNode any
---@param object any
function TensionBelts:lockTensionBeltObject(objectId, objectsToJointTable, isDynamic, jointNode, object) end

--- Fastens or unfastens one belt (by id) or all belts when id is nil: builds or deletes belt meshes, mounts or frees objects in range, applies object changes, sends TensionBeltsEvent unless noEventSend, and updates the all-fastened state.
---@param isActive boolean
---@param beltId integer
---@param noEventSend boolean
---@param playSound boolean
function TensionBelts:setTensionBeltsActive(isActive, beltId, noEventSend, playSound) end

--- Sets every belt to the given state, or toggles based on whether all are currently fastened when isActive is nil.
---@param isActive any
---@param noEventSend any
function TensionBelts:setAllTensionBeltsActive(isActive, noEventSend) end

--- Recomputes areAllBeltsFastened: true only when no single belt is without a mesh.
function TensionBelts:updateFastenState() end

--- Builds the belt geometry between its start and end nodes around the given objects' meshes (material, width, hooks, ratchet, intersection points) and returns the shape, or nil. Dummy belts are previews; real ones are stored, ratchet and hooks are cloned, and the add sound plays.
---@param belt table
---@param isDummy boolean
---@param objects table
---@param playSound boolean
function TensionBelts:createTensionBelt(belt, isDummy, objects, playSound) end

--- Deletes a belt's mesh and clears its reference; plays the remove sound on clients unless disabled or the belt was only a preview.
---@param belt table
---@param playSound boolean
function TensionBelts:removeTensionBelt(belt, playSound) end

--- Runs a synchronous overlap box over the belt's zone (sides, height, offset from neighbours or defaults) against dynamic objects, vehicles and trees, and returns the table of found objects and their count. The returned table is reused between calls.
---@param belt table
---@return table
---@return integer
function TensionBelts:getObjectToMount(belt) end

--- Returns the mounted objects that would be freed if the given belt is removed, excluding those still held by another fastened belt, and their count.
---@param belt table
---@return table
---@return integer
function TensionBelts:getObjectsToUnmount(belt) end

--- Overlap callback: records mountable game objects (via getTensionBeltNodeId/getMeshNodes) or dynamic/kinematic tree split shapes found in the belt zone. Always returns true to continue.
---@param transformId integer
function TensionBelts:objectOverlapCallback(transformId) end

--- Returns whether an object may be strapped: not this vehicle or its own hierarchy, supports tension belts with mesh nodes, not dynamically mounted elsewhere, and no circular mounting with this vehicle.
---@param object any
function TensionBelts:getTensionBeltObjectCanBeMounted(object) end

--- Returns true plus the nearest belt when the local player can access the vehicle and stands within the interaction radius of a belt end node; otherwise false, nil.
---@return boolean
---@return table
function TensionBelts:getIsPlayerInTensionBeltsRange() end

--- Returns true if the given node is currently mounted by one of this vehicle's belts.
---@param node any
function TensionBelts:getIsDynamicallyMountedNode(node) end

--- Override: returns false while objects are in belt range (not yet strapped); otherwise defers to the parent.
---@param superFunc any
function TensionBelts:getIsReadyForAutomatedTrainTravel(superFunc) end

--- Override that always returns true.
---@param superFunc any
function TensionBelts:getCanBeSelected(superFunc) end

--- Override: forbids folding with a warning text while all belts are fastened when allowFoldingWhileFasten is false (unfolding direction excepted).
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function TensionBelts:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Override: after the parent loads a moving tool, reads its tensionBelts#allowedMounted flag (default true).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function TensionBelts:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

--- Override: disables a moving tool that does not allow movement while mounted when all belts are fastened.
---@param superFunc any
---@param movingTool any
function TensionBelts:getIsMovingToolActive(superFunc, movingTool) end

--- Override: returns false while all belts are fastened if allowDischargeWhileFasten is false.
---@param superFunc any
---@param dischargeNode any
function TensionBelts:getCanDischargeToGround(superFunc, dischargeNode) end

--- Override: returns false while all belts are fastened if allowDischargeWhileFasten is false.
---@param superFunc any
---@param dischargeNode any
function TensionBelts:getCanDischargeToObject(superFunc, dischargeNode) end

--- Override that also adds the fill levels of strapped objects to the display, using their own getFillLevelInformation or fill type, level and capacity.
---@param superFunc any
---@param display any
function TensionBelts:getFillLevelInformation(superFunc, display) end

--- Override: true if the parent says so, or if the object is strapped here or mounted on a strapped object (recursive).
---@param superFunc table
---@param object table
---@return boolean
function TensionBelts:getHasObjectMounted(superFunc, object) end

--- Override adding to the joint component the default mass of strapped objects whose mass can be reduced, plus the stored original mass of strapped split shapes.
---@param superFunc any
---@param component any
function TensionBelts:getAdditionalComponentMass(superFunc, component) end

--- Client only: registers the TOGGLE_TENSION_BELTS action event for the vehicle when input is active.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function TensionBelts:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Client trigger callback: sets isPlayerInTrigger when the local player enters or leaves the activation trigger and keeps the vehicle active on entering.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function TensionBelts:tensionBeltActivationTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Server handler for tree cut messages: if the cut shape was strapped, unfastens all belts.
---@param oldShape any
---@param shape any
function TensionBelts:onTensionBeltTreeShapeCut(oldShape, shape) end

--- Creates the activatable for a vehicle, keeping its spec and the default 'fasten belt' text.
---@param object any
function TensionBeltsActivatable.new(object) end

--- Returns true while the local player is in range of the belts.
function TensionBeltsActivatable:getIsActivatable() end

--- Returns 0 (highest priority) when a current belt is selected, otherwise math.huge.
---@param posX any
---@param posY any
---@param posZ any
function TensionBeltsActivatable:getDistance(posX, posY, posZ) end

--- Toggles the current belt: unfastens it if it has a mesh, otherwise fastens it, then refreshes the text.
function TensionBeltsActivatable:run() end

--- Sets the prompt to 'unfasten' or 'fasten' depending on whether the current belt is fastened.
function TensionBeltsActivatable:updateActivateText() end

--- Input callback: starts the sequential fasten-all or unfasten-all (opposite of the current state), carried out one belt per update.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TensionBelts.actionEventToggleTensionBelts(self, actionName, inputValue, callbackState, isAnalog) end

--- Console command that toggles TensionBelts.debugRendering and returns a status string.
---@param unusedSelf any
function TensionBelts.consoleCommandToggleTensionBeltDebugRendering(unusedSelf) end
