---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaleWrapper.lua (generated stub, FS25 Lua Atlas)

--- Specialization for bale wrappers (round and square, including combined baler-wrappers). A server-driven state machine grabs a bale in a trigger, moves it to the wrapper, wraps it using animations, rotation curves and foil clips while consuming wrap film (Consumable), then drops it. Requires AnimatedVehicle and Consumable. State changes are broadcast with BaleWrapperStateEvent, and late joiners are brought up to date via onReadStream/onWriteStream. Configured under vehicle.baleWrapper (roundBaleWrapper, squareBaleWrapper, grabber, automaticDrop, wrapping animation and color configurations).
---@class BaleWrapper
BaleWrapper = {}

--- Returns true only if the vehicle type has both AnimatedVehicle and Consumable.
---@param specializations table
---@return boolean
function BaleWrapper.prerequisitesPresent(specializations) end

--- Registers the wrappingColor and wrappingAnimation vehicle configuration types, the two store spec entries for round and square bale sizes, and the whole vehicle.baleWrapper XML schema including the wrapping animation configurations.
function BaleWrapper.initSpecialization() end

--- Registers the XML keys of one wrapper block (round or square) at the given base path: nodes, bale types, animations, curves, wrap nodes, drop and block areas, foil animation and sounds.
---@param schema any
---@param basePath any
function BaleWrapper.registerWrapperXMLPaths(schema, basePath) end

--- Registers the animName, animSpeed, reverseAfterMove and resetOnStart attributes for one named wrapper animation under the given path.
---@param schema any
---@param basePath any
---@param name any
function BaleWrapper.registerWrapperAnimationXMLPaths(schema, basePath, name) end

--- Registers the wrappingFoilAnimation XML keys (reference node and axis, min/max rotation, clip node and clip name).
---@param schema any
---@param basePath any
function BaleWrapper.registerWrapperFoilAnimationXMLPaths(schema, basePath) end

--- Registers the wrapper loading functions, the grabber trigger callback, wrappability and drop checks, state change handling, bale type selection and the automatic drop and drop animation setters on the vehicle type.
---@param vehicleType any
function BaleWrapper.registerFunctions(vehicleType) end

--- Overrides getIsFoldAllowed, getCanBeSelected, getShowConsumableEmptyWarning, getRequiresPower, getStandaloneMotorTargetRpm, getStandaloneMotorLoad, addToPhysics and removeFromPhysics.
---@param vehicleType any
function BaleWrapper.registerOverwrittenFunctions(vehicleType) end

--- Registers load, post-load, network stream, update, draw, action event, deactivate, fold state and consumable variation listeners.
---@param vehicleType any
function BaleWrapper.registerEventListeners(vehicleType) end

--- Loads the round and square wrapper definitions, picks the initial wrapper type, creates the grab trigger (a missing triggerNode only logs an XML warning, though it is required) and initialises state, automatic drop settings and warning texts.
---@param savegame table
function BaleWrapper:onLoad(savegame) end

--- If a savegame holds a wrapped bale, reads its file name, wrapper time and attributes into a pending baleToLoad entry, restored later in onLoadFinished.
---@param savegame any
function BaleWrapper:onPostLoad(savegame) end

--- Loads one wrapper block: animations, bale and wrapper nodes, wrapping time, allowed bale types (size, textures, drop animations, wrap usage), curves, wrap nodes, drop and block areas, unload text and, on clients, wrap/start/stop sounds. Many deprecated FS19/FS22 attributes only trigger warnings.
---@param wrapper any
---@param xmlFile any
---@param baseKey any
---@param wrapperName any
function BaleWrapper:loadWrapperFromXML(wrapper, xmlFile, baseKey, wrapperName) end

--- Loads the named animations (name, speed, reverseAfterMove, resetOnStart) into target.animations, falling back to a parent animation table through a metatable. A configuration key overrides the base key when present.
---@param target any
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param animationsKey any
---@param parentAnimations any
function BaleWrapper:loadWrapperAnimationsFromXML(target, xmlFile, baseKey, configKey, animationsKey, parentAnimations) end

--- Builds the animation curve of keyframes giving bale rotation and wrapper rotation over wrapping time, stopping at the first key without baleRot.
---@param target any
---@param xmlFile any
---@param baseKey any
function BaleWrapper:loadWrapperAnimCurveFromXML(target, xmlFile, baseKey) end

