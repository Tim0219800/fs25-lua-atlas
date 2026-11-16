---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FellerBuncher.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the FillUnit specialization is present.
---@param specializations table
---@return boolean
function FellerBuncher.prerequisitesPresent(specializations) end

--- Adds the shop spec 'fellerBuncherMaxTreeSize' and registers the XML keys: fill unit, max radius, input actions, cut node and collision, mount node, tree move direction, main grab, cut animation, unmount, tree slots, sounds, animation nodes and effects.
function FellerBuncher.initSpecialization() end

--- Registers the vehicle-level functions for grab state, cut checks, cutting, mounting, releasing, tree counting and the tree cut/mounted message handlers.
---@param vehicleType any
function FellerBuncher.registerFunctions(vehicleType) end

--- Overrides getCanToggleTurnedOn, registerLoweringActionEvent, getSupportsAutoTreeAlignment and getAutoAlignHasValidTree.
---@param vehicleType any
function FellerBuncher.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load/delete, stream and update-stream, update tick, turned on/off, animation finish and action-event registration events.
---@param vehicleType any
function FellerBuncher.registerEventListeners(vehicleType) end

--- Reads every XML setting into the spec (radius, input actions, cut and mount nodes, grab and slot animations, unmount timing), builds the tree slots, loads client animations, effects and sounds, subscribes to TREE_SHAPE_CUT and TREE_SHAPE_MOUNTED messages and creates the dirty flag.
---@param savegame any
function FellerBuncher:onLoad(savegame) end

--- Releases the main arm tree and all tree slots, then deletes effects, sounds and animations.
function FellerBuncher:onDelete() end

--- Client on join: reads the effect state, the main grab usage and each tree slot usage.
---@param streamId integer
---@param connection Connection
function FellerBuncher:onReadStream(streamId, connection) end

--- Server on join: writes the effect state, the main grab usage and each tree slot usage.
---@param streamId integer
---@param connection Connection
function FellerBuncher:onWriteStream(streamId, connection) end

--- Client: when the dirty bit is set, reads effect state and grab/slot usage, then refreshes the action events.
---@param streamId any
---@param timestamp any
---@param connection any
function FellerBuncher:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: when the dirty flag is set, writes effect state and grab/slot usage.
---@param streamId any
---@param connection any
---@param dirtyMask any
function FellerBuncher:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: looks for a cuttable tree in the cut node, runs the automatic cut timer (when no cut input is set), pushes a freshly cut tree toward the mount node, handles the staggered unmount process and releases trees that were deleted. Clients only detect the tree for UI. Also drives cut effect and sound (wood chips) from the effect state.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FellerBuncher:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Closes/opens the grabs via setFellerBuncherGrabState(true) if no tree is loaded; on clients starts the animation nodes and the saw sound.
function FellerBuncher:onTurnedOn() end

--- Reverses the grab state if no tree is loaded; on clients stops animation nodes, effects and sounds.
function FellerBuncher:onTurnedOff() end

--- Drives the mounting sequence: when the main grab animation or a slot animation ends during a mount, tries to mount the tree into the first free slot or main arm via mountTreeInRange and updates states, joint damping and animations; on failure it reopens the grab.
---@param name any
function FellerBuncher:onFinishAnimation(name) end

--- Plays the main grab, all tree slot grab and cut animations forward (true) or in reverse (false).
---@param state any
function FellerBuncher:setFellerBuncherGrabState(state) end

--- Returns true only when no mount or unmount is running, the main grab is not animating, the machine is turned on and a free tree slot still exists.
function FellerBuncher:getIsFellerBuncherReadyForCut() end

--- Checks whether a found tree can be cut: access via WoodHarvester, radius against maxRadius, not already held, and both sides of the cut plane longer than 0.15. Returns a boolean and, when refused, a warning text (too thick, no access, no permission).
---@param splitShapeId any
---@param cx any
---@param cy any
---@param cz any
---@param nx any
---@param ny any
---@param nz any
---@param yx any
---@param yy any
---@param yz any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function FellerBuncher:getFellerBuncherCanCutSplitShape(splitShapeId, cx, cy, cz, nx, ny, nz, yx, yy, yz, minY, maxY, minZ, maxZ) end

