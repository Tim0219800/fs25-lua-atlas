---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaleLoader.lua (generated stub, FS25 Lua Atlas)

--- Specialization for automatic bale loaders (trailers that pick up bales with a grabber, stack them on a rotating platform and drop them in rows). It requires `FillUnit`: each loaded bale adds one unit to the fill level. Gameplay is a state machine driven by the server, which broadcasts `BaleLoaderStateEvent` with CHANGE_* ids that every machine replays through `doStateChange`, mostly by playing animations of `AnimatedVehicle`. Bales are attached either kinematically, rigidly or via dynamic joints (`dynamicMount`), can be glued together during unloading, and are saved in the vehicle savegame. Loads many `vehicle.baleLoader` XML keys (bale types with size ranges, bale places, animations, sounds, effects). Pickup uses a trigger and is limited by farm ownership and bale type.
---@class BaleLoader
BaleLoader = {}

--- Returns true only if the vehicle type has the `FillUnit` specialization.
---@param specializations table
---@return boolean
function BaleLoader.prerequisitesPresent(specializations) end

--- Declares two shop spec types (round and square bale size) and registers the whole `vehicle.baleLoader` XML schema plus the savegame schema for state, bale type and each loaded bale.
function BaleLoader.initSpecialization() end

--- Registers the animation name keys (platform, grabber, pusher, front platform, bale places, empty rotate, grippers) under a base path. Reused for the default config and for each bale type.
---@param schema any
---@param basePath any
function BaleLoader.registerAnimationXMLPaths(schema, basePath) end

--- Registers the bale loader's vehicle functions: XML loaders, bale joints, state changes, pickup, mount/unmount, folding animations, automatic unloading and unload triggers.
---@param vehicleType any
function BaleLoader.registerFunctions(vehicleType) end

--- Overrides selection, AI readiness, fold permission, PTO power and load, dynamic-mount fill info and physics add/remove so bales follow the vehicle.
---@param vehicleType any
function BaleLoader.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, stream, update, draw, input, activation, root vehicle change, fill level change, fold, baler unloading and animation value type events.
---@param vehicleType any
function BaleLoader.registerEventListeners(vehicleType) end

--- Reads all `vehicle.baleLoader` settings: texts, automatic and dynamic mount options, grabber and its trigger (error if missing), effects and sounds (client), animations, bale places, bale types, folding animations, unloading mover and packer. Logs XML errors if bale types or places are missing.
---@param savegame table
function BaleLoader:onLoad(savegame) end

--- From the savegame, restores bale type, folding animation and work/transport position, then queues each saved bale (with place index, position and attributes) in a list for creation. Warns on corrupt entries.
---@param savegame table
function BaleLoader:onPostLoad(savegame) end

--- After the vehicle is in physics, creates, registers and mounts each queued bale on its place (dynamically or by normal mount), flags it as not sellable and records its network id in the place.
---@param savegame table
function BaleLoader:onLoadFinished(savegame) end

--- Unmounts all loaded and grabbed bales (making them sellable again, and deleting them if the vehicle is only being reconfigured), removes triggers and delete listeners, and frees animations, effects and sounds.
function BaleLoader:onDelete() end

--- Saves work position, bale type, folding animation and every bale with its place index (helper index for the start row). Unmounts the bale in the grabber so it is saved as an ordinary bale and flags it for remounting.
---@param xmlFile any
---@param key any
---@param usedModNames any
function BaleLoader:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads position state, directions, bale type, empty state, grabbed bale and bale ids per place (with quantised positions if not dynamic mount), schedules mounting, then replays the unloading sequence up to the received state.
---@param streamId integer
---@param connection Connection
function BaleLoader:onReadStream(streamId, connection) end

--- Server join: writes the same state read by `onReadStream`. Bale positions are quantised on `numBitsPosition` bits and a warning is logged if one exceeds `maxPosition`.
---@param streamId integer
---@param connection Connection
function BaleLoader:onWriteStream(streamId, connection) end

--- Client side: reads the unloading mover flag and starts or stops its animation nodes and sound when it changes.
---@param streamId any
---@param timestamp any
---@param connection any
function BaleLoader:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the unloading mover active flag when its dirty flag is set.
---@param streamId any
---@param connection any
---@param dirtyMask any
function BaleLoader:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Puts the bale places and row animations in the position matching the current loading count, instantly. Triggers a platform rotation if the start row is full.
---@param self any
function BaleLoader.updateBalePlacesAnimations(self) end