--- Loads wrapAnimNodes: per node curves of translation, rotation and scale driven either by wrapper rotation or by wrapping time, with optional repeat and rotation normalisation on bale drop.
---@param target any
---@param xmlFile any
---@param baseKey any
function BaleWrapper:loadWrapperAnimNodesFromXML(target, xmlFile, baseKey) end

--- Loads wrapNodes: nodes whose visibility depends on wrapping or empty state, with an optional maximum wrapper rotation.
---@param target any
---@param xmlFile any
---@param baseKey any
function BaleWrapper:loadWrapperWrapNodesFromXML(target, xmlFile, baseKey) end

--- Builds an optional curve mapping progress to the wrapping state applied to the bale. Sets it to nil if no key is defined.
---@param target any
---@param xmlFile any
---@param baseKey any
function BaleWrapper:loadWrapperStateCurveFromXML(target, xmlFile, baseKey) end

--- Loads wrappingAnimationNodes: timed keys that move or re-link nodes (such as film pieces) as a reference node rotates, and places those at time 0 in their start position.
---@param target any
---@param xmlFile any
---@param baseKey any
---@param animTime any
function BaleWrapper:loadWrapperAnimationNodesFromXML(target, xmlFile, baseKey, animTime) end

--- Loads the foil animation: reference node and rotation range plus a clip on a clip node. Warns when the clip node, clip name or clip is missing. For the default animation it resets the clip track to time 0.
---@param target any
---@param xmlFile any
---@param baseKey any
---@param isDefault any
function BaleWrapper:loadWrapperFoilAnimationFromXML(target, xmlFile, baseKey, isDefault) end

--- Restores a bale saved in the savegame: creates and registers it, replays grab, drop-at-grabber and wrapping start state changes and resumes the wrapping animation at the saved time, or finishes wrapping if complete.
---@param savegame table
function BaleWrapper:onLoadFinished(savegame) end

--- Detaches the bale being handled (kept and sellable again, or deleted when the vehicle is being reconfigured on the server), removes the grab trigger and deletes the wrapper sound samples.
function BaleWrapper:onDelete() end

--- Saves the current wrapping time and, if a bale is held by the grabber or wrapper, that bale under the .bale key of the vehicle entry.
---@param xmlFile any
---@param key any
---@param usedModNames any
function BaleWrapper:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side initial sync: reads wrapper type, bale type and state, then replays the state changes and animations needed to reach that state. Note: the MOVING_GRABBER_TO_WORK branch writes self.baleGrabber.currentBale instead of spec.baleGrabber.currentBale, likely a bug.
---@param streamId integer
---@param connection Connection
function BaleWrapper:onReadStream(streamId, connection) end

--- Server side counterpart: writes wrapper type, bale type index, state, the bale object id when relevant and the elapsed wrapping time while wrapping.
---@param streamId integer
---@param connection Connection
function BaleWrapper:onWriteStream(streamId, connection) end

--- Mounts a pending bale once it exists. While wrapping, consumes film, advances the wrapping time with dt, calls updateWrappingState, keeps the vehicle active and switches the wrap/stop sounds on clients.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleWrapper:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Looks for a bale to grab (server picks it up, client may show an unsupported-bale warning). On the server it advances the state machine when the current animation ends by broadcasting BaleWrapperStateEvent. Handles automatic drop and refreshes action events.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleWrapper:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: shows a blinking warning for an unsupported bale or a blocked drop area.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function BaleWrapper:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Trigger callback that counts Bale objects entering and leaving the grab trigger, reacting only to dynamic rigid bodies.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleWrapper:baleGrabberTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Returns true when the machine is idle, no saved bale is pending and the fold animation time lies within the allowed fold limits.
---@return boolean
function BaleWrapper:allowsGrabbingBale() end

--- Shows or hides wrap nodes according to wrapping and empty state, and updates wrapAnimNodes transforms from wrapping time or wrapper rotation. When not wrapping and not empty, normalises their rotation if configured.
---@param isWrapping boolean
---@param isEmpty boolean
---@param t number
---@param wrapperRot number
function BaleWrapper:updateWrapNodes(isWrapping, isEmpty, t, wrapperRot) end

--- Applies wrapping progress: drives the foil clip, relinks timed animation nodes, rotates bale and wrapper nodes from the curve, sets the bale wrapping state and color, updates wrap nodes, and on the server ends wrapping at the finish. Note: it reads an undefined variable v for wrapperRot, so that line looks like a bug.
---@param wrappingTime number
---@param noEventSend boolean
function BaleWrapper:updateWrappingState(wrappingTime, noEventSend) end

