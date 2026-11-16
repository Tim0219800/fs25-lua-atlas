# vehicles/specializations/BaleLoader.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BaleLoader.md)*

Source: `dataS/scripts/vehicles/specializations/BaleLoader.lua` — FS25 1.25.1.0

✍ Specialization for automatic bale loaders (trailers that pick up bales with a grabber, stack them on a rotating platform and drop them in rows). It requires `FillUnit`: each loaded bale adds one unit to the fill level. Gameplay is a state machine driven by the server, which broadcasts `BaleLoaderStateEvent` with CHANGE_* ids that every machine replays through `doStateChange`, mostly by playing animations of `AnimatedVehicle`. Bales are attached either kinematically, rigidly or via dynamic joints (`dynamicMount`), can be glued together during unloading, and are saved in the vehicle savegame. Loads many `vehicle.baleLoader` XML keys (bale types with size ranges, bale places, animations, sounds, effects). Pickup uses a trigger and is limited by farm ownership and bale type.

- **BaleLoader** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleLoader.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true only if the vehicle type has the `FillUnit` specialization. |
| `BaleLoader.initSpecialization()` | 24 | ✍ Declares two shop spec types (round and square bale size) and registers the whole `vehicle.baleLoader` XML schema plus the savegame schema for state, bale type and each loaded bale. |
| `BaleLoader.registerAnimationXMLPaths(schema: any, basePath: any)` | 164 | ✍ Registers the animation name keys (platform, grabber, pusher, front platform, bale places, empty rotate, grippers) under a base path. Reused for the default config and for each bale type. |
| `BaleLoader.registerFunctions(vehicleType: any)` | 277 | ✍ Registers the bale loader's vehicle functions: XML loaders, bale joints, state changes, pickup, mount/unmount, folding animations, automatic unloading and unload triggers. |
| `BaleLoader.registerOverwrittenFunctions(vehicleType: any)` | 312 | ✍ Overrides selection, AI readiness, fold permission, PTO power and load, dynamic-mount fill info and physics add/remove so bales follow the vehicle. |
| `BaleLoader.registerEventListeners(vehicleType: any)` | 328 | ✍ Subscribes to load, stream, update, draw, input, activation, root vehicle change, fill level change, fold, baler unloading and animation value type events. |
| `BaleLoader:onLoad(savegame: table)` | 353 | ✍ Reads all `vehicle.baleLoader` settings: texts, automatic and dynamic mount options, grabber and its trigger (error if missing), effects and sounds (client), animations, bale places, bale types, folding animations, unloading mover and packer. Logs XML errors if bale types or places are missing. |
| `BaleLoader:onPostLoad(savegame: table)` | 668 | ✍ From the savegame, restores bale type, folding animation and work/transport position, then queues each saved bale (with place index, position and attributes) in a list for creation. Warns on corrupt entries. |
| `BaleLoader:onLoadFinished(savegame: table)` | 759 | ✍ After the vehicle is in physics, creates, registers and mounts each queued bale on its place (dynamically or by normal mount), flags it as not sellable and records its network id in the place. |
| `BaleLoader:onDelete()` | 787 | ✍ Unmounts all loaded and grabbed bales (making them sellable again, and deleting them if the vehicle is only being reconfigured), removes triggers and delete listeners, and frees animations, effects and sounds. |
| `BaleLoader:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 890 | ✍ Saves work position, bale type, folding animation and every bale with its place index (helper index for the start row). Unmounts the bale in the grabber so it is saved as an ordinary bale and flags it for remounting. |
| `BaleLoader:onReadStream(streamId: integer, connection: Connection)` | 955 | ✍ Client join: reads position state, directions, bale type, empty state, grabbed bale and bale ids per place (with quantised positions if not dynamic mount), schedules mounting, then replays the unloading sequence up to the received state. |
| `BaleLoader:onWriteStream(streamId: integer, connection: Connection)` | 1092 | ✍ Server join: writes the same state read by `onReadStream`. Bale positions are quantised on `numBitsPosition` bits and a warning is logged if one exceeds `maxPosition`. |
| `BaleLoader:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 1153 | ✍ Client side: reads the unloading mover flag and starts or stops its animation nodes and sound when it changes. |
| `BaleLoader:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 1175 | ✍ Server side: writes the unloading mover active flag when its dirty flag is set. |
| `BaleLoader.updateBalePlacesAnimations(self: any)` | 1187 | ✍ Puts the bale places and row animations in the position matching the current loading count, instantly. Triggers a platform rotation if the start row is full. |
| `BaleLoader:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1223 | ✍ Mounts bales whose objects have now arrived, stops grabber effects after their delay, and on any machine checks for a bale to pick up (server calls `pickupBale`, client may show a not-supported warning). The server also advances the state machine by broadcasting events when the matching animations end. |
| `BaleLoader:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1392 | ✍ Updates action event texts and visibility (client). Server: automatic unloading, joint removal after unloading, unloading mover shutdown, dynamic-mount joint interpolation and mass handling, delayed platform movement and push offset. Note: the check `useUnloadingMoverTrigger == nil` can never be true with default false, so animation-based joint release is only evaluated when that option is true. |
| `BaleLoader:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1669 | ✍ Shows a blinking warning when a bale is in range but not supported by the loader. |
| `BaleLoader.getBaleInRange(self: integer, refNode: integer, balesInTrigger: any) → table, integer` | 1681 | ✍ Returns the nearest valid bale in the trigger within pickup range, its matching bale type (nil if refused) and a warning text. Rejects bales already loaded, mounted elsewhere, of another type or fill type, unsupported, or owned by another farm (unless combined with a baler). |
| `BaleLoader:onActivate()` | 1778 | ✍ Starts the work animation nodes and work sound if the loader is in work position and not blocked. |
| `BaleLoader:onDeactivate()` | 1789 | ✍ Stops grabber effects, work animation nodes and the work sound. |
| `BaleLoader:onRootVehicleChanged(rootVehicle: table)` | 1799 | ✍ Registers (or re-parents) the `baleLoaderWorkstate` controlled action on the root vehicle's action controller, finished when in work position, with an AI listener for transport preparation. Removes it when there is no controller. |
| `BaleLoader.actionControllerEvent(self: any, direction: any)` | 1824 | ✍ Action controller callback: toggles between work and transport position when the requested direction differs from the current state and nothing is moving. Returns true if the toggle was requested. |
| `BaleLoader:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1837 | ✍ Refreshes the folding animation choice when the fill level of the loader's fill unit changes. |
| `BaleLoader:onFoldStateChanged(direction: any)` | 1846 | ✍ When `useFoldingState` is on, the server broadcasts a move-to-work or move-to-transport event according to the fold direction. |
| `BaleLoader:onBalerUnloadingStarted(balesToUnload: any)` | 1860 | ✍ With full automatic unloading, remembers how many more bales are coming from a connected baler so unloading waits for them. |
| `BaleLoader:onRegisterAnimationValueTypes()` | 1869 | ✍ Registers the `baleLoaderAnimationNodes` animation value type, which blocks or allows the work animation nodes and sound from an animated part. |
| `BaleLoader:loadBaleTypeFromXML(xmlFile: any, key: any, baleType: any)` | 1897 | ✍ Loads one bale type: size ranges (round: width and diameter; square: width, height, length, rounded to 2 decimals), mixed fill type flag, fill unit, object changes, bale places and animations. Returns false if animations fail. |
| `BaleLoader:loadBaleLoaderAnimationsFromXML(xmlFile: any, key: any, target: any, defaultTarget: any)` | 1947 | ✍ Reads all animation names and speeds into `target.animations`, falling back to the default target then to built-in names. Always returns true. |
| `BaleLoader:loadBalePlacesFromXML(xmlFile: any, key: any, target: any)` | 1999 | ✍ Reads the start bale place (counts its child nodes and stores their original transforms) and the list of bale place nodes. Returns true if both exist, meaning the places are shared by all bale types. |
| `BaleLoader:createBaleToBaleJoints(baleLines: any)` | 2050 | ✍ Builds physics joints between bales of the dropped rows (along rows and between rows at the start or end) according to the `dynamicBaleUnloading` settings, so the stack stays together until released. |
| `BaleLoader:createBaleToBaleJoint(bale1: any, bale2: any, x: any, y: any, z: any, rx: any, ry: any, rz: any, balePlaceIndex: any)` | 2102 | ✍ Creates one joint between two bales with the given translation and rotation limits, aligned on the bale place rotation, and keeps its index in the joint list. |
| `BaleLoader:doStateChange(id: integer, nearestBaleServerId: integer)` | 2138 | ✍ Central state machine. Applies a CHANGE_* id: grab bale, move grabber, drop bale on platform, rotate platform, move to work or transport, run the unloading steps, drop bales (optionally joint or packed) and handle button requests. Button cases are server only. |
| `BaleLoader.getAllowsStartUnloading(self: any) → boolean` | 2616 | ✍ Returns true when the loader holds bales and no platform, pusher, grabber or unloading step is currently in progress. |
| `BaleLoader.rotatePlatform(self: any)` | 2644 | ✍ Starts the platform rotation animation and, if needed, the animation that shifts the bale places. |
| `BaleLoader.moveToWorkPosition(self: boolean, onLoad: boolean)` | 2661 | ✍ Plays the folding animation toward work and opens the grippers. On load it runs at a very high speed to jump straight to the end. |
| `BaleLoader.moveToTransportPosition(self: any)` | 2679 | ✍ Plays the folding animation backwards and closes the grippers. |
| `BaleLoader:getBaleGrabberDropBaleAnimName() → string` | 2689 | ✍ Returns the drop-bale animation specific to the current start place count if it exists, otherwise the generic drop animation. |
| `BaleLoader:getIsBaleGrabbingAllowed() → string` | 2701 | ✍ Returns true only in work position with nothing moving, start row not full, free capacity and no unloading in progress. |
| `BaleLoader:pickupBale(nearestBale: table, nearestBaleType: table)` | 2743 | ✍ Server: records the pickup time, selects the bale type and broadcasts a grab-bale state event for the given bale. |
| `BaleLoader:setBaleLoaderBaleType(baleTypeIndex: integer, forceUpdate: boolean)` | 2756 | ✍ Switches to the bale type at the given index (or the first): updates animations, places, fill unit, HUD fill unit display and object changes. Does nothing if the type is unchanged. |
| `BaleLoader:getBaleTypeByBale(bale: any)` | 2801 | ✍ Returns the first bale type whose size ranges contain the bale's dimensions (diameter and width for round, width, height and length for square), or nil. |
| `BaleLoader:baleGrabberTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 2841 | ✍ Grabber trigger callback: counts the shapes of each `Bale` in the trigger (dynamic bodies on the server, kinematic ones on the client). |
| `BaleLoader:baleLoaderMoveTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 2874 | ✍ Unloading mover trigger callback: tracks dynamic bales inside it (with a delete listener) so the mover stays active while they remain. |
| `BaleLoader:mountDynamicBale(bale: any, node: any)` | 2901 | ✍ Server only: attaches a bale by a physics joint to a joint node under the given node, optionally interpolating its position, applying translation limits and lowering its mass. Reuses the joint if it exists. |
| `BaleLoader:unmountDynamicBale(bale: any)` | 2956 | ✍ Server only: detaches a dynamically mounted bale, deletes its joint node, clears interpolation entries, restores its mass and marks it saveable again. |
| `BaleLoader:mountBale(bale: any, object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any, noKinematicMounting: any)` | 2978 | ✍ Mounts a bale on a node with an offset, kinematically (collisions with the vehicle disabled) or by simple mount, and marks it not saveable. Removes it from the mover trigger list. |
| `BaleLoader:unmountBale(bale: any)` | 3003 | ✍ Unmounts a bale according to its mount type (simple or kinematic), re-enabling collisions in the kinematic case, and marks it saveable. |
| `BaleLoader:setBalePairCollision(bale: any, state: any)` | 3019 | ✍ Enables or disables collision between the bale and every vehicle component and every kinematically mounted bale. |
| `BaleLoader:getLoadedBales()` | 3033 | ✍ Returns a new table of all bale objects currently on bale places or on the start row. |
| `BaleLoader:startAutomaticBaleUnloading()` | 3060 | ✍ Flags automatic unloading as running and sends the empty-button event to the server via the client connection. |
| `BaleLoader:getIsAutomaticBaleUnloadingInProgress()` | 3073 | ✍ Returns whether an automatic unloading is in progress. |
| `BaleLoader:getIsAutomaticBaleUnloadingAllowed()` | 3079 | ✍ Returns true if no automatic unloading is running, the last pickup is older than 15 seconds and unloading can start. |
| `BaleLoader:playBaleLoaderFoldingAnimation(speed: any)` | 3097 | ✍ Plays the current folding animation at the given speed from its current time (negative speed folds back). |
| `BaleLoader:getIsBaleLoaderFoldingPlaying()` | 3104 | ✍ Returns whether the current folding animation is playing. |
| `BaleLoader:getCurrentFoldingAnimation()` | 3110 | ✍ Returns the folding animation name: the default one, or the last chosen one if several conditional animations are defined. |
| `BaleLoader:updateFoldingAnimation()` | 3122 | ✍ Chooses the folding animation matching bale type, fill level and bales on the start row, and copies the current animation time to the new one when it changes. |
| `BaleLoader:onBaleMoverBaleRemoved(bale: any)` | 3157 | ✍ Delete listener: removes a deleted bale from the unloading mover trigger list. |
| `BaleLoader.onBaleUnloadTriggerDeleted(self: any, unloadTrigger: any)` | 3164 | ✍ Delete listener: forgets an unload trigger that was deleted. |
| `BaleLoader:addBaleUnloadTrigger(unloadTrigger: any)` | 3173 | ✍ Registers an unload trigger (reference counted) with a delete listener and wakes the vehicle so it checks automatic unloading. |
| `BaleLoader:removeBaleUnloadTrigger(unloadTrigger: any)` | 3182 | ✍ Decrements the reference count of an unload trigger and drops it and its delete listener at zero. |
| `BaleLoader:getCanBeSelected(superFunc: any)` | 3194 | ✍ Override: always returns true, so the bale loader can be selected. |
| `BaleLoader:getAllowDynamicMountFillLevelInfo(superFunc: any)` | 3200 | ✍ Override: returns false when dynamic mount is enabled, otherwise the parent result. |
| `BaleLoader:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 3213 | ✍ Override: returns false while an automatic unloading is in progress, otherwise the parent result. |
| `BaleLoader:getIsAIReadyToDrive(superFunc: any)` | 3223 | ✍ Override: not ready for AI driving while in work position or while the grabber moves. |
| `BaleLoader:getIsAIPreparingToDrive(superFunc: any)` | 3234 | ✍ Override: returns true while the grabber is moving, otherwise the parent result. |
| `BaleLoader:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 3245 | ✍ Override: folding is refused while the loader still holds bales, otherwise the parent decides. |
| `BaleLoader:getDoConsumePtoPower(superFunc: any) → boolean` | 3257 | ✍ Override: true while `consumePtoPower` is on and the loader is in work position or moving; otherwise the parent result. |
| `BaleLoader:getConsumingLoad(superFunc: any)` | 3268 | ✍ Override: adds a full load (1) for one more consumer while in work position or moving with PTO consumption on, on top of the parent values. |
| `BaleLoader:getIsPowerTakeOffActive(superFunc: any)` | 3282 | ✍ Override: true while PTO consumption is on and the loader is in work position or moving; otherwise the parent result. |
| `BaleLoader:addToPhysics(superFunc: any) → boolean` | 3294 | ✍ Override: after the parent adds the vehicle, re-adds every loaded bale to physics and remounts it on its place. Returns false if the parent fails. |
| `BaleLoader:removeFromPhysics(superFunc: any) → boolean` | 3341 | ✍ Override: after the parent removes the vehicle, unmounts every loaded bale and removes it from physics. Returns false if the parent fails. |
| `BaleLoader:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 3382 | ✍ Client: registers the work/transport, unload and abort inputs (the first only without folding state, the others only without full automatic unloading). |
| `BaleLoader.actionEventEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3408 | ✍ Input callback: sends the empty-button event to the server if the minimum fill level is reached or unloading is running, otherwise shows a blinking warning. |
| `BaleLoader.actionEventAbortEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3419 | ✍ Input callback: sends the abort-unloading event to the server. |
| `BaleLoader.actionEventWorkTransport(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3425 | ✍ Input callback: sends the work/transport toggle event to the server. |
| `BaleLoader.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleLoader: any)` | 3431 | ✍ Scans the baleType entries of the XML root and collects min and max diameter and length for round or square loaders. Returns the table, or nil if nothing matches. |
| `BaleLoader.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleLoader: any)` | 3464 | ✍ Shop display of the supported bale size in cm (diameter for round, length for square), as a text or raw numbers with unit. Returns empty values if the spec is missing. |
| `BaleLoader.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 3500 | ✍ Shop loader for round bale sizes; delegates to `loadSpecValueBaleSize`. |
| `BaleLoader.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 3506 | ✍ Shop loader for square bale sizes; delegates to `loadSpecValueBaleSize`. |
| `BaleLoader.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3512 | ✍ Shop getter for round bale size, nil if the item has no such spec. |
| `BaleLoader.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3522 | ✍ Shop getter for square bale size, nil if the item has no such spec. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadBaleTypeFromXML` | 278 |
| registerFunction | `loadBalePlacesFromXML` | 279 |
| registerFunction | `loadBaleLoaderAnimationsFromXML` | 280 |
| registerFunction | `createBaleToBaleJoints` | 282 |
| registerFunction | `createBaleToBaleJoint` | 283 |
| registerFunction | `doStateChange` | 284 |
| registerFunction | `getBaleGrabberDropBaleAnimName` | 285 |
| registerFunction | `getIsBaleGrabbingAllowed` | 286 |
| registerFunction | `pickupBale` | 287 |
| registerFunction | `setBaleLoaderBaleType` | 288 |
| registerFunction | `getBaleTypeByBale` | 289 |
| registerFunction | `baleGrabberTriggerCallback` | 290 |
| registerFunction | `baleLoaderMoveTriggerCallback` | 291 |
| registerFunction | `mountDynamicBale` | 292 |
| registerFunction | `unmountDynamicBale` | 293 |
| registerFunction | `mountBale` | 294 |
| registerFunction | `unmountBale` | 295 |
| registerFunction | `setBalePairCollision` | 296 |
| registerFunction | `getLoadedBales` | 297 |
| registerFunction | `startAutomaticBaleUnloading` | 298 |
| registerFunction | `getIsAutomaticBaleUnloadingInProgress` | 299 |
| registerFunction | `getIsAutomaticBaleUnloadingAllowed` | 300 |
| registerFunction | `playBaleLoaderFoldingAnimation` | 301 |
| registerFunction | `getIsBaleLoaderFoldingPlaying` | 302 |
| registerFunction | `getCurrentFoldingAnimation` | 303 |
| registerFunction | `updateFoldingAnimation` | 304 |
| registerFunction | `onBaleMoverBaleRemoved` | 305 |
| registerFunction | `addBaleUnloadTrigger` | 306 |
| registerFunction | `removeBaleUnloadTrigger` | 307 |
| registerOverwrittenFunction | `getCanBeSelected` | 313 |
| registerOverwrittenFunction | `getAllowDynamicMountFillLevelInfo` | 314 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 315 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 316 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 317 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 318 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 319 |
| registerOverwrittenFunction | `getConsumingLoad` | 320 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 321 |
| registerOverwrittenFunction | `addToPhysics` | 322 |
| registerOverwrittenFunction | `removeFromPhysics` | 323 |
| registerEventListener | `onLoad` | 329 |
| registerEventListener | `onPostLoad` | 330 |
| registerEventListener | `onLoadFinished` | 331 |
| registerEventListener | `onDelete` | 332 |
| registerEventListener | `onReadUpdateStream` | 333 |
| registerEventListener | `onWriteUpdateStream` | 334 |
| registerEventListener | `onReadStream` | 335 |
| registerEventListener | `onWriteStream` | 336 |
| registerEventListener | `onUpdate` | 337 |
| registerEventListener | `onUpdateTick` | 338 |
| registerEventListener | `onDraw` | 339 |
| registerEventListener | `onRegisterActionEvents` | 340 |
| registerEventListener | `onActivate` | 341 |
| registerEventListener | `onDeactivate` | 342 |
| registerEventListener | `onRootVehicleChanged` | 343 |
| registerEventListener | `onFillUnitFillLevelChanged` | 344 |
| registerEventListener | `onFoldStateChanged` | 345 |
| registerEventListener | `onBalerUnloadingStarted` | 346 |
| registerEventListener | `onRegisterAnimationValueTypes` | 347 |