--- Mounts bales whose objects have now arrived, stops grabber effects after their delay, and on any machine checks for a bale to pick up (server calls `pickupBale`, client may show a not-supported warning). The server also advances the state machine by broadcasting events when the matching animations end.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleLoader:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Updates action event texts and visibility (client). Server: automatic unloading, joint removal after unloading, unloading mover shutdown, dynamic-mount joint interpolation and mass handling, delayed platform movement and push offset. Note: the check `useUnloadingMoverTrigger == nil` can never be true with default false, so animation-based joint release is only evaluated when that option is true.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleLoader:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Shows a blinking warning when a bale is in range but not supported by the loader.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleLoader:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns the nearest valid bale in the trigger within pickup range, its matching bale type (nil if refused) and a warning text. Rejects bales already loaded, mounted elsewhere, of another type or fill type, unsupported, or owned by another farm (unless combined with a baler).
---@param self integer
---@param refNode integer
---@param balesInTrigger any
---@return table
---@return integer
function BaleLoader.getBaleInRange(self, refNode, balesInTrigger) end

--- Starts the work animation nodes and work sound if the loader is in work position and not blocked.
function BaleLoader:onActivate() end

--- Stops grabber effects, work animation nodes and the work sound.
function BaleLoader:onDeactivate() end

--- Registers (or re-parents) the `baleLoaderWorkstate` controlled action on the root vehicle's action controller, finished when in work position, with an AI listener for transport preparation. Removes it when there is no controller.
---@param rootVehicle table
function BaleLoader:onRootVehicleChanged(rootVehicle) end

--- Action controller callback: toggles between work and transport position when the requested direction differs from the current state and nothing is moving. Returns true if the toggle was requested.
---@param self any
---@param direction any
function BaleLoader.actionControllerEvent(self, direction) end

--- Refreshes the folding animation choice when the fill level of the loader's fill unit changes.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function BaleLoader:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- When `useFoldingState` is on, the server broadcasts a move-to-work or move-to-transport event according to the fold direction.
---@param direction any
function BaleLoader:onFoldStateChanged(direction) end

--- With full automatic unloading, remembers how many more bales are coming from a connected baler so unloading waits for them.
---@param balesToUnload any
function BaleLoader:onBalerUnloadingStarted(balesToUnload) end

--- Registers the `baleLoaderAnimationNodes` animation value type, which blocks or allows the work animation nodes and sound from an animated part.
function BaleLoader:onRegisterAnimationValueTypes() end

--- Loads one bale type: size ranges (round: width and diameter; square: width, height, length, rounded to 2 decimals), mixed fill type flag, fill unit, object changes, bale places and animations. Returns false if animations fail.
---@param xmlFile any
---@param key any
---@param baleType any
function BaleLoader:loadBaleTypeFromXML(xmlFile, key, baleType) end

--- Reads all animation names and speeds into `target.animations`, falling back to the default target then to built-in names. Always returns true.
---@param xmlFile any
---@param key any
---@param target any
---@param defaultTarget any
function BaleLoader:loadBaleLoaderAnimationsFromXML(xmlFile, key, target, defaultTarget) end

--- Reads the start bale place (counts its child nodes and stores their original transforms) and the list of bale place nodes. Returns true if both exist, meaning the places are shared by all bale types.
---@param xmlFile any
---@param key any
---@param target any
function BaleLoader:loadBalePlacesFromXML(xmlFile, key, target) end

--- Builds physics joints between bales of the dropped rows (along rows and between rows at the start or end) according to the `dynamicBaleUnloading` settings, so the stack stays together until released.
---@param baleLines any
function BaleLoader:createBaleToBaleJoints(baleLines) end

--- Creates one joint between two bales with the given translation and rotation limits, aligned on the bale place rotation, and keeps its index in the joint list.
---@param bale1 any
---@param bale2 any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
---@param balePlaceIndex any
function BaleLoader:createBaleToBaleJoint(bale1, bale2, x, y, z, rx, ry, rz, balePlaceIndex) end

--- Central state machine. Applies a CHANGE_* id: grab bale, move grabber, drop bale on platform, rotate platform, move to work or transport, run the unloading steps, drop bales (optionally joint or packed) and handle button requests. Button cases are server only.
---@param id integer
---@param nearestBaleServerId integer
function BaleLoader:doStateChange(id, nearestBaleServerId) end

