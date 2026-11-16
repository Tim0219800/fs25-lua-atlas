---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Dischargeable.lua (generated stub, FS25 Lua Atlas)

--- Discharge specialization (spec_dischargeable): empties a fill unit of the vehicle (tipper, combine unloading auger, trailer) either into a receiving object (another vehicle, hopper, building) or onto the ground through the height density map. The vehicle can have several discharge nodes (dischargeNode), only one of which is current (setCurrentDischargeNodeIndex).
--- 
--- STATES. spec.currentDischargeState takes the values Dischargeable.DISCHARGE_STATE_OFF, _OBJECT and _GROUND (numeric values UNVERIFIED: constants defined in the file header, which is empty in the dump). Refusal reasons: DISCHARGE_REASON_* (unsupported fill type, unsupported tool, no access, no more room, etc.).
--- 
--- TARGET DETECTION. Two paths: (1) a physical trigger (dischargeNode.trigger, with addTrigger) that lists objects having a fill unit, picks the closest one based on the distance to the "exactFillRootNode" node and chooses the target object; (2) an asynchronous raycast (raycastAllAsync) from raycast#node downwards (or toward world -Y if useWorldNegYDirection), over maxDistance (10 by default), with the collision mask FILLABLE + VEHICLE + TERRAIN, whose result (finishDischargeRaycast) gives object, shape, distance, or terrain. The resulting distance is the drop distance used by the effects (see below).
--- 
--- AMOUNTS AND dt. Server side only, on every tick: liters to empty = min(level, emptySpeed * factor * dt) with dt in ms; emptySpeed is #emptySpeed (liters per second, defaulting to the unit capacity) divided by 1000 and multiplied by Platform.gameplay.dischargeSpeedFactor, hence liters per ms. Discharging only happens when the node's last effect is fully visible (lastEffect:getIsFullyVisible()). On the ground, dischargeToGround pours through DensityMapHeightUtil.tipToGroundAroundLine along a segment (width info#width, length info#length, height info#yOffset, 2.0 by default), with a cap on accumulated liters equal to emptySpeed*250 (i.e. 250 ms) or, if larger, the minimum valid value of the fill type (g_densityMapHeightManager:getMinValidLiterValue).
--- 
--- DISCHARGE EFFECTS (dust/flow). Effects are loaded by g_effectManager:loadEffect from dischargeNode.effects (schema EffectManager.registerEffectXMLPaths); the effect classes and EffectManager are ABSENT from the dump: their rendering is UNVERIFIED. The code shows: (a) the fill type is passed to the effects through g_effectManager:setEffectTypeInfo at start, so the look (material/color) may depend on the product through the effect class; (b) the drop distance is passed to every effect exposing setDistance(distance, g_terrainNode) (setDischargeEffectDistance), typically to lengthen or cut the stream down to the ground or the target; (c) shutdown is deferred: the effect only stops effectTurnOffThreshold after the last request (effectTurnOffThreshold, 0.25 by default; XML type TIME: if the default is not converted, it would be read in ms through the comparison with g_time; UNVERIFIED); (d) animations tied to the effects (effectAnimationNodes) start and stop with them. No reading of wind, moisture or dust appears in this file: the flow is not modulated by weather here.
--- 
--- NETWORK. The effect state is decided on the server (setDischargeEffectActive in the isServer block of onUpdateTick); it is sent to clients through the stream (dirty flag dirtyFlag) as: an "effect active" boolean, a distance quantized on 8 bits (value over maxDistance, 1 to 255) and the fill type (FillTypeManager.SEND_NUM_BITS). Clients then call setDischargeEffectActive(..., force) and setDischargeEffectDistance. The discharge state is transmitted by SetDischargeStateEvent. The discharge sound is handled client side (updateDischargeSound) with the sound shared per fill type (g_fillTypeManager:getSampleByFillType) cloned onto the node, plus a node-specific #dischargeSound; stopping is delayed by 250 ms.
--- 
--- EXTENSION POINTS. Events: onDischargeStateChanged, onDischargeTargetObjectChanged. Functions overridden here: getRequiresTipOcclusionArea, getCanBeSelected, getDoConsumePtoPower, getIsPowerTakeOffActive, getAllowLoadTriggerActivation. Functions designed to be overridden by other specializations (simple default value): getDischargeNodeEmptyFactor (1.0), getIsDischargeNodeActive (spec.isDischargeAllowed), getDischargeNodeAutomaticDischarge, handleDischargeNodeChanged (empty), handleDischarge, handleDischargeRaycast. Persistence: only #isAllowed is saved.
---@class Dischargeable
Dischargeable = {}

