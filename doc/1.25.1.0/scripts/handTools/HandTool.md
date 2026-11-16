# handTools/HandTool.lua

*[Version française](../../fr/scripts/handTools/HandTool.md)*

Source: `dataS/scripts/handTools/HandTool.lua` — FS25 1.25.1.0

✍ Base class of every hand tool instance (child of `Object`). It runs an asynchronous, specialization-based loading pipeline (i3d, XML `handTool.base`, specialization events onPreLoad to onLoadFinished), tracks holder, carrying player and held state, mounts the tool on the player hand node or camera node, saves and syncs state over the network, and computes age-based price. Specialization events are raised with `SpecializationUtil.raiseEvent`. Some helpers it calls (`loadCallback`, `registerActionEvents`, `getHolder`, `setHolder`, `loadHandToolOnClient`, `setCanBeDropped`) are not defined in this file (UNVERIFIED).

- **HandTool** inherits from `Object` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandTool.init()` | 26 | ✍ Calls the `init` function of every registered hand tool specialization that defines one. |
| `HandTool.postInit()` | 41 | ✍ Empty hook for post-initialization; does nothing. |
| `HandTool.registerXMLPaths()` | 46 | ✍ Creates the `handTool` XML schema (plus a `sounds` sub-schema), registers it for the hand tool store species and type manager, and declares the `handTool.base` keys (crouch, held, save, drop, speed and jump multipliers, texts, i3d filename, graphics, hand and first person nodes, carried node, mass) and the `type` attribute. Then lets each specialization register its own paths. |
| `HandTool.registerSavegameXMLPaths(savegameXMLSchema: XMLSchema)` | 103 | ✍ Declares the savegame keys under `handTools.handTool(?)`: filename, modName, uniqueId, farmId, age, price and last holder id, then the specializations' own savegame paths. |
| `HandTool.registerEvents(handToolType: table)` | 155 | ✍ Registers the specialization events of a hand tool type, from onPreLoad, onLoad and onDelete to the update, held, holder-changed and carrying-player events and onDebugDraw. |
| `HandTool.new(isServer: boolean, isClient: boolean, customMt: table?) → HandTool` | 195 | ✍ Creates a hand tool object with default state: not loaded, loading state OK, step CREATED, no holder, no carrying player, not held, mass 0. |
| `HandTool:setFilename(filename: any)` | 230 | ✍ Stores the XML config filename, its clean form, and the mod name and base directory derived from the path. |
| `HandTool:setType(typeDef: any)` | 239 | ✍ Initializes the tool's specializations from the given type definition through `SpecializationUtil.initSpecializationsIntoTypeClass`. |
| `HandTool:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 245 | ✍ Stores the callback function, target and arguments to call when loading ends. |
| `HandTool:i3dFileLoaded(i3dNode: any, failedReason: any, arguments: any, i3dLoadingId: any)` | 327 | ✍ Callback of the i3d load: on failure sets the ERROR state, logs and calls the load callback; otherwise keeps the node hidden and continues with `loadFinished`. |
| `HandTool:loadFinished()` | 343 | ✍ Main load step after the i3d is available: sets owner farm, mass, unique id and farm from the savegame, price (store default if 0), texts, root node, components and i3d mappings, then reads the `handTool.base` values (graphical, hand and first person nodes, multipliers with jump clamped to 0 to 1.2, crouch, held, save and drop flags). Raises onLoad and onPostLoad, reads age and price from the savegame, subscribes to `PERIOD_CHANGED`, then finishes or waits for sub-loading tasks. Errors abort via the load callback. |
| `HandTool:onFinishedLoading()` | 468 | ✍ Final load step: raises onLoadFinished, marks the tool synchronized on the server, adds it to `handToolSystem` (error and callback on failure), registers it if requested, prepares the initial holder (loading data or savegame unique id), adds it to owned items, frees the XML file and calls the load callback. |
| `HandTool:createLoadingTask(target: any) → table` | 525 | ✍ Creates and returns a loading task for the given target through `SpecializationUtil.createLoadingTask`; loading waits for all tasks. |
| `HandTool:finishLoadingTask(task: table)` | 532 | ✍ Marks a loading task as done via `SpecializationUtil.finishLoadingTask`; finishes loading when ready and no task remains. |
| `HandTool:setLoadingState(loadingState: any)` | 538 | ✍ Sets the loading state if it is a valid `HandToolLoadingState`; otherwise prints the call stack and logs an error. |
| `HandTool:setLoadingStep(loadingStep: SpecializationLoadStep)` | 550 | ✍ Sets the loading step through `SpecializationUtil.setLoadingStep`. |
| `HandTool:delete()` | 556 | ✍ Cleans up once: removes owned item, unsubscribes messages, clears the holder, releases the shared i3d, raises onDelete, deletes the root node, removes the tool from the system, deletes the sounds file and calls the parent delete. |
| `HandTool:writeStream(streamId: integer, connection: Connection)` | 601 | ✍ Server: after the parent data, writes the network config filename and the can-be-dropped flag, so the client can load the same tool. |
| `HandTool:readStream(streamId: integer, connection: Connection, objectId: integer)` | 613 | ✍ Client: reads filename and drop flag, refuses if loading already started, then starts a client-side load through `HandToolLoadingData` with a callback that tells the client the object finished async loading. |
| `HandTool:postWriteStream(streamId: integer, connection: table)` | 645 | ✍ Server, once the client has loaded the tool: writes whether it has a holder and, if so, the holder object and held flag, then raises onWriteStream. |
| `HandTool:postReadStream(streamId: integer, connection: table)` | 659 | ✍ Client: reads the pending holder object id and holding flag, then raises onReadStream and sets the step to SYNCHRONIZED. |
| `HandTool:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 676 | ✍ Server: only raises onWriteUpdateStream for specializations to write their data. |
| `HandTool:readUpdateStream(streamId: integer, timestamp: table, connection: table)` | 684 | ✍ Client: only raises onReadUpdateStream for specializations to read their data. |
| `HandTool:getNeedsSaving()` | 690 | ✍ Returns whether the tool is saved with the savegame (`canBeSaved`). |
| `HandTool:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 703 | ✍ Writes unique id, farm id (-1 if none), age and the holder unique id, then lets each specialization with `saveToXMLFile` write under its own sub-key. |
| `HandTool:getUniqueId() → string` | 724 | ✍ Returns the tool unique id. |
| `HandTool:setUniqueId(uniqueId: string)` | 731 | ✍ Sets the unique id; it should not change after the first assignment (only debug assertions check it). |
| `HandTool:register(alreadySent: any)` | 739 | ✍ Calls the parent register, then raises onRegistered. |
| `HandTool:getIsSynchronized() → boolean` | 748 | ✍ Returns true when the loading step is SYNCHRONIZED, meaning fully loaded and synchronized. |
| `HandTool:update(dt: number)` | 790 | ✍ Per-frame update: resolves pending holders (object, unique id, or direct), raises onPreUpdate, onUpdate and onPostUpdate, and keeps itself active while held by a controlled player. `dt` is in milliseconds. |
| `HandTool:updateTick(dt: any)` | 838 | ✍ Raises onUpdateTick with `dt`. |
| `HandTool:startHolding()` | 848 | ✍ Called when the player takes the tool in hand: may lock first or third person, sets held, attaches the tool, raises onHeldStart and re-registers the action events for the owning player. |
| `HandTool:stopHolding()` | 888 | ✍ Called when the tool is put away: restores the camera perspective if it was locked, clears held, detaches the tool, raises onHeldEnd and rebinds action events. |
| `HandTool:getIsCarried() → boolean` | 923 | ✍ Returns true if a player carries the tool (in inventory), whether or not it is held in hand. |
| `HandTool:setCarryingPlayer(player: Player)` | 930 | ✍ Sets the carrying player, raises onCarryingPlayerChanged with new and previous player, and re-registers action events if the player is the local owner. |
| `HandTool:getCarryingPlayer() → Player` | 946 | ✍ Returns the player carrying the tool, or nil. |
| `HandTool:periodChanged()` | 952 | ✍ Increments the tool age by one period (subscribed to `PERIOD_CHANGED`). |
| `HandTool:getPrice()` | 959 | ✍ Returns the tool's price. |
| `HandTool:getSellPrice() → number` | 966 | ✍ Returns the sell price from the store item, age and price via `HandTool.calculateSellPrice`. |
| `HandTool.calculateSellPrice(storeItem: any, age: any, price: any)` | 977 | ✍ Depreciation: age in years (`age / Environment.PERIODS_IN_YEAR`), factor = min(0.75 - 0.1 * ln(years), 0.8), result = max(price * factor, 3% of price). The `storeItem` argument is unused. Note: age 0 gives ln(0), so the factor goes to the 0.8 cap. |
| `HandTool:getIsHeld() → boolean` | 1000 | ✍ Returns true only if the tool is carried and currently held in hand. |
| `HandTool:setCarryingPlayerStyleChanged()` | 1040 | ✍ Called when the carrying player's model changes: reattaches the tool to the new model, then raises onCarryingPlayerStyleChanged. |
| `HandTool:attachTool()` | 1082 | ✍ If held, places the tool on the player camera (first person, forced mode) or on the hand, then makes the root node visible. |
| `HandTool:detachTool()` | 1104 | ✍ Hides and unlinks the root node; does nothing if there is no root node. |
| `HandTool:attachToolToHand()` | 1118 | ✍ Links the tool to the player's right or left third person hand node, aligned with the tool's `handNode`; without a hand node, links with zero offset and warns. Returns false and logs an error if the player model is invalid or the tool not held. |
| `HandTool:attachToolToCamera()` | 1156 | ✍ Links the tool to the carrying player's camera pitch node, aligned with `firstPersonNode`; without it, uses zero offset and warns. |
| `HandTool:clearActionEvents(clearCarriedActionEvents: boolean?)` | 1190 | ✍ Removes all of this tool's action events from the input binding in the player input context. Note: the parameter `clearCarriedActionEvents` is documented but never used. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreLoad` | 156 |
| registerEvent | `onLoad` | 157 |
| registerEvent | `onPostLoad` | 158 |
| registerEvent | `onLoadFinished` | 159 |
| registerEvent | `onDelete` | 160 |
| registerEvent | `onSave` | 161 |
| registerEvent | `onRegistered` | 162 |
| registerEvent | `onWriteStream` | 163 |
| registerEvent | `onReadStream` | 164 |
| registerEvent | `onWriteUpdateStream` | 165 |
| registerEvent | `onReadUpdateStream` | 166 |
| registerEvent | `onPreUpdate` | 167 |
| registerEvent | `onUpdate` | 168 |
| registerEvent | `onPostUpdate` | 169 |
| registerEvent | `onUpdateTick` | 170 |
| registerEvent | `onDraw` | 171 |
| registerEvent | `onRegisterActionEvents` | 173 |
| registerEvent | `onHandToolHolderChanged` | 174 |
| registerEvent | `onHeldStart` | 175 |
| registerEvent | `onHeldEnd` | 176 |
| registerEvent | `onCarryingPlayerStyleChanged` | 178 |
| registerEvent | `onCarryingPlayerShown` | 179 |
| registerEvent | `onCarryingPlayerHidden` | 180 |
| registerEvent | `onCarryingPlayerEnteredVehicle` | 181 |
| registerEvent | `onCarryingPlayerExitedVehicle` | 182 |
| registerEvent | `onCarryingPlayerChanged` | 183 |
| registerEvent | `onCarryingPlayerPerspectiveSwitched` | 184 |
| registerEvent | `onDebugDraw` | 186 |

## Messages

- subscribes `MessageType.PERIOD_CHANGED` (l.455)
