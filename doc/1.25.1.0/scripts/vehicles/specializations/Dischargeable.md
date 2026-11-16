# vehicles/specializations/Dischargeable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Dischargeable.md)*

Source: `dataS/scripts/vehicles/specializations/Dischargeable.lua` — FS25 1.25.1.0

✍ Discharge specialization (spec_dischargeable): empties a fill unit of the vehicle (tipper, combine unloading auger, trailer) either into a receiving object (another vehicle, hopper, building) or onto the ground through the height density map. The vehicle can have several discharge nodes (dischargeNode), only one of which is current (setCurrentDischargeNodeIndex).

STATES. spec.currentDischargeState takes the values Dischargeable.DISCHARGE_STATE_OFF, _OBJECT and _GROUND (numeric values UNVERIFIED: constants defined in the file header, which is empty in the dump). Refusal reasons: DISCHARGE_REASON_* (unsupported fill type, unsupported tool, no access, no more room, etc.).

TARGET DETECTION. Two paths: (1) a physical trigger (dischargeNode.trigger, with addTrigger) that lists objects having a fill unit, picks the closest one based on the distance to the "exactFillRootNode" node and chooses the target object; (2) an asynchronous raycast (raycastAllAsync) from raycast#node downwards (or toward world -Y if useWorldNegYDirection), over maxDistance (10 by default), with the collision mask FILLABLE + VEHICLE + TERRAIN, whose result (finishDischargeRaycast) gives object, shape, distance, or terrain. The resulting distance is the drop distance used by the effects (see below).

AMOUNTS AND dt. Server side only, on every tick: liters to empty = min(level, emptySpeed * factor * dt) with dt in ms; emptySpeed is #emptySpeed (liters per second, defaulting to the unit capacity) divided by 1000 and multiplied by Platform.gameplay.dischargeSpeedFactor, hence liters per ms. Discharging only happens when the node's last effect is fully visible (lastEffect:getIsFullyVisible()). On the ground, dischargeToGround pours through DensityMapHeightUtil.tipToGroundAroundLine along a segment (width info#width, length info#length, height info#yOffset, 2.0 by default), with a cap on accumulated liters equal to emptySpeed*250 (i.e. 250 ms) or, if larger, the minimum valid value of the fill type (g_densityMapHeightManager:getMinValidLiterValue).

DISCHARGE EFFECTS (dust/flow). Effects are loaded by g_effectManager:loadEffect from dischargeNode.effects (schema EffectManager.registerEffectXMLPaths); the effect classes and EffectManager are ABSENT from the dump: their rendering is UNVERIFIED. The code shows: (a) the fill type is passed to the effects through g_effectManager:setEffectTypeInfo at start, so the look (material/color) may depend on the product through the effect class; (b) the drop distance is passed to every effect exposing setDistance(distance, g_terrainNode) (setDischargeEffectDistance), typically to lengthen or cut the stream down to the ground or the target; (c) shutdown is deferred: the effect only stops effectTurnOffThreshold after the last request (effectTurnOffThreshold, 0.25 by default; XML type TIME: if the default is not converted, it would be read in ms through the comparison with g_time; UNVERIFIED); (d) animations tied to the effects (effectAnimationNodes) start and stop with them. No reading of wind, moisture or dust appears in this file: the flow is not modulated by weather here.

NETWORK. The effect state is decided on the server (setDischargeEffectActive in the isServer block of onUpdateTick); it is sent to clients through the stream (dirty flag dirtyFlag) as: an "effect active" boolean, a distance quantized on 8 bits (value over maxDistance, 1 to 255) and the fill type (FillTypeManager.SEND_NUM_BITS). Clients then call setDischargeEffectActive(..., force) and setDischargeEffectDistance. The discharge state is transmitted by SetDischargeStateEvent. The discharge sound is handled client side (updateDischargeSound) with the sound shared per fill type (g_fillTypeManager:getSampleByFillType) cloned onto the node, plus a node-specific #dischargeSound; stopping is delayed by 250 ms.

