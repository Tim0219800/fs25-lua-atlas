---@meta
-- FS25 1.25.1.0 : handTools/HandTool.lua (generated stub, FS25 Lua Atlas)

--- Base class of every hand tool instance (child of `Object`). It runs an asynchronous, specialization-based loading pipeline (i3d, XML `handTool.base`, specialization events onPreLoad to onLoadFinished), tracks holder, carrying player and held state, mounts the tool on the player hand node or camera node, saves and syncs state over the network, and computes age-based price. Specialization events are raised with `SpecializationUtil.raiseEvent`. Some helpers it calls (`loadCallback`, `registerActionEvents`, `getHolder`, `setHolder`, `loadHandToolOnClient`, `setCanBeDropped`) are not defined in this file (UNVERIFIED).
---@class HandTool : Object
HandTool = {}

--- Calls the `init` function of every registered hand tool specialization that defines one.
function HandTool.init() end

--- Empty hook for post-initialization; does nothing.
function HandTool.postInit() end

--- Creates the `handTool` XML schema (plus a `sounds` sub-schema), registers it for the hand tool store species and type manager, and declares the `handTool.base` keys (crouch, held, save, drop, speed and jump multipliers, texts, i3d filename, graphics, hand and first person nodes, carried node, mass) and the `type` attribute. Then lets each specialization register its own paths.
function HandTool.registerXMLPaths() end

--- Declares the savegame keys under `handTools.handTool(?)`: filename, modName, uniqueId, farmId, age, price and last holder id, then the specializations' own savegame paths.
---@param savegameXMLSchema XMLSchema
function HandTool.registerSavegameXMLPaths(savegameXMLSchema) end

--- Registers the specialization events of a hand tool type, from onPreLoad, onLoad and onDelete to the update, held, holder-changed and carrying-player events and onDebugDraw.
---@param handToolType table
function HandTool.registerEvents(handToolType) end

--- Creates a hand tool object with default state: not loaded, loading state OK, step CREATED, no holder, no carrying player, not held, mass 0.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return HandTool
function HandTool.new(isServer, isClient, customMt) end

--- Stores the XML config filename, its clean form, and the mod name and base directory derived from the path.
---@param filename any
function HandTool:setFilename(filename) end

--- Initializes the tool's specializations from the given type definition through `SpecializationUtil.initSpecializationsIntoTypeClass`.
---@param typeDef any
function HandTool:setType(typeDef) end

--- Stores the callback function, target and arguments to call when loading ends.
---@param loadCallbackFunction any
---@param loadCallbackFunctionTarget any
---@param loadCallbackFunctionArguments any
function HandTool:setLoadCallback(loadCallbackFunction, loadCallbackFunctionTarget, loadCallbackFunctionArguments) end

--- Callback of the i3d load: on failure sets the ERROR state, logs and calls the load callback; otherwise keeps the node hidden and continues with `loadFinished`.
---@param i3dNode any
---@param failedReason any
---@param arguments any
---@param i3dLoadingId any
function HandTool:i3dFileLoaded(i3dNode, failedReason, arguments, i3dLoadingId) end

--- Main load step after the i3d is available: sets owner farm, mass, unique id and farm from the savegame, price (store default if 0), texts, root node, components and i3d mappings, then reads the `handTool.base` values (graphical, hand and first person nodes, multipliers with jump clamped to 0 to 1.2, crouch, held, save and drop flags). Raises onLoad and onPostLoad, reads age and price from the savegame, subscribes to `PERIOD_CHANGED`, then finishes or waits for sub-loading tasks. Errors abort via the load callback.
function HandTool:loadFinished() end

--- Final load step: raises onLoadFinished, marks the tool synchronized on the server, adds it to `handToolSystem` (error and callback on failure), registers it if requested, prepares the initial holder (loading data or savegame unique id), adds it to owned items, frees the XML file and calls the load callback.
function HandTool:onFinishedLoading() end

--- Creates and returns a loading task for the given target through `SpecializationUtil.createLoadingTask`; loading waits for all tasks.
---@param target any
---@return table
function HandTool:createLoadingTask(target) end

--- Marks a loading task as done via `SpecializationUtil.finishLoadingTask`; finishes loading when ready and no task remains.
---@param task table
function HandTool:finishLoadingTask(task) end

--- Sets the loading state if it is a valid `HandToolLoadingState`; otherwise prints the call stack and logs an error.
---@param loadingState any
function HandTool:setLoadingState(loadingState) end

--- Sets the loading step through `SpecializationUtil.setLoadingStep`.
---@param loadingStep SpecializationLoadStep
function HandTool:setLoadingStep(loadingStep) end

--- Cleans up once: removes owned item, unsubscribes messages, clears the holder, releases the shared i3d, raises onDelete, deletes the root node, removes the tool from the system, deletes the sounds file and calls the parent delete.
function HandTool:delete() end

--- Server: after the parent data, writes the network config filename and the can-be-dropped flag, so the client can load the same tool.
---@param streamId integer
---@param connection Connection
function HandTool:writeStream(streamId, connection) end

