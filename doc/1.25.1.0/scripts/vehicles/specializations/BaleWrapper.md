# vehicles/specializations/BaleWrapper.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BaleWrapper.md)*

Source: `dataS/scripts/vehicles/specializations/BaleWrapper.lua` — FS25 1.25.1.0

✍ Specialization for bale wrappers (round and square, including combined baler-wrappers). A server-driven state machine grabs a bale in a trigger, moves it to the wrapper, wraps it using animations, rotation curves and foil clips while consuming wrap film (Consumable), then drops it. Requires AnimatedVehicle and Consumable. State changes are broadcast with BaleWrapperStateEvent, and late joiners are brought up to date via onReadStream/onWriteStream. Configured under vehicle.baleWrapper (roundBaleWrapper, squareBaleWrapper, grabber, automaticDrop, wrapping animation and color configurations).

- **BaleWrapper** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleWrapper.prerequisitesPresent(specializations: table) → boolean` | 50 | ✍ Returns true only if the vehicle type has both AnimatedVehicle and Consumable. |
| `BaleWrapper.initSpecialization()` | 56 | ✍ Registers the wrappingColor and wrappingAnimation vehicle configuration types, the two store spec entries for round and square bale sizes, and the whole vehicle.baleWrapper XML schema including the wrapping animation configurations. |
| `BaleWrapper.registerWrapperXMLPaths(schema: any, basePath: any)` | 97 | ✍ Registers the XML keys of one wrapper block (round or square) at the given base path: nodes, bale types, animations, curves, wrap nodes, drop and block areas, foil animation and sounds. |
| `BaleWrapper.registerWrapperAnimationXMLPaths(schema: any, basePath: any, name: any)` | 193 | ✍ Registers the animName, animSpeed, reverseAfterMove and resetOnStart attributes for one named wrapper animation under the given path. |
| `BaleWrapper.registerWrapperFoilAnimationXMLPaths(schema: any, basePath: any)` | 202 | ✍ Registers the wrappingFoilAnimation XML keys (reference node and axis, min/max rotation, clip node and clip name). |
| `BaleWrapper.registerFunctions(vehicleType: any)` | 213 | ✍ Registers the wrapper loading functions, the grabber trigger callback, wrappability and drop checks, state change handling, bale type selection and the automatic drop and drop animation setters on the vehicle type. |
| `BaleWrapper.registerOverwrittenFunctions(vehicleType: any)` | 243 | ✍ Overrides getIsFoldAllowed, getCanBeSelected, getShowConsumableEmptyWarning, getRequiresPower, getStandaloneMotorTargetRpm, getStandaloneMotorLoad, addToPhysics and removeFromPhysics. |
| `BaleWrapper.registerEventListeners(vehicleType: any)` | 256 | ✍ Registers load, post-load, network stream, update, draw, action event, deactivate, fold state and consumable variation listeners. |
| `BaleWrapper:onLoad(savegame: table)` | 276 | ✍ Loads the round and square wrapper definitions, picks the initial wrapper type, creates the grab trigger (a missing triggerNode only logs an XML warning, though it is required) and initialises state, automatic drop settings and warning texts. |
| `BaleWrapper:onPostLoad(savegame: any)` | 352 | ✍ If a savegame holds a wrapped bale, reads its file name, wrapper time and attributes into a pending baleToLoad entry, restored later in onLoadFinished. |
| `BaleWrapper:loadWrapperFromXML(wrapper: any, xmlFile: any, baseKey: any, wrapperName: any)` | 373 | ✍ Loads one wrapper block: animations, bale and wrapper nodes, wrapping time, allowed bale types (size, textures, drop animations, wrap usage), curves, wrap nodes, drop and block areas, unload text and, on clients, wrap/start/stop sounds. Many deprecated FS19/FS22 attributes only trigger warnings. |
| `BaleWrapper:loadWrapperAnimationsFromXML(target: any, xmlFile: any, baseKey: any, configKey: any, animationsKey: any, parentAnimations: any)` | 511 | ✍ Loads the named animations (name, speed, reverseAfterMove, resetOnStart) into target.animations, falling back to a parent animation table through a metatable. A configuration key overrides the base key when present. |
| `BaleWrapper:loadWrapperAnimCurveFromXML(target: any, xmlFile: any, baseKey: any)` | 544 | ✍ Builds the animation curve of keyframes giving bale rotation and wrapper rotation over wrapping time, stopping at the first key without baleRot. |
| `BaleWrapper:loadWrapperAnimNodesFromXML(target: any, xmlFile: any, baseKey: any)` | 562 | ✍ Loads wrapAnimNodes: per node curves of translation, rotation and scale driven either by wrapper rotation or by wrapping time, with optional repeat and rotation normalisation on bale drop. |
| `BaleWrapper:loadWrapperWrapNodesFromXML(target: any, xmlFile: any, baseKey: any)` | 608 | ✍ Loads wrapNodes: nodes whose visibility depends on wrapping or empty state, with an optional maximum wrapper rotation. |
| `BaleWrapper:loadWrapperStateCurveFromXML(target: any, xmlFile: any, baseKey: any)` | 626 | ✍ Builds an optional curve mapping progress to the wrapping state applied to the bale. Sets it to nil if no key is defined. |
| `BaleWrapper:loadWrapperAnimationNodesFromXML(target: any, xmlFile: any, baseKey: any, animTime: any)` | 642 | ✍ Loads wrappingAnimationNodes: timed keys that move or re-link nodes (such as film pieces) as a reference node rotates, and places those at time 0 in their start position. |
| `BaleWrapper:loadWrapperFoilAnimationFromXML(target: any, xmlFile: any, baseKey: any, isDefault: any)` | 704 | ✍ Loads the foil animation: reference node and rotation range plus a clip on a clip node. Warns when the clip node, clip name or clip is missing. For the default animation it resets the clip track to time 0. |
| `BaleWrapper:onLoadFinished(savegame: table)` | 753 | ✍ Restores a bale saved in the savegame: creates and registers it, replays grab, drop-at-grabber and wrapping start state changes and resumes the wrapping animation at the saved time, or finishes wrapping if complete. |
| `BaleWrapper:onDelete()` | 798 | ✍ Detaches the bale being handled (kept and sellable again, or deleted when the vehicle is being reconfigured on the server), removes the grab trigger and deletes the wrapper sound samples. |
| `BaleWrapper:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 848 | ✍ Saves the current wrapping time and, if a bale is held by the grabber or wrapper, that bale under the .bale key of the vehicle entry. |
| `BaleWrapper:onReadStream(streamId: integer, connection: Connection)` | 870 | ✍ Client side initial sync: reads wrapper type, bale type and state, then replays the state changes and animations needed to reach that state. Note: the MOVING_GRABBER_TO_WORK branch writes self.baleGrabber.currentBale instead of spec.baleGrabber.currentBale, likely a bug. |
| `BaleWrapper:onWriteStream(streamId: integer, connection: Connection)` | 949 | ✍ Server side counterpart: writes wrapper type, bale type index, state, the bale object id when relevant and the elapsed wrapping time while wrapping. |
| `BaleWrapper:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 977 | ✍ Mounts a pending bale once it exists. While wrapping, consumes film, advances the wrapping time with dt, calls updateWrappingState, keeps the vehicle active and switches the wrap/stop sounds on clients. |
| `BaleWrapper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1041 | ✍ Looks for a bale to grab (server picks it up, client may show an unsupported-bale warning). On the server it advances the state machine when the current animation ends by broadcasting BaleWrapperStateEvent. Handles automatic drop and refreshes action events. |
| `BaleWrapper:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 1121 | ✍ Client only: shows a blinking warning for an unsupported bale or a blocked drop area. |
| `BaleWrapper:baleGrabberTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 1140 | ✍ Trigger callback that counts Bale objects entering and leaving the grab trigger, reacting only to dynamic rigid bodies. |
| `BaleWrapper:allowsGrabbingBale() → boolean` | 1164 | ✍ Returns true when the machine is idle, no saved bale is pending and the fold animation time lies within the allowed fold limits. |
| `BaleWrapper:updateWrapNodes(isWrapping: boolean, isEmpty: boolean, t: number, wrapperRot: number)` | 1186 | ✍ Shows or hides wrap nodes according to wrapping and empty state, and updates wrapAnimNodes transforms from wrapping time or wrapper rotation. When not wrapping and not empty, normalises their rotation if configured. |
| `BaleWrapper:updateWrappingState(wrappingTime: number, noEventSend: boolean)` | 1244 | ✍ Applies wrapping progress: drives the foil clip, relinks timed animation nodes, rotates bale and wrapper nodes from the curve, sets the bale wrapping state and color, updates wrap nodes, and on the server ends wrapping at the finish. Note: it reads an undefined variable v for wrapperRot, so that line looks like a bug. |
| `BaleWrapper:playMoveToWrapper(bale: table)` | 1364 | ✍ Selects the wrapper and bale type matching the grabbed bale, then plays the moveToWrapper animation if defined. |
| `BaleWrapper:setBaleWrapperType(isRoundBaleWrapper: boolean, baleTypeIndex: integer)` | 1379 | ✍ Switches between round and square wrapper and selects a bale type: applies its animations, foil animation and object changes, resets the foil clip and requests an action event update. |
| `BaleWrapper:getMatchingBaleTypeIndex(baleTypes: table, bale: table)` | 1409 | ✍ Returns the index of the first bale type whose size matches the bale, or 1 if none matches. |
| `BaleWrapper:doStateChange(id: integer, nearestBaleServerId: integer)` | 1423 | ✍ Applies one state machine transition on every machine (grab, drop at grabber, wrapping start, wrapping finished, start drop, bale dropped, platform reset, empty button). Handles mounting, animations, sounds, farm stats and the WrappedBales achievement. Skips wrapping when the bale cannot or need not be wrapped. |
| `BaleWrapper:getIsBaleWrappable(bale: table) → table` | 1625 | ✍ Checks the bale against the allowed bale types. Returns wrappable, size-matches and the matching type index; wrappable only if the bale supports wrapping, is not fully wrapped and the type is not skipWrapping. |
| `BaleWrapper:getIsBaleDropAllowed() → boolean, string` | 1650 | ✍ Tests the drop area box for overlapping objects. Returns true, or false with the blocked-area warning text when something other than the carried bale is in the way. |
| `BaleWrapper:onBaleWrapperDropOverlapCallback(nodeId: any)` | 1671 | ✍ Overlap callback for the drop area: flags a blocking object and records the time, ignoring the vehicle itself and the bale being carried. |
| `BaleWrapper:getIsBaleWrappingAllowed() → boolean` | 1690 | ✍ Returns true if the block wrap area is free of other objects and wrap film is available in the consumable. |
| `BaleWrapper:onBaleWrapperBlockOverlapCallback(nodeId: any)` | 1711 | ✍ Overlap callback for the block wrap area: flags any object other than the vehicle and the carried bale. |
| `BaleWrapper:pickupWrapperBale(bale: table, baleTypeIndex: integer)` | 1730 | ✍ Server side. Sets the bale wrap textures from the bale type when it will be wrapped, removes it from the trigger list and broadcasts the grab state change. |
| `BaleWrapper.getBaleInRange(self: integer, refNode: integer, distance: number) → table, integer` | 1758 | ✍ Static helper looping over bales in the grab trigger and returning the wrappable bale, the nearest bale and its bale type index. Note: nearestDistance is reset to the starting distance each time, so the result is not strictly the nearest. |
| `BaleWrapper:setBaleWrapperAutomaticDrop(state: any, noEventSend: any)` | 1786 | ✍ Sets or toggles (if state is nil) automatic drop, refreshes action events and sends BaleWrapperAutomaticDropEvent unless noEventSend is set. |
| `BaleWrapper:setBaleWrapperDropAnimation(dropAnimationIndex: any)` | 1802 | ✍ Stores which drop animation index will be used for the next drop. |
| `BaleWrapper:getIsFoldAllowed(superFunc: boolean, direction: any, onAiTurnOn: boolean) → boolean` | 1811 | ✍ Refuses folding with a warning text while the wrapper is not idle, otherwise defers to the parent. |
| `BaleWrapper:getCanBeSelected(superFunc: any)` | 1822 | ✍ Always returns true, so the vehicle can be selected even as a passive implement. |
| `BaleWrapper:getShowConsumableEmptyWarning(superFunc: any, typeName: any)` | 1828 | ✍ For the wrap film consumable, shows the empty warning only when the machine is busy and the parent agrees; other types use the parent. |
| `BaleWrapper:getRequiresPower(superFunc: any)` | 1838 | ✍ Returns true whenever the wrapper is not idle, otherwise the parent result. |
| `BaleWrapper:getStandaloneMotorTargetRpm(superFunc: any)` | 1849 | ✍ Returns the larger of the parent value and a factor: 1 while wrapping, 0.5 in other active states, 0 when idle or finished. |
| `BaleWrapper:getStandaloneMotorLoad(superFunc: any)` | 1865 | ✍ Adds one load entry to the parent values: 1 while wrapping, 0.5 in other active states, 0 otherwise. Returns the load sum and count. |
| `BaleWrapper:addToPhysics(superFunc: any) → boolean` | 1887 | ✍ Calls the parent, then re-adds to physics and re-mounts the bale held by the grabber and by the wrapper. Returns false if the parent fails. |
| `BaleWrapper:removeFromPhysics(superFunc: any) → boolean` | 1914 | ✍ Calls the parent, then unmounts and removes from physics the bale on the wrapper. Returns false if the parent fails. |
| `BaleWrapper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1934 | ✍ Client only: registers the unload action (IMPLEMENT_EXTRA3), optional per-drop-animation actions and the automatic drop toggle (IMPLEMENT_EXTRA4) when the vehicle is active for input. |
| `BaleWrapper:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 1969 | ✍ Registers the external action events baleWrapperDrop, baleWrapperAutomaticDrop (only if toggleable) and baleWrapperWarnings for triggers outside the vehicle. |
| `BaleWrapper:onDeactivate()` | 1984 | ✍ Clears the invalid bale warning and stops the wrap, start and stop sounds on clients. |
| `BaleWrapper:onFoldStateChanged(direction: any, moveToMiddle: any)` | 1996 | ✍ When the fold direction changes and a bale type is flagged forceWhileFolding, switches back to that wrapper and bale type. |
| `BaleWrapper:onConsumableVariationChanged(variationIndex: any, metaData: any)` | 2007 | ✍ Stores the wrapping film color from the consumable variation metadata, if any, for tinting bales. |
| `BaleWrapper.actionEventEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2018 | ✍ Input callback for the unload action: if wrapping is finished and drop is allowed, sends BaleWrapperStateEvent (CHANGE_BUTTON_EMPTY) to the server, otherwise shows the blocking warning. |
| `BaleWrapper.actionEventToggleAutomaticDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2032 | ✍ Input callback that toggles automatic drop. |
| `BaleWrapper.actionEventDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2038 | ✍ Input callback for a drop-animation action: when wrapping is finished, sends BaleWrapperDropEvent to the server with the callback state. |
| `BaleWrapper.updateActionEvents(self: any)` | 2047 | ✍ Activates the unload and drop-animation actions only in the finished state, and refreshes the unload and automatic drop texts. |
| `BaleWrapper.externalActionEventUnloadRegister(data: any, vehicle: any)` | 2076 | ✍ Registers the unload input for an external trigger; it runs the unload callback only when automatic drop is off. |
| `BaleWrapper.externalActionEventUnloadUpdate(data: any, vehicle: any)` | 2093 | ✍ Enables the external unload action only in the finished state. |
| `BaleWrapper.externalActionEventAutomaticUnloadRegister(data: any, vehicle: any)` | 2100 | ✍ Registers the external input that toggles automatic drop. |
| `BaleWrapper.externalActionEventAutomaticUnloadUpdate(data: any, vehicle: any)` | 2112 | ✍ Updates the external toggle text according to the automatic drop state. |
| `BaleWrapper.externalActionEventWarningsRegister(data: any, vehicle: any)` | 2119 | ✍ Empty register callback for the external warnings entry. |
| `BaleWrapper.externalActionEventWarningsUpdate(data: any, vehicle: any)` | 2124 | ✍ Shows the blocked-drop warning (automatic drop, within 500 ms of the last overlap) or the unsupported-bale warning for external triggers. |
| `BaleWrapper.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleWrapper: any)` | 2137 | ✍ Store spec loader: reads the min and max diameter and length of the non-skipped bale types of one wrapper kind. Returns a table, or nil if there is none. |
| `BaleWrapper.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleWrapper: any)` | 2166 | ✍ Store spec getter: returns the bale size in cm as text (single value or range), or as numbers and unit when returnValues is set. Round wrappers use diameter, square ones length. Empty values if none. |
| `BaleWrapper.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 2202 | ✍ Store spec loader for round bale size, calls loadSpecValueBaleSize with the round flag. |
| `BaleWrapper.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 2208 | ✍ Store spec loader for square bale size, calls loadSpecValueBaleSize with the square flag. |
| `BaleWrapper.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2214 | ✍ Store getter for round bale size, nil when the store item has no such spec. |
| `BaleWrapper.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2224 | ✍ Store getter for square bale size, nil when the store item has no such spec. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadWrapperFromXML` | 214 |
| registerFunction | `loadWrapperAnimationsFromXML` | 215 |
| registerFunction | `loadWrapperAnimCurveFromXML` | 216 |
| registerFunction | `loadWrapperAnimNodesFromXML` | 217 |
| registerFunction | `loadWrapperWrapNodesFromXML` | 218 |
| registerFunction | `loadWrapperStateCurveFromXML` | 219 |
| registerFunction | `loadWrapperAnimationNodesFromXML` | 220 |
| registerFunction | `loadWrapperFoilAnimationFromXML` | 221 |
| registerFunction | `baleGrabberTriggerCallback` | 223 |
| registerFunction | `allowsGrabbingBale` | 224 |
| registerFunction | `pickupWrapperBale` | 225 |
| registerFunction | `getIsBaleWrappable` | 226 |
| registerFunction | `getIsBaleDropAllowed` | 227 |
| registerFunction | `onBaleWrapperDropOverlapCallback` | 228 |
| registerFunction | `getIsBaleWrappingAllowed` | 229 |
| registerFunction | `onBaleWrapperBlockOverlapCallback` | 230 |
| registerFunction | `updateWrappingState` | 231 |
| registerFunction | `doStateChange` | 232 |
| registerFunction | `updateWrapNodes` | 233 |
| registerFunction | `playMoveToWrapper` | 234 |
| registerFunction | `setBaleWrapperType` | 235 |
| registerFunction | `getMatchingBaleTypeIndex` | 236 |
| registerFunction | `setBaleWrapperAutomaticDrop` | 237 |
| registerFunction | `setBaleWrapperDropAnimation` | 238 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 244 |
| registerOverwrittenFunction | `getCanBeSelected` | 245 |
| registerOverwrittenFunction | `getShowConsumableEmptyWarning` | 246 |
| registerOverwrittenFunction | `getRequiresPower` | 247 |
| registerOverwrittenFunction | `getStandaloneMotorTargetRpm` | 248 |
| registerOverwrittenFunction | `getStandaloneMotorLoad` | 249 |
| registerOverwrittenFunction | `addToPhysics` | 250 |
| registerOverwrittenFunction | `removeFromPhysics` | 251 |
| registerEventListener | `onLoad` | 257 |
| registerEventListener | `onPostLoad` | 258 |
| registerEventListener | `onLoadFinished` | 259 |
| registerEventListener | `onDelete` | 260 |
| registerEventListener | `onReadStream` | 261 |
| registerEventListener | `onWriteStream` | 262 |
| registerEventListener | `onUpdate` | 263 |
| registerEventListener | `onUpdateTick` | 264 |
| registerEventListener | `onDraw` | 265 |
| registerEventListener | `onRegisterActionEvents` | 266 |
| registerEventListener | `onRegisterExternalActionEvents` | 267 |
| registerEventListener | `onDeactivate` | 268 |
| registerEventListener | `onFoldStateChanged` | 269 |
| registerEventListener | `onConsumableVariationChanged` | 270 |