--- Requires the FillUnit and FillVolume specializations.
---@param specializations any
function Dischargeable.prerequisitesPresent(specializations) end

--- Declares the "dischargeable" configuration type, the XML schema (keys of a discharge node under vehicle.dischargeable and under each dischargeableConfiguration, activeDischargeNode and dischargeState dashboards with #dischargeNodeIndex) and the #isAllowed save key.
function Dischargeable.initSpecialization() end

--- Registers the XML keys of a discharge node: node, fill unit, speeds, triggers, raycast, info (width, length, offsets), effects (EffectManager.registerEffectXMLPaths), effect animations, sounds, state/distance change objects, fill type converter, #effectTurnOffThreshold, etc.
---@param schema any
---@param basePath any
function Dischargeable.registerXMLPaths(schema, basePath) end

--- Registers the public discharge functions (state, target, effects, permission tests, raycast, nodes).
---@param vehicleType any
function Dischargeable.registerFunctions(vehicleType) end

--- Overrides five base functions: getRequiresTipOcclusionArea, getCanBeSelected, getDoConsumePtoPower, getIsPowerTakeOffActive, getAllowLoadTriggerActivation.
---@param vehicleType any
function Dischargeable.registerOverwrittenFunctions(vehicleType) end

--- Declares the events onDischargeStateChanged and onDischargeTargetObjectChanged.
---@param vehicleType any
function Dischargeable.registerEvents(vehicleType) end

--- Subscribes the specialization to the lifecycle, the network, onUpdate / onUpdateTick, input actions, fill levels, deactivation and vehicle state change.
---@param vehicleType any
function Dischargeable.registerEventListeners(vehicleType) end

--- Loads the configuration options (#requiresTipOcclusionArea, #consumePower, #stopDischargeOnDeactivate, all true by default) and each dischargeNode (loadDischargeNode), rejecting duplicate nodes, duplicate triggers and nonexistent fill units; builds the lookup tables, sets the raycast collision mask (FILLABLE + VEHICLE + TERRAIN), selects node 1 and reserves the dirty flag. With no valid node at all, removes the specialization's event listeners.
---@param savegame any
function Dischargeable:onLoad(savegame) end

--- Reads back the saved discharge "isAllowed" flag (unless vehicles are being reset).
---@param savegame any
function Dischargeable:onPostLoad(savegame) end

--- Saves #isAllowed.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Dischargeable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Registers the dashboard values activeDischargeNode and dischargeState.
function Dischargeable:onRegisterDashboardValueTypes() end

--- Deletes the effects (g_effectManager:deleteEffects) and effect animations of each node, removes the discharge and activation triggers and clears their tracked objects.
function Dischargeable:onDelete() end

--- Client side on connection: for each node reads the effect state, the distance (8 bits, proportion of maxDistance) and the fill type, turns the effect on or off accordingly, then reads the discharge state.
---@param streamId any
---@param connection any
function Dischargeable:onReadStream(streamId, connection) end

--- Server side on connection: for each node writes the sent effect state, the distance (clamped to 1..255) and the discharge fill type, then the discharge state.
---@param streamId any
---@param connection any
function Dischargeable:onWriteStream(streamId, connection) end

--- Client side: if the dirty flag is present, re-reads for each node the effect state, the distance and the fill type and applies them (forced).
---@param streamId any
---@param timestamp any
---@param connection any
function Dischargeable:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: if the dirty flag is raised, writes for each node the effect state, the quantized distance and the fill type.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Dischargeable:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Keeps the vehicle active as long as an object is in the activation trigger or a discharge is in progress (raiseActive). No dt used.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dischargeable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Main tick. Updates the input actions; if the node is active, determines the target (walks the trigger's objects choosing the closest with prioritized refusal reasons, or runs the asynchronous raycast), raises onDischargeTargetObjectChanged, updates the sound, then server side: starts automatic discharging if allowed, or, while discharging, computes the liters (emptySpeed, factor and dt), drives the effect (setDischargeEffectActive / setDischargeEffectDistance), calls discharge then handleDischarge, and raises the dirty flag if the distance changed by more than 0.05. Also turns off the effects of inactive nodes whose shutdown delay has elapsed and extends activity while sounds are playing.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dischargeable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Reads all the parameters of a node: #node and #fillUnitIndex (required), permission options (ground, object, vehicle, automatic, anywhere, mission), #emptySpeed, #effectTurnOffThreshold (0.25), tool type, info (width, length, offsets), trigger, raycast, max distance, activation trigger, fill converter, change objects (distance, state, active node), effects, animation, sounds and effect animations (client). Initializes the state (effect inactive, last effect = last in the list).
---@param xmlFile any
---@param key any
---@param entry any
function Dischargeable:loadDischargeNode(xmlFile, key, entry) end

--- Switches the current node: turns off the effect, sound and animations of the old node, activates the change objects of the new one, and updates the UI on the client. The end of the function was not read in detail.
---@param dischargeNodeIndex any
function Dischargeable:setCurrentDischargeNodeIndex(dischargeNodeIndex) end

--- Returns the current discharge node.
function Dischargeable:getCurrentDischargeNode() end

--- Returns the index of the current discharge node.
function Dischargeable:getCurrentDischargeNodeIndex() end

--- Returns the target object and the index of its fill unit for a node.
---@param dischargeNode any
function Dischargeable:getDischargeTargetObject(dischargeNode) end

--- Returns the object currently being fed by the discharge.
---@param dischargeNode any
function Dischargeable:getCurrentDischargeObject(dischargeNode) end

--- Override: returns the #requiresTipOcclusionArea configuration option.
function Dischargeable:getRequiresTipOcclusionArea() end

--- Override: always true.
---@param superFunc any
function Dischargeable:getCanBeSelected(superFunc) end

--- Override: true during a discharge if consumePower is set, otherwise the base result.
---@param superFunc any
function Dischargeable:getDoConsumePtoPower(superFunc) end

--- Override: same condition as getDoConsumePtoPower.
---@param superFunc any
function Dischargeable:getIsPowerTakeOffActive(superFunc) end

--- Override: allows activating a load trigger if the base result permits it, or by delegating to the object hit by the discharge (with a guard against looping on the root vehicle).
---@param superFunc any
---@param rootVehicle any
function Dischargeable:getAllowLoadTriggerActivation(superFunc, rootVehicle) end

--- Empties emptyLiters into the target object (OBJECT state) or onto the terrain (GROUND state); returns the liters emptied and two minimum-drop booleans (useful on the ground).
---@param dischargeNode any
---@param emptyLiters any
function Dischargeable:discharge(dischargeNode, emptyLiters) end

--- Empties onto the ground: accumulates liters in litersToDrop (capped at emptySpeed*250 or at the valid minimum), pours along a line through DensityMapHeightUtil.tipToGroundAroundLine, removes the liters actually deposited from the fill unit and handles the case of a remainder below the minimum drop. Applies the fill type converter's factor.
---@param dischargeNode any
---@param emptyLiters any
function Dischargeable:dischargeToGround(dischargeNode, emptyLiters) end

--- Empties into an object's fill unit if the fill type is supported and allowed, applies the conversion factor, then removes from the vehicle the quantity actually accepted.
---@param dischargeNode any
---@param emptyLiters any
---@param object any
---@param targetFillUnitIndex any
function Dischargeable:dischargeToObject(dischargeNode, emptyLiters, object, targetFillUnitIndex) end

--- State change triggered by a player action; delegates to setDischargeState.
---@param state any
---@param noEventSend any
function Dischargeable:setManualDischargeState(state, noEventSend) end

--- Changes the discharge state: broadcasts SetDischargeStateEvent, turns off the effect server side when the state goes to OFF, starts/stops state animations and sounds client side, applies the state change objects, plays the node's animation (forward or backward) and raises onDischargeStateChanged.
---@param state any
---@param noEventSend any
function Dischargeable:setDischargeState(state, noEventSend) end

--- Returns the current discharge state.
function Dischargeable:getDischargeState() end

--- Returns the discharged fill type and the conversion factor (1 without a converter); the converter may replace the type with another fill type.
---@param dischargeNode any
function Dischargeable:getDischargeFillType(dischargeNode) end

--- True if discharging is allowed, the terrain is hit and, if the tank is not empty, the fill type can be tipped on the ground (DensityMapHeightUtil.getCanTipToGround).
---@param dischargeNode any
function Dischargeable:getCanDischargeToGround(dischargeNode) end

--- True if discharging anywhere is allowed, or if both ends of the drop line belong to a parcel accessible to the active farm (or to a farm mission if canDischargeToMissionGround).
---@param dischargeNode any
function Dischargeable:getCanDischargeToLand(dischargeNode) end

--- If the tank is not empty and the state is OFF or GROUND, checks that there is still room to drop at least the valid minimum around the drop line (DensityMapHeightUtil.getCanTipToGroundAroundLine).
---@param dischargeNode any
function Dischargeable:getCanDischargeAtPosition(dischargeNode) end

--- True if a target object exists, supports and allows the fill type, has room, accepts the active farm and, for a dynamically mounted object, if the carrier's farm has access.
---@param dischargeNode any
function Dischargeable:getCanDischargeToObject(dischargeNode) end

--- Builds the warning text according to the refusal reason (or a custom text from the object) with the fill type title.
---@param dischargeNode any
function Dischargeable:getDischargeNotAllowedWarning(dischargeNode) end

--- True if the current node allows discharging to an object.
function Dischargeable:getCanToggleDischargeToObject() end

--- True if the current node allows discharging to the ground and does not start it automatically.
function Dischargeable:getCanToggleDischargeToGround() end

--- Returns spec.isDischargeAllowed (override point for other specializations).
---@param dischargeNode any
function Dischargeable:getIsDischargeNodeActive(dischargeNode) end

--- Returns 1.0: emptying speed factor, an override point (for example to modulate the flow rate).
---@param dischargeNode any
function Dischargeable:getDischargeNodeEmptyFactor(dischargeNode) end

--- Returns the node's canStartDischargeAutomatically option.
---@param dischargeNode any
function Dischargeable:getDischargeNodeAutomaticDischarge(dischargeNode) end

--- Returns the discharge node associated with an I3D node.
---@param node any
function Dischargeable:getDischargeNodeByNode(node) end

--- Launches the node's asynchronous raycast (local downwards or toward world -Y, over maxDistance) after resetting the results; flags the raycast as active.
---@param dischargeNode any
function Dischargeable:updateRaycast(dischargeNode) end

--- If info#useRaycastHitPosition is set, places the info node on the raycast hit point.
---@param dischargeNode any
---@param x any
---@param y any
---@param z any
function Dischargeable:updateDischargeInfo(dischargeNode, x, y, z) end

--- Raycast callback: analyzes each hit (object with a fill unit, terrain or other), keeps the closest one and its refusal reasons, then concludes on the last hit with finishDischargeRaycast. Not read in detail.
---@param hitActorId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param hitShapeId any
---@param isLast any
function Dischargeable:raycastCallbackDischargeNode(hitActorId, x, y, z, distance, nx, ny, nz, subShapeIndex, hitShapeId, isLast) end

--- Copies the raycast results into the node state, calls handleDischargeRaycast, releases the async flag and raises onDischargeTargetObjectChanged if the target changed.
function Dischargeable:finishDischargeRaycast() end

--- Returns the discharge node at the given index.
---@param index any
function Dischargeable:getDischargeNodeByIndex(index) end

--- Stops the discharge (OFF state without a broadcast event) if the current node has stopDischargeOnEmpty.
---@param dischargeNode any
function Dischargeable:handleDischargeOnEmpty(dischargeNode) end

--- Empty extension point called when the node changes.
function Dischargeable:handleDischargeNodeChanged() end

--- After an emptying: if stopDischargeIfNotPossible is set and nothing was emptied (on the ground: and no minimum drop is pending), sets the state back to OFF.
---@param dischargeNode any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function Dischargeable:handleDischarge(dischargeNode, dischargedLiters, minDropReached, hasMinDropFillLevel) end

--- Server side: stops discharging to an object if the ray no longer hits it and starts automatic ground discharging if allowed; applies the object changes according to the distance (threshold distanceObjectChangeThreshold, 0.5 by default).
---@param dischargeNode any
---@param object any
---@param shape any
---@param distance any
---@param illUnitIndex any
---@param hitTerrain any
function Dischargeable:handleDischargeRaycast(dischargeNode, object, shape, distance, illUnitIndex, hitTerrain) end

--- When a target is found and automatic discharging is permitted, switches to the OBJECT state.
---@param dischargeNode any
function Dischargeable:handleFoundDischargeObject(dischargeNode) end

--- If the node's effect is active and the distance is finite, calls effect:setDistance(distance, g_terrainNode) on each effect exposing it. The exact meaning on the effect side is UNVERIFIED (effect classes absent).
---@param dischargeNode any
---@param distance any
function Dischargeable:setDischargeEffectDistance(dischargeNode, distance) end

--- Starts or stops a node's effects and effect animations. On start: sets the fill type (g_effectManager:setEffectTypeInfo) then g_effectManager:startEffects. On non-forced stop: schedules the stop at g_time + effectTurnOffThreshold; forced: stops immediately (stopEffects). Server side raises the dirty flag when the state changes (for clients).
---@param dischargeNode any
---@param isActive any
---@param force any
---@param fillTypeIndex any
function Dischargeable:setDischargeEffectActive(dischargeNode, isActive, force, fillTypeIndex) end

--- Client: plays the shared fill-type sound (cloned onto the node, replaced when the type changes) and the node's own sound while the effect is active or the last effect remains visible; delays the stop by 250 ms counted down with dt.
---@param dischargeNode any
---@param dt any
function Dischargeable:updateDischargeSound(dischargeNode, dt) end

--- Discharge trigger callback: tracks objects (with a fill unit) entering or leaving, remembering shape and unit index, and subscribes to their deletion. Not read in detail.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function Dischargeable:dischargeTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Removes a deleted object from the discharge trigger's list.
---@param object any
function Dischargeable:onDeleteDischargeTriggerObject(object) end

--- Activation trigger callback: tracks the objects present to keep the vehicle active. Not read in detail.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function Dischargeable:dischargeActivationTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Removes a deleted object from the activation trigger's list.
---@param object any
function Dischargeable:onDeleteActivationTriggerObject(object) end

--- Forces a fill type for the compatibility test with targets (spec.forcedFillTypeIndex).
---@param fillTypeIndex any
function Dischargeable:setForcedFillTypeIndex(fillTypeIndex) end

--- Registers the TOGGLE_TIPSTATE_GROUND and TOGGLE_TIPSTATE actions (with priorities) if the current node allows them.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Dischargeable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- If a node's fill unit is empty, calls handleDischargeOnEmpty.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Dischargeable:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Stops discharging if stopDischargeOnDeactivate.
function Dischargeable:onDeactivate() end

--- On unpowered engine stop (VehicleStateChange.MOTOR_TURN_OFF and vehicle not powered), stops discharging if stopDischargeOnDeactivate.
---@param state any
---@param data any
function Dischargeable:onStateChange(state, data) end

--- Adds debug values (for example effect active, ready to discharge) to the vehicle's debug display.
---@param values any
function Dischargeable:updateDebugValues(values) end

--- Input callback: starts or stops ground emptying, checking feasibility, terrain access and location, otherwise shows a warning.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Dischargeable.actionEventToggleDischargeToGround(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: starts or stops emptying into an object, with a warning if the target refuses.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Dischargeable.actionEventToggleDischarging(self, actionName, inputValue, callbackState, isAnalog) end

--- Updates the text and visibility of the discharge actions (start transfer, empty on ground, stop).
---@param self any
function Dischargeable.updateActionEvents(self) end

--- Reads the dashboard attribute #dischargeNodeIndex for the activeDischargeNode value.
---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param isActive any
function Dischargeable.dashboardDischargeAttributes(self, xmlFile, key, dashboard, isActive) end