--- Returns true when the loader holds bales and no platform, pusher, grabber or unloading step is currently in progress.
---@param self any
---@return boolean
function BaleLoader.getAllowsStartUnloading(self) end

--- Starts the platform rotation animation and, if needed, the animation that shifts the bale places.
---@param self any
function BaleLoader.rotatePlatform(self) end

--- Plays the folding animation toward work and opens the grippers. On load it runs at a very high speed to jump straight to the end.
---@param self boolean
---@param onLoad boolean
function BaleLoader.moveToWorkPosition(self, onLoad) end

--- Plays the folding animation backwards and closes the grippers.
---@param self any
function BaleLoader.moveToTransportPosition(self) end

--- Returns the drop-bale animation specific to the current start place count if it exists, otherwise the generic drop animation.
---@return string
function BaleLoader:getBaleGrabberDropBaleAnimName() end

--- Returns true only in work position with nothing moving, start row not full, free capacity and no unloading in progress.
---@return string
function BaleLoader:getIsBaleGrabbingAllowed() end

--- Server: records the pickup time, selects the bale type and broadcasts a grab-bale state event for the given bale.
---@param nearestBale table
---@param nearestBaleType table
function BaleLoader:pickupBale(nearestBale, nearestBaleType) end

--- Switches to the bale type at the given index (or the first): updates animations, places, fill unit, HUD fill unit display and object changes. Does nothing if the type is unchanged.
---@param baleTypeIndex integer
---@param forceUpdate boolean
function BaleLoader:setBaleLoaderBaleType(baleTypeIndex, forceUpdate) end

--- Returns the first bale type whose size ranges contain the bale's dimensions (diameter and width for round, width, height and length for square), or nil.
---@param bale any
function BaleLoader:getBaleTypeByBale(bale) end

--- Grabber trigger callback: counts the shapes of each `Bale` in the trigger (dynamic bodies on the server, kinematic ones on the client).
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleLoader:baleGrabberTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Unloading mover trigger callback: tracks dynamic bales inside it (with a delete listener) so the mover stays active while they remain.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleLoader:baleLoaderMoveTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Server only: attaches a bale by a physics joint to a joint node under the given node, optionally interpolating its position, applying translation limits and lowering its mass. Reuses the joint if it exists.
---@param bale any
---@param node any
function BaleLoader:mountDynamicBale(bale, node) end

--- Server only: detaches a dynamically mounted bale, deletes its joint node, clears interpolation entries, restores its mass and marks it saveable again.
---@param bale any
function BaleLoader:unmountDynamicBale(bale) end

--- Mounts a bale on a node with an offset, kinematically (collisions with the vehicle disabled) or by simple mount, and marks it not saveable. Removes it from the mover trigger list.
---@param bale any
---@param object any
---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
---@param noKinematicMounting any
function BaleLoader:mountBale(bale, object, node, x, y, z, rx, ry, rz, noKinematicMounting) end

--- Unmounts a bale according to its mount type (simple or kinematic), re-enabling collisions in the kinematic case, and marks it saveable.
---@param bale any
function BaleLoader:unmountBale(bale) end

--- Enables or disables collision between the bale and every vehicle component and every kinematically mounted bale.
---@param bale any
---@param state any
function BaleLoader:setBalePairCollision(bale, state) end

--- Returns a new table of all bale objects currently on bale places or on the start row.
function BaleLoader:getLoadedBales() end

--- Flags automatic unloading as running and sends the empty-button event to the server via the client connection.
function BaleLoader:startAutomaticBaleUnloading() end

--- Returns whether an automatic unloading is in progress.
function BaleLoader:getIsAutomaticBaleUnloadingInProgress() end

--- Returns true if no automatic unloading is running, the last pickup is older than 15 seconds and unloading can start.
function BaleLoader:getIsAutomaticBaleUnloadingAllowed() end

--- Plays the current folding animation at the given speed from its current time (negative speed folds back).
---@param speed any
function BaleLoader:playBaleLoaderFoldingAnimation(speed) end

--- Returns whether the current folding animation is playing.
function BaleLoader:getIsBaleLoaderFoldingPlaying() end

--- Returns the folding animation name: the default one, or the last chosen one if several conditional animations are defined.
function BaleLoader:getCurrentFoldingAnimation() end

--- Chooses the folding animation matching bale type, fill level and bales on the start row, and copies the current animation time to the new one when it changes.
function BaleLoader:updateFoldingAnimation() end