--- Cuts the tree found in the cut node: on the server updates cut statistics and achievements, records the tree type and splits the shape; then plays the cut animation, the cut sound (manual mode on client) and sends FellerBuncherCutEvent.
---@param noEventSend any
function FellerBuncher:cutTree(noEventSend) end

--- Split callback: registers the new shape as a known split shape with the tree plant manager and, for the part above the cut, starts the mount process.
---@param shape any
---@param isBelow any
---@param isAbove any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function FellerBuncher:fellerBuncherSplitShapeCallback(shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

--- Starts mounting a cut shape: reverses the main grab animation, flags the mount in progress and shifts the shape slightly along the tree move direction (plus a small lift). The noEventSend parameter is unused here.
---@param shape any
---@param noEventSend any
function FellerBuncher:doMountProcess(shape, noEventSend) end

--- Tests the pending shape against the mount node and, if it fits, creates a stiff spring joint between the mount component and the shape and publishes TREE_SHAPE_MOUNTED. Returns joint index, joint node and shape, or 0 and nil.
function FellerBuncher:mountTreeInRange() end

--- On the server starts the staggered release of all trees (main arm first, then slots); on every side sends FellerBuncherReleaseEvent unless noEventSend is true.
---@param noEventSend any
function FellerBuncher:releaseMountedTrees(noEventSend) end

--- Opens the main grab, removes its joint and joint node, restores component joint damping on the server and updates the tree count. Returns whether the main arm held a tree.
function FellerBuncher:releaseMainArmTree() end

--- Releases the first used tree slot (animation, joint, node) and updates the tree count. Returns true if a slot was released, false if none was in use.
function FellerBuncher:releaseNextTreeSlot() end

--- Sets the fill unit level to the number of loaded trees (empties it, then adds the count), refreshes the action events and flags a network update.
function FellerBuncher:onFellerBuncherTreesChanged() end

--- Returns how many trees are held: the main arm (0 or 1) plus the used tree slots.
function FellerBuncher:getNumLoadedTrees() end

--- Message handler (server): if the cut shape was held in the main arm or a slot, releases all mounted trees.
---@param oldShape any
---@param shape any
function FellerBuncher:onFellerBuncherTreeShapeCut(oldShape, shape) end

--- Message handler (server): if a held shape gets mounted by another vehicle, releases all mounted trees.
---@param shape any
---@param mountVehicle any
function FellerBuncher:onFellerBuncherTreeShapeMounted(shape, mountVehicle) end

--- Override: refuses toggling while mounting, unmounting or while the main grab is animating; otherwise defers to the parent.
---@param superFunc any
function FellerBuncher:getCanToggleTurnedOn(superFunc) end

--- Override with an empty body: no lowering action event is registered for this machine.
---@param superFunc any
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
---@param ignoreCollisions any
function FellerBuncher:registerLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName, ignoreCollisions) end

--- Override: always returns true, declaring support for automatic tree alignment.
---@param superFunc any
function FellerBuncher:getSupportsAutoTreeAlignment(superFunc) end

--- Override: returns whether a cuttable tree was found and whether the given radius is within maxRadius.
---@param superFunc any
---@param radius any
function FellerBuncher:getAutoAlignHasValidTree(superFunc, radius) end

--- Client: registers the powered release action and, if a cut input action is set, the cut action (high priority, with texts) for the active vehicle, then updates their state.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function FellerBuncher:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: releases the mounted trees.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FellerBuncher.actionEventReleaseTrees(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: cuts the detected tree.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FellerBuncher.actionEventCutTree(self, actionName, inputValue, callbackState, isAnalog) end

--- Client: enables the release action only when a tree is held and the cut action only when a cuttable tree was found.
---@param self any
function FellerBuncher.updateActionEvents(self) end

--- Shop spec loader: returns the vehicle.fellerBuncher#maxRadius value from the XML.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function FellerBuncher.loadSpecValueMaxTreeSize(xmlFile, customEnvironment, baseDir) end

--- Shop spec getter: converts the radius to a diameter in centimetres and returns it as text, or as value(s) plus text depending on the flags. Returns nothing without the spec.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function FellerBuncher.getSpecValueMaxTreeSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