--- Selects the wrapper and bale type matching the grabbed bale, then plays the moveToWrapper animation if defined.
---@param bale table
function BaleWrapper:playMoveToWrapper(bale) end

--- Switches between round and square wrapper and selects a bale type: applies its animations, foil animation and object changes, resets the foil clip and requests an action event update.
---@param isRoundBaleWrapper boolean
---@param baleTypeIndex integer
function BaleWrapper:setBaleWrapperType(isRoundBaleWrapper, baleTypeIndex) end

--- Returns the index of the first bale type whose size matches the bale, or 1 if none matches.
---@param baleTypes table
---@param bale table
function BaleWrapper:getMatchingBaleTypeIndex(baleTypes, bale) end

--- Applies one state machine transition on every machine (grab, drop at grabber, wrapping start, wrapping finished, start drop, bale dropped, platform reset, empty button). Handles mounting, animations, sounds, farm stats and the WrappedBales achievement. Skips wrapping when the bale cannot or need not be wrapped.
---@param id integer
---@param nearestBaleServerId integer
function BaleWrapper:doStateChange(id, nearestBaleServerId) end

--- Checks the bale against the allowed bale types. Returns wrappable, size-matches and the matching type index; wrappable only if the bale supports wrapping, is not fully wrapped and the type is not skipWrapping.
---@param bale table
---@return table
function BaleWrapper:getIsBaleWrappable(bale) end

--- Tests the drop area box for overlapping objects. Returns true, or false with the blocked-area warning text when something other than the carried bale is in the way.
---@return boolean
---@return string
function BaleWrapper:getIsBaleDropAllowed() end

--- Overlap callback for the drop area: flags a blocking object and records the time, ignoring the vehicle itself and the bale being carried.
---@param nodeId any
function BaleWrapper:onBaleWrapperDropOverlapCallback(nodeId) end

--- Returns true if the block wrap area is free of other objects and wrap film is available in the consumable.
---@return boolean
function BaleWrapper:getIsBaleWrappingAllowed() end

--- Overlap callback for the block wrap area: flags any object other than the vehicle and the carried bale.
---@param nodeId any
function BaleWrapper:onBaleWrapperBlockOverlapCallback(nodeId) end

--- Server side. Sets the bale wrap textures from the bale type when it will be wrapped, removes it from the trigger list and broadcasts the grab state change.
---@param bale table
---@param baleTypeIndex integer
function BaleWrapper:pickupWrapperBale(bale, baleTypeIndex) end

--- Static helper looping over bales in the grab trigger and returning the wrappable bale, the nearest bale and its bale type index. Note: nearestDistance is reset to the starting distance each time, so the result is not strictly the nearest.
---@param self integer
---@param refNode integer
---@param distance number
---@return table
---@return integer
function BaleWrapper.getBaleInRange(self, refNode, distance) end

--- Sets or toggles (if state is nil) automatic drop, refreshes action events and sends BaleWrapperAutomaticDropEvent unless noEventSend is set.
---@param state any
---@param noEventSend any
function BaleWrapper:setBaleWrapperAutomaticDrop(state, noEventSend) end

--- Stores which drop animation index will be used for the next drop.
---@param dropAnimationIndex any
function BaleWrapper:setBaleWrapperDropAnimation(dropAnimationIndex) end

--- Refuses folding with a warning text while the wrapper is not idle, otherwise defers to the parent.
---@param superFunc boolean
---@param direction any
---@param onAiTurnOn boolean
---@return boolean
function BaleWrapper:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Always returns true, so the vehicle can be selected even as a passive implement.
---@param superFunc any
function BaleWrapper:getCanBeSelected(superFunc) end

--- For the wrap film consumable, shows the empty warning only when the machine is busy and the parent agrees; other types use the parent.
---@param superFunc any
---@param typeName any
function BaleWrapper:getShowConsumableEmptyWarning(superFunc, typeName) end

--- Returns true whenever the wrapper is not idle, otherwise the parent result.
---@param superFunc any
function BaleWrapper:getRequiresPower(superFunc) end

--- Returns the larger of the parent value and a factor: 1 while wrapping, 0.5 in other active states, 0 when idle or finished.
---@param superFunc any
function BaleWrapper:getStandaloneMotorTargetRpm(superFunc) end