--- Client: reads filename and drop flag, refuses if loading already started, then starts a client-side load through `HandToolLoadingData` with a callback that tells the client the object finished async loading.
---@param streamId integer
---@param connection Connection
---@param objectId integer
function HandTool:readStream(streamId, connection, objectId) end

--- Server, once the client has loaded the tool: writes whether it has a holder and, if so, the holder object and held flag, then raises onWriteStream.
---@param streamId integer
---@param connection table
function HandTool:postWriteStream(streamId, connection) end

--- Client: reads the pending holder object id and holding flag, then raises onReadStream and sets the step to SYNCHRONIZED.
---@param streamId integer
---@param connection table
function HandTool:postReadStream(streamId, connection) end

--- Server: only raises onWriteUpdateStream for specializations to write their data.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function HandTool:writeUpdateStream(streamId, connection, dirtyMask) end

--- Client: only raises onReadUpdateStream for specializations to read their data.
---@param streamId integer
---@param timestamp table
---@param connection table
function HandTool:readUpdateStream(streamId, timestamp, connection) end

--- Returns whether the tool is saved with the savegame (`canBeSaved`).
function HandTool:getNeedsSaving() end

--- Writes unique id, farm id (-1 if none), age and the holder unique id, then lets each specialization with `saveToXMLFile` write under its own sub-key.
---@param xmlFile XMLFile
---@param key string
---@param usedModNames table
function HandTool:saveToXMLFile(xmlFile, key, usedModNames) end

--- Returns the tool unique id.
---@return string
function HandTool:getUniqueId() end

--- Sets the unique id; it should not change after the first assignment (only debug assertions check it).
---@param uniqueId string
function HandTool:setUniqueId(uniqueId) end

--- Calls the parent register, then raises onRegistered.
---@param alreadySent any
function HandTool:register(alreadySent) end

--- Returns true when the loading step is SYNCHRONIZED, meaning fully loaded and synchronized.
---@return boolean
function HandTool:getIsSynchronized() end

--- Per-frame update: resolves pending holders (object, unique id, or direct), raises onPreUpdate, onUpdate and onPostUpdate, and keeps itself active while held by a controlled player. `dt` is in milliseconds.
---@param dt number
function HandTool:update(dt) end

--- Raises onUpdateTick with `dt`.
---@param dt any
function HandTool:updateTick(dt) end

--- Called when the player takes the tool in hand: may lock first or third person, sets held, attaches the tool, raises onHeldStart and re-registers the action events for the owning player.
function HandTool:startHolding() end

--- Called when the tool is put away: restores the camera perspective if it was locked, clears held, detaches the tool, raises onHeldEnd and rebinds action events.
function HandTool:stopHolding() end

--- Returns true if a player carries the tool (in inventory), whether or not it is held in hand.
---@return boolean
function HandTool:getIsCarried() end

--- Sets the carrying player, raises onCarryingPlayerChanged with new and previous player, and re-registers action events if the player is the local owner.
---@param player Player
function HandTool:setCarryingPlayer(player) end

--- Returns the player carrying the tool, or nil.
---@return Player
function HandTool:getCarryingPlayer() end

--- Increments the tool age by one period (subscribed to `PERIOD_CHANGED`).
function HandTool:periodChanged() end

--- Returns the tool's price.
function HandTool:getPrice() end

--- Returns the sell price from the store item, age and price via `HandTool.calculateSellPrice`.
---@return number
function HandTool:getSellPrice() end

--- Depreciation: age in years (`age / Environment.PERIODS_IN_YEAR`), factor = min(0.75 - 0.1 * ln(years), 0.8), result = max(price * factor, 3% of price). The `storeItem` argument is unused. Note: age 0 gives ln(0), so the factor goes to the 0.8 cap.
---@param storeItem any
---@param age any
---@param price any
function HandTool.calculateSellPrice(storeItem, age, price) end

--- Returns true only if the tool is carried and currently held in hand.
---@return boolean
function HandTool:getIsHeld() end

--- Called when the carrying player's model changes: reattaches the tool to the new model, then raises onCarryingPlayerStyleChanged.
function HandTool:setCarryingPlayerStyleChanged() end

--- If held, places the tool on the player camera (first person, forced mode) or on the hand, then makes the root node visible.
function HandTool:attachTool() end

--- Hides and unlinks the root node; does nothing if there is no root node.
function HandTool:detachTool() end

--- Links the tool to the player's right or left third person hand node, aligned with the tool's `handNode`; without a hand node, links with zero offset and warns. Returns false and logs an error if the player model is invalid or the tool not held.
function HandTool:attachToolToHand() end

--- Links the tool to the carrying player's camera pitch node, aligned with `firstPersonNode`; without it, uses zero offset and warns.
function HandTool:attachToolToCamera() end

--- Removes all of this tool's action events from the input binding in the player input context. Note: the parameter `clearCarriedActionEvents` is documented but never used.
---@param clearCarriedActionEvents boolean?
function HandTool:clearActionEvents(clearCarriedActionEvents) end