--- Delete listener: removes a deleted bale from the unloading mover trigger list.
---@param bale any
function BaleLoader:onBaleMoverBaleRemoved(bale) end

--- Delete listener: forgets an unload trigger that was deleted.
---@param self any
---@param unloadTrigger any
function BaleLoader.onBaleUnloadTriggerDeleted(self, unloadTrigger) end

--- Registers an unload trigger (reference counted) with a delete listener and wakes the vehicle so it checks automatic unloading.
---@param unloadTrigger any
function BaleLoader:addBaleUnloadTrigger(unloadTrigger) end

--- Decrements the reference count of an unload trigger and drops it and its delete listener at zero.
---@param unloadTrigger any
function BaleLoader:removeBaleUnloadTrigger(unloadTrigger) end

--- Override: always returns true, so the bale loader can be selected.
---@param superFunc any
function BaleLoader:getCanBeSelected(superFunc) end

--- Override: returns false when dynamic mount is enabled, otherwise the parent result.
---@param superFunc any
function BaleLoader:getAllowDynamicMountFillLevelInfo(superFunc) end

--- Override: returns false while an automatic unloading is in progress, otherwise the parent result.
---@param superFunc any
---@return boolean
---@return string
function BaleLoader:getAreControlledActionsAllowed(superFunc) end

--- Override: not ready for AI driving while in work position or while the grabber moves.
---@param superFunc any
function BaleLoader:getIsAIReadyToDrive(superFunc) end

--- Override: returns true while the grabber is moving, otherwise the parent result.
---@param superFunc any
function BaleLoader:getIsAIPreparingToDrive(superFunc) end

--- Override: folding is refused while the loader still holds bales, otherwise the parent decides.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function BaleLoader:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Override: true while `consumePtoPower` is on and the loader is in work position or moving; otherwise the parent result.
---@param superFunc any
---@return boolean
function BaleLoader:getDoConsumePtoPower(superFunc) end

--- Override: adds a full load (1) for one more consumer while in work position or moving with PTO consumption on, on top of the parent values.
---@param superFunc any
function BaleLoader:getConsumingLoad(superFunc) end

--- Override: true while PTO consumption is on and the loader is in work position or moving; otherwise the parent result.
---@param superFunc any
function BaleLoader:getIsPowerTakeOffActive(superFunc) end

--- Override: after the parent adds the vehicle, re-adds every loaded bale to physics and remounts it on its place. Returns false if the parent fails.
---@param superFunc any
---@return boolean
function BaleLoader:addToPhysics(superFunc) end

--- Override: after the parent removes the vehicle, unmounts every loaded bale and removes it from physics. Returns false if the parent fails.
---@param superFunc any
---@return boolean
function BaleLoader:removeFromPhysics(superFunc) end

--- Client: registers the work/transport, unload and abort inputs (the first only without folding state, the others only without full automatic unloading).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function BaleLoader:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: sends the empty-button event to the server if the minimum fill level is reached or unloading is running, otherwise shows a blinking warning.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleLoader.actionEventEmpty(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: sends the abort-unloading event to the server.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleLoader.actionEventAbortEmpty(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: sends the work/transport toggle event to the server.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleLoader.actionEventWorkTransport(self, actionName, inputValue, callbackState, isAnalog) end

--- Scans the baleType entries of the XML root and collects min and max diameter and length for round or square loaders. Returns the table, or nil if nothing matches.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
---@param roundBaleLoader any
function BaleLoader.loadSpecValueBaleSize(xmlFile, customEnvironment, baseDir, roundBaleLoader) end

--- Shop display of the supported bale size in cm (diameter for round, length for square), as a text or raw numbers with unit. Returns empty values if the spec is missing.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@param roundBaleLoader any
function BaleLoader.getSpecValueBaleSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange, roundBaleLoader) end

--- Shop loader for round bale sizes; delegates to `loadSpecValueBaleSize`.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleLoader.loadSpecValueBaleSizeRound(xmlFile, customEnvironment, baseDir) end

--- Shop loader for square bale sizes; delegates to `loadSpecValueBaleSize`.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleLoader.loadSpecValueBaleSizeSquare(xmlFile, customEnvironment, baseDir) end

--- Shop getter for round bale size, nil if the item has no such spec.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleLoader.getSpecValueBaleSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Shop getter for square bale size, nil if the item has no such spec.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleLoader.getSpecValueBaleSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