--- Adds one load entry to the parent values: 1 while wrapping, 0.5 in other active states, 0 otherwise. Returns the load sum and count.
---@param superFunc any
function BaleWrapper:getStandaloneMotorLoad(superFunc) end

--- Calls the parent, then re-adds to physics and re-mounts the bale held by the grabber and by the wrapper. Returns false if the parent fails.
---@param superFunc any
---@return boolean
function BaleWrapper:addToPhysics(superFunc) end

--- Calls the parent, then unmounts and removes from physics the bale on the wrapper. Returns false if the parent fails.
---@param superFunc any
---@return boolean
function BaleWrapper:removeFromPhysics(superFunc) end

--- Client only: registers the unload action (IMPLEMENT_EXTRA3), optional per-drop-animation actions and the automatic drop toggle (IMPLEMENT_EXTRA4) when the vehicle is active for input.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function BaleWrapper:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Registers the external action events baleWrapperDrop, baleWrapperAutomaticDrop (only if toggleable) and baleWrapperWarnings for triggers outside the vehicle.
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function BaleWrapper:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- Clears the invalid bale warning and stops the wrap, start and stop sounds on clients.
function BaleWrapper:onDeactivate() end

--- When the fold direction changes and a bale type is flagged forceWhileFolding, switches back to that wrapper and bale type.
---@param direction any
---@param moveToMiddle any
function BaleWrapper:onFoldStateChanged(direction, moveToMiddle) end

--- Stores the wrapping film color from the consumable variation metadata, if any, for tinting bales.
---@param variationIndex any
---@param metaData any
function BaleWrapper:onConsumableVariationChanged(variationIndex, metaData) end

--- Input callback for the unload action: if wrapping is finished and drop is allowed, sends BaleWrapperStateEvent (CHANGE_BUTTON_EMPTY) to the server, otherwise shows the blocking warning.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleWrapper.actionEventEmpty(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback that toggles automatic drop.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleWrapper.actionEventToggleAutomaticDrop(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for a drop-animation action: when wrapping is finished, sends BaleWrapperDropEvent to the server with the callback state.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleWrapper.actionEventDrop(self, actionName, inputValue, callbackState, isAnalog) end

--- Activates the unload and drop-animation actions only in the finished state, and refreshes the unload and automatic drop texts.
---@param self any
function BaleWrapper.updateActionEvents(self) end

--- Registers the unload input for an external trigger; it runs the unload callback only when automatic drop is off.
---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventUnloadRegister(data, vehicle) end

--- Enables the external unload action only in the finished state.
---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventUnloadUpdate(data, vehicle) end

--- Registers the external input that toggles automatic drop.
---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventAutomaticUnloadRegister(data, vehicle) end

--- Updates the external toggle text according to the automatic drop state.
---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventAutomaticUnloadUpdate(data, vehicle) end

--- Empty register callback for the external warnings entry.
---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventWarningsRegister(data, vehicle) end

--- Shows the blocked-drop warning (automatic drop, within 500 ms of the last overlap) or the unsupported-bale warning for external triggers.
---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventWarningsUpdate(data, vehicle) end

--- Store spec loader: reads the min and max diameter and length of the non-skipped bale types of one wrapper kind. Returns a table, or nil if there is none.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
---@param roundBaleWrapper any
function BaleWrapper.loadSpecValueBaleSize(xmlFile, customEnvironment, baseDir, roundBaleWrapper) end

--- Store spec getter: returns the bale size in cm as text (single value or range), or as numbers and unit when returnValues is set. Round wrappers use diameter, square ones length. Empty values if none.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@param roundBaleWrapper any
function BaleWrapper.getSpecValueBaleSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange, roundBaleWrapper) end

--- Store spec loader for round bale size, calls loadSpecValueBaleSize with the round flag.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleWrapper.loadSpecValueBaleSizeRound(xmlFile, customEnvironment, baseDir) end

--- Store spec loader for square bale size, calls loadSpecValueBaleSize with the square flag.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleWrapper.loadSpecValueBaleSizeSquare(xmlFile, customEnvironment, baseDir) end

--- Store getter for round bale size, nil when the store item has no such spec.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleWrapper.getSpecValueBaleSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Store getter for square bale size, nil when the store item has no such spec.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleWrapper.getSpecValueBaleSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