EXTENSION POINTS. Events: onDischargeStateChanged, onDischargeTargetObjectChanged. Functions overridden here: getRequiresTipOcclusionArea, getCanBeSelected, getDoConsumePtoPower, getIsPowerTakeOffActive, getAllowLoadTriggerActivation. Functions designed to be overridden by other specializations (simple default value): getDischargeNodeEmptyFactor (1.0), getIsDischargeNodeActive (spec.isDischargeAllowed), getDischargeNodeAutomaticDischarge, handleDischargeNodeChanged (empty), handleDischarge, handleDischargeRaycast. Persistence: only #isAllowed is saved.

- **Dischargeable** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Dischargeable.prerequisitesPresent(specializations: any)` | 41 | ✍ Requires the FillUnit and FillVolume specializations. |
| `Dischargeable.initSpecialization()` | 47 | ✍ Declares the "dischargeable" configuration type, the XML schema (keys of a discharge node under vehicle.dischargeable and under each dischargeableConfiguration, activeDischargeNode and dischargeState dashboards with #dischargeNodeIndex) and the #isAllowed save key. |
| `Dischargeable.registerXMLPaths(schema: any, basePath: any)` | 67 | ✍ Registers the XML keys of a discharge node: node, fill unit, speeds, triggers, raycast, info (width, length, offsets), effects (EffectManager.registerEffectXMLPaths), effect animations, sounds, state/distance change objects, fill type converter, #effectTurnOffThreshold, etc. |
| `Dischargeable.registerFunctions(vehicleType: any)` | 135 | ✍ Registers the public discharge functions (state, target, effects, permission tests, raycast, nodes). |
| `Dischargeable.registerOverwrittenFunctions(vehicleType: any)` | 184 | ✍ Overrides five base functions: getRequiresTipOcclusionArea, getCanBeSelected, getDoConsumePtoPower, getIsPowerTakeOffActive, getAllowLoadTriggerActivation. |
| `Dischargeable.registerEvents(vehicleType: any)` | 194 | ✍ Declares the events onDischargeStateChanged and onDischargeTargetObjectChanged. |
| `Dischargeable.registerEventListeners(vehicleType: any)` | 201 | ✍ Subscribes the specialization to the lifecycle, the network, onUpdate / onUpdateTick, input actions, fill levels, deactivation and vehicle state change. |
| `Dischargeable:onLoad(savegame: any)` | 220 | ✍ Loads the configuration options (#requiresTipOcclusionArea, #consumePower, #stopDischargeOnDeactivate, all true by default) and each dischargeNode (loadDischargeNode), rejecting duplicate nodes, duplicate triggers and nonexistent fill units; builds the lookup tables, sets the raycast collision mask (FILLABLE + VEHICLE + TERRAIN), selects node 1 and reserves the dirty flag. With no valid node at all, removes the specialization's event listeners. |
| `Dischargeable:onPostLoad(savegame: any)` | 311 | ✍ Reads back the saved discharge "isAllowed" flag (unless vehicles are being reset). |
| `Dischargeable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 320 | ✍ Saves #isAllowed. |
| `Dischargeable:onRegisterDashboardValueTypes()` | 327 | ✍ Registers the dashboard values activeDischargeNode and dischargeState. |
| `Dischargeable:onDelete()` | 347 | ✍ Deletes the effects (g_effectManager:deleteEffects) and effect animations of each node, removes the discharge and activation triggers and clears their tracked objects. |
| `Dischargeable:onReadStream(streamId: any, connection: any)` | 391 | ✍ Client side on connection: for each node reads the effect state, the distance (8 bits, proportion of maxDistance) and the fill type, turns the effect on or off accordingly, then reads the discharge state. |
| `Dischargeable:onWriteStream(streamId: any, connection: any)` | 413 | ✍ Server side on connection: for each node writes the sent effect state, the distance (clamped to 1..255) and the discharge fill type, then the discharge state. |
| `Dischargeable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 430 | ✍ Client side: if the dirty flag is present, re-reads for each node the effect state, the distance and the fill type and applies them (forced). |
| `Dischargeable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 452 | ✍ Server side: if the dirty flag is raised, writes for each node the effect state, the quantized distance and the fill type. |
| `Dischargeable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 469 | ✍ Keeps the vehicle active as long as an object is in the activation trigger or a discharge is in progress (raiseActive). No dt used. |
| `Dischargeable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 482 | ✍ Main tick. Updates the input actions; if the node is active, determines the target (walks the trigger's objects choosing the closest with prioritized refusal reasons, or runs the asynchronous raycast), raises onDischargeTargetObjectChanged, updates the sound, then server side: starts automatic discharging if allowed, or, while discharging, computes the liters (emptySpeed, factor and dt), drives the effect (setDischargeEffectActive / setDischargeEffectDistance), calls discharge then handleDischarge, and raises the dirty flag if the distance changed by more than 0.05. Also turns off the effects of inactive nodes whose shutdown delay has elapsed and extends activity while sounds are playing. |
| `Dischargeable:loadDischargeNode(xmlFile: any, key: any, entry: any)` | 722 | ✍ Reads all the parameters of a node: #node and #fillUnitIndex (required), permission options (ground, object, vehicle, automatic, anywhere, mission), #emptySpeed, #effectTurnOffThreshold (0.25), tool type, info (width, length, offsets), trigger, raycast, max distance, activation trigger, fill converter, change objects (distance, state, active node), effects, animation, sounds and effect animations (client). Initializes the state (effect inactive, last effect = last in the list). |
| `Dischargeable:setCurrentDischargeNodeIndex(dischargeNodeIndex: any)` | 875 | ✍ Switches the current node: turns off the effect, sound and animations of the old node, activates the change objects of the new one, and updates the UI on the client. The end of the function was not read in detail. |
| `Dischargeable:getCurrentDischargeNode()` | 911 | ✍ Returns the current discharge node. |
| `Dischargeable:getCurrentDischargeNodeIndex()` | 918 | ✍ Returns the index of the current discharge node. |
| `Dischargeable:getDischargeTargetObject(dischargeNode: any)` | 929 | ✍ Returns the target object and the index of its fill unit for a node. |
| `Dischargeable:getCurrentDischargeObject(dischargeNode: any)` | 935 | ✍ Returns the object currently being fed by the discharge. |
| `Dischargeable:getRequiresTipOcclusionArea()` | 941 | ✍ Override: returns the #requiresTipOcclusionArea configuration option. |
| `Dischargeable:getCanBeSelected(superFunc: any)` | 948 | ✍ Override: always true. |
| `Dischargeable:getDoConsumePtoPower(superFunc: any)` | 954 | ✍ Override: true during a discharge if consumePower is set, otherwise the base result. |
| `Dischargeable:getIsPowerTakeOffActive(superFunc: any)` | 960 | ✍ Override: same condition as getDoConsumePtoPower. |
| `Dischargeable:getAllowLoadTriggerActivation(superFunc: any, rootVehicle: any)` | 966 | ✍ Override: allows activating a load trigger if the base result permits it, or by delegating to the object hit by the discharge (with a guard against looping on the root vehicle). |
| `Dischargeable:discharge(dischargeNode: any, emptyLiters: any)` | 990 | ✍ Empties emptyLiters into the target object (OBJECT state) or onto the terrain (GROUND state); returns the liters emptied and two minimum-drop booleans (useful on the ground). |
| `Dischargeable:dischargeToGround(dischargeNode: any, emptyLiters: any)` | 1014 | ✍ Empties onto the ground: accumulates liters in litersToDrop (capped at emptySpeed*250 or at the valid minimum), pours along a line through DensityMapHeightUtil.tipToGroundAroundLine, removes the liters actually deposited from the fill unit and handles the case of a remainder below the minimum drop. Applies the fill type converter's factor. |
| `Dischargeable:dischargeToObject(dischargeNode: any, emptyLiters: any, object: any, targetFillUnitIndex: any)` | 1066 | ✍ Empties into an object's fill unit if the fill type is supported and allowed, applies the conversion factor, then removes from the vehicle the quantity actually accepted. |
| `Dischargeable:setManualDischargeState(state: any, noEventSend: any)` | 1089 | ✍ State change triggered by a player action; delegates to setDischargeState. |
| `Dischargeable:setDischargeState(state: any, noEventSend: any)` | 1095 | ✍ Changes the discharge state: broadcasts SetDischargeStateEvent, turns off the effect server side when the state goes to OFF, starts/stops state animations and sounds client side, applies the state change objects, plays the node's animation (forward or backward) and raises onDischargeStateChanged. |
| `Dischargeable:getDischargeState()` | 1144 | ✍ Returns the current discharge state. |
| `Dischargeable:getDischargeFillType(dischargeNode: any)` | 1150 | ✍ Returns the discharged fill type and the conversion factor (1 without a converter); the converter may replace the type with another fill type. |
| `Dischargeable:getCanDischargeToGround(dischargeNode: any)` | 1167 | ✍ True if discharging is allowed, the terrain is hit and, if the tank is not empty, the fill type can be tipped on the ground (DensityMapHeightUtil.getCanTipToGround). |
| `Dischargeable:getCanDischargeToLand(dischargeNode: any)` | 1192 | ✍ True if discharging anywhere is allowed, or if both ends of the drop line belong to a parcel accessible to the active farm (or to a farm mission if canDischargeToMissionGround). |
| `Dischargeable:getCanDischargeAtPosition(dischargeNode: any)` | 1232 | ✍ If the tank is not empty and the state is OFF or GROUND, checks that there is still room to drop at least the valid minimum around the drop line (DensityMapHeightUtil.getCanTipToGroundAroundLine). |
| `Dischargeable:getCanDischargeToObject(dischargeNode: any)` | 1270 | ✍ True if a target object exists, supports and allows the fill type, has room, accepts the active farm and, for a dynamically mounted object, if the carrier's farm has access. |
| `Dischargeable:getDischargeNotAllowedWarning(dischargeNode: any)` | 1320 | ✍ Builds the warning text according to the refusal reason (or a custom text from the object) with the fill type title. |
| `Dischargeable:getCanToggleDischargeToObject()` | 1333 | ✍ True if the current node allows discharging to an object. |
| `Dischargeable:getCanToggleDischargeToGround()` | 1342 | ✍ True if the current node allows discharging to the ground and does not start it automatically. |
| `Dischargeable:getIsDischargeNodeActive(dischargeNode: any)` | 1361 | ✍ Returns spec.isDischargeAllowed (override point for other specializations). |
| `Dischargeable:getDischargeNodeEmptyFactor(dischargeNode: any)` | 1371 | ✍ Returns 1.0: emptying speed factor, an override point (for example to modulate the flow rate). |
| `Dischargeable:getDischargeNodeAutomaticDischarge(dischargeNode: any)` | 1377 | ✍ Returns the node's canStartDischargeAutomatically option. |
| `Dischargeable:getDischargeNodeByNode(node: any)` | 1383 | ✍ Returns the discharge node associated with an I3D node. |
| `Dischargeable:updateRaycast(dischargeNode: any)` | 1389 | ✍ Launches the node's asynchronous raycast (local downwards or toward world -Y, over maxDistance) after resetting the results; flags the raycast as active. |
| `Dischargeable:updateDischargeInfo(dischargeNode: any, x: any, y: any, z: any)` | 1431 | ✍ If info#useRaycastHitPosition is set, places the info node on the raycast hit point. |
| `Dischargeable:raycastCallbackDischargeNode(hitActorId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, hitShapeId: any, isLast: any)` | 1439 | ✍ Raycast callback: analyzes each hit (object with a fill unit, terrain or other), keeps the closest one and its refusal reasons, then concludes on the last hit with finishDischargeRaycast. Not read in detail. |
| `Dischargeable:finishDischargeRaycast()` | 1577 | ✍ Copies the raycast results into the node state, calls handleDischargeRaycast, releases the async flag and raises onDischargeTargetObjectChanged if the target changed. |
| `Dischargeable:getDischargeNodeByIndex(index: any)` | 1603 | ✍ Returns the discharge node at the given index. |
| `Dischargeable:handleDischargeOnEmpty(dischargeNode: any)` | 1610 | ✍ Stops the discharge (OFF state without a broadcast event) if the current node has stopDischargeOnEmpty. |
| `Dischargeable:handleDischargeNodeChanged()` | 1619 | ✍ Empty extension point called when the node changes. |
| `Dischargeable:handleDischarge(dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 1624 | ✍ After an emptying: if stopDischargeIfNotPossible is set and nothing was emptied (on the ground: and no minimum drop is pending), sets the state back to OFF. |
| `Dischargeable:handleDischargeRaycast(dischargeNode: any, object: any, shape: any, distance: any, illUnitIndex: any, hitTerrain: any)` | 1646 | ✍ Server side: stops discharging to an object if the ray no longer hits it and starts automatic ground discharging if allowed; applies the object changes according to the distance (threshold distanceObjectChangeThreshold, 0.5 by default). |
| `Dischargeable:handleFoundDischargeObject(dischargeNode: any)` | 1669 | ✍ When a target is found and automatic discharging is permitted, switches to the OBJECT state. |
| `Dischargeable:setDischargeEffectDistance(dischargeNode: any, distance: any)` | 1677 | ✍ If the node's effect is active and the distance is finite, calls effect:setDistance(distance, g_terrainNode) on each effect exposing it. The exact meaning on the effect side is UNVERIFIED (effect classes absent). |
| `Dischargeable:setDischargeEffectActive(dischargeNode: any, isActive: any, force: any, fillTypeIndex: any)` | 1691 | ✍ Starts or stops a node's effects and effect animations. On start: sets the fill type (g_effectManager:setEffectTypeInfo) then g_effectManager:startEffects. On non-forced stop: schedules the stop at g_time + effectTurnOffThreshold; forced: stops immediately (stopEffects). Server side raises the dirty flag when the state changes (for clients). |
| `Dischargeable:updateDischargeSound(dischargeNode: any, dt: any)` | 1732 | ✍ Client: plays the shared fill-type sound (cloned onto the node, replaced when the type changes) and the node's own sound while the effect is active or the last effect remains visible; delays the stop by 250 ms counted down with dt. |
| `Dischargeable:dischargeTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1795 | ✍ Discharge trigger callback: tracks objects (with a fill unit) entering or leaving, remembering shape and unit index, and subscribes to their deletion. Not read in detail. |
| `Dischargeable:onDeleteDischargeTriggerObject(object: any)` | 1845 | ✍ Removes a deleted object from the discharge trigger's list. |
| `Dischargeable:dischargeActivationTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1867 | ✍ Activation trigger callback: tracks the objects present to keep the vehicle active. Not read in detail. |
| `Dischargeable:onDeleteActivationTriggerObject(object: any)` | 1905 | ✍ Removes a deleted object from the activation trigger's list. |
| `Dischargeable:setForcedFillTypeIndex(fillTypeIndex: any)` | 1919 | ✍ Forces a fill type for the compatibility test with targets (spec.forcedFillTypeIndex). |
| `Dischargeable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1925 | ✍ Registers the TOGGLE_TIPSTATE_GROUND and TOGGLE_TIPSTATE actions (with priorities) if the current node allows them. |
| `Dischargeable:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1947 | ✍ If a node's fill unit is empty, calls handleDischargeOnEmpty. |
| `Dischargeable:onDeactivate()` | 1961 | ✍ Stops discharging if stopDischargeOnDeactivate. |
| `Dischargeable:onStateChange(state: any, data: any)` | 1972 | ✍ On unpowered engine stop (VehicleStateChange.MOTOR_TURN_OFF and vehicle not powered), stops discharging if stopDischargeOnDeactivate. |
| `Dischargeable:updateDebugValues(values: any)` | 1987 | ✍ Adds debug values (for example effect active, ready to discharge) to the vehicle's debug display. |
| `Dischargeable.actionEventToggleDischargeToGround(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2024 | ✍ Input callback: starts or stops ground emptying, checking feasibility, terrain access and location, otherwise shows a warning. |
| `Dischargeable.actionEventToggleDischarging(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2048 | ✍ Input callback: starts or stops emptying into an object, with a warning if the target refuses. |
| `Dischargeable.updateActionEvents(self: any)` | 2070 | ✍ Updates the text and visibility of the discharge actions (start transfer, empty on ground, stop). |
| `Dischargeable.dashboardDischargeAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 2113 | ✍ Reads the dashboard attribute #dischargeNodeIndex for the activeDischargeNode value. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadDischargeNode` | 136 |
| registerFunction | `setCurrentDischargeNodeIndex` | 137 |
| registerFunction | `getCurrentDischargeNode` | 138 |
| registerFunction | `getCurrentDischargeNodeIndex` | 139 |
| registerFunction | `getDischargeTargetObject` | 140 |
| registerFunction | `getCurrentDischargeObject` | 141 |
| registerFunction | `discharge` | 142 |
| registerFunction | `dischargeToGround` | 143 |
| registerFunction | `dischargeToObject` | 144 |
| registerFunction | `setManualDischargeState` | 145 |
| registerFunction | `setDischargeState` | 146 |
| registerFunction | `getDischargeState` | 147 |
| registerFunction | `getDischargeFillType` | 148 |
| registerFunction | `getCanDischargeToGround` | 149 |
| registerFunction | `getCanDischargeAtPosition` | 150 |
| registerFunction | `getCanDischargeToLand` | 151 |
| registerFunction | `getCanDischargeToObject` | 152 |
| registerFunction | `getDischargeNotAllowedWarning` | 153 |
| registerFunction | `getCanToggleDischargeToObject` | 154 |
| registerFunction | `getCanToggleDischargeToGround` | 155 |
| registerFunction | `getIsPossibleToDischargeToObject` | 156 |
| registerFunction | `getIsDischargeNodeActive` | 157 |
| registerFunction | `setIsDischargeAllowed` | 158 |
| registerFunction | `getDischargeNodeEmptyFactor` | 159 |
| registerFunction | `getDischargeNodeAutomaticDischarge` | 160 |
| registerFunction | `getDischargeNodeByNode` | 161 |
| registerFunction | `updateRaycast` | 162 |
| registerFunction | `updateDischargeInfo` | 163 |
| registerFunction | `raycastCallbackDischargeNode` | 164 |
| registerFunction | `finishDischargeRaycast` | 165 |
| registerFunction | `getDischargeNodeByIndex` | 166 |
| registerFunction | `handleDischargeOnEmpty` | 167 |
| registerFunction | `handleDischargeNodeChanged` | 168 |
| registerFunction | `handleDischarge` | 169 |
| registerFunction | `handleDischargeRaycast` | 170 |
| registerFunction | `handleFoundDischargeObject` | 171 |
| registerFunction | `setDischargeEffectDistance` | 172 |
| registerFunction | `setDischargeEffectActive` | 173 |
| registerFunction | `updateDischargeSound` | 174 |
| registerFunction | `dischargeTriggerCallback` | 175 |
| registerFunction | `onDeleteDischargeTriggerObject` | 176 |
| registerFunction | `dischargeActivationTriggerCallback` | 177 |
| registerFunction | `onDeleteActivationTriggerObject` | 178 |
| registerFunction | `setForcedFillTypeIndex` | 179 |
| registerOverwrittenFunction | `getRequiresTipOcclusionArea` | 185 |
| registerOverwrittenFunction | `getCanBeSelected` | 186 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 187 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 188 |
| registerOverwrittenFunction | `getAllowLoadTriggerActivation` | 189 |
| registerEvent | `onDischargeStateChanged` | 195 |
| registerEvent | `onDischargeTargetObjectChanged` | 196 |
| registerEventListener | `onLoad` | 202 |
| registerEventListener | `onPostLoad` | 203 |
| registerEventListener | `onRegisterDashboardValueTypes` | 204 |
| registerEventListener | `onDelete` | 205 |
| registerEventListener | `onReadStream` | 206 |
| registerEventListener | `onWriteStream` | 207 |
| registerEventListener | `onReadUpdateStream` | 208 |
| registerEventListener | `onWriteUpdateStream` | 209 |
| registerEventListener | `onUpdate` | 210 |
| registerEventListener | `onUpdateTick` | 211 |
| registerEventListener | `onRegisterActionEvents` | 212 |
| registerEventListener | `onFillUnitFillLevelChanged` | 213 |
| registerEventListener | `onDeactivate` | 214 |
| registerEventListener | `onStateChange` | 215 |
