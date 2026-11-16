---@meta
-- FS25 1.25.1.0 : handTools/HandToolHolder.lua (generated stub, FS25 Lua Atlas)

--- Networked object (child of `Object`) that can store one hand tool, for example a rack on a vehicle or building. It is loaded from `handToolHolder(?)` XML (holder type and node, dummy i3d, click boxes, activation trigger, optional spawned hand tool, take/store texts), registers itself in `g_currentMission.handToolSystem` and uses a `HandToolHolderActivatable` for the player prompt. If a spawned tool filename is set, only that tool can be stored.
---@class HandToolHolder : Object
HandToolHolder = {}

--- Declares the shared XML registration `HandToolHolder`: holder type, node and dummy filename, click box nodes, trigger node, spawned hand tool filename, and take and store texts.
---@param schema any
---@param basePath any
function HandToolHolder.registerXMLPaths(schema, basePath) end

--- Declares the savegame attribute `#uniqueId`.
---@param schema any
---@param basePath any
function HandToolHolder.registerSavegameXMLPaths(schema, basePath) end

--- Creates the holder object with its parent, an empty name, no hand tool and the player marked out of range.
---@param parent any
---@param isServer any
---@param isClient any
---@param customMt any
function HandToolHolder.new(parent, isServer, isClient, customMt) end

--- Reads the XML: holder type and node, optional dummy i3d (async shared load), click boxes, activation trigger (`onPlayerCallback`), texts, and the optional spawned hand tool, loaded through `HandToolLoadingData` (unregistered). Builds the activatable (targeting required when there is no trigger). Calls `onFinishedLoading` at once unless a spawned tool is still loading.
---@param xmlFile any
---@param key any
---@param callback any
---@param callbackTarget any
---@param callbackArgs any
---@param components any
---@param i3dMappings any
---@param baseDirectory any
---@param customEnv any
function HandToolHolder:load(xmlFile, key, callback, callbackTarget, callbackArgs, components, i3dMappings, baseDirectory, customEnv) end

--- Callback of the dummy i3d load: links the first child under the holder node, deletes the loaded root and refreshes dummy visibility. Does nothing if loading failed (node 0).
---@param i3dNode any
---@param failedReason any
---@param args any
function HandToolHolder:onDummyHandToolI3DLoaded(i3dNode, failedReason, args) end

--- Callback when the spawned tool is loaded: on failure logs an error and calls the load callback with nil; otherwise attaches the tool to this holder, sets it as holder, registers it if the holder is registered, fills `spawnedHandToolFilename` if empty and finishes loading.
---@param handTool any
---@param loadingState any
function HandToolHolder:onSpawnedHandToolLoaded(handTool, loadingState) end

--- Calls the load callback with the holder, adds it to the hand tool system and, when there is no trigger, registers the activatable with the activatable objects system.
function HandToolHolder:onFinishedLoading() end

--- Cancels a pending tool load, releases a stored non-spawned tool, deletes the spawned tool, removes the trigger, releases the shared dummy i3d, unregisters from the hand tool system and activatable system, then calls the parent delete.
function HandToolHolder:delete() end

--- Writes the holder unique id to `key#uniqueId`.
---@param xmlFile any
---@param key any
function HandToolHolder:saveToXMLFile(xmlFile, key) end

--- Reads `#uniqueId` and applies it if present.
---@param xmlFile any
---@param key any
function HandToolHolder:loadFromXMLFile(xmlFile, key) end

--- Server to client: writes whether a spawned hand tool exists and, if so, its object id and post-write data, and registers it in the stream.
---@param streamId integer
---@param connection Connection
function HandToolHolder:writeStream(streamId, connection) end

--- Client from server: if a spawned tool is flagged, reads its object id, calls `postReadStream` on the local spawned tool and finishes its object registration.
---@param streamId integer
---@param connection Connection
---@param objectId integer
function HandToolHolder:readStream(streamId, connection, objectId) end

--- Calls the parent register, then registers the spawned hand tool too if it is not registered yet.
---@param alreadySent any
function HandToolHolder:register(alreadySent) end

--- Returns the holder unique id.
---@return string
function HandToolHolder:getUniqueId() end

--- Sets the unique id; it should not be changed after the first assignment (only debug assertions check it).
---@param uniqueId string
function HandToolHolder:setUniqueId(uniqueId) end

--- Returns the holder name.
function HandToolHolder:getHolderName() end

--- Sets the holder name.
---@param name any
function HandToolHolder:setHolderName(name) end

--- Returns the hand tool currently stored, or nil.
function HandToolHolder:getHandTool() end

--- Returns the hand tool spawned by this holder, or nil.
function HandToolHolder:getSpawnedHandTool() end

--- Returns true if a spawned hand tool filename is configured.
function HandToolHolder:getSpawnsHandTool() end

--- Returns the holder node and the tool's holster node of this holder's type, to be aligned; returns nil, nil if the tool has no `getHolsterNodeByType` or no matching node.
---@param handTool any
function HandToolHolder:getHolderNodePair(handTool) end

--- Always returns true.
---@param handTool any
function HandToolHolder:getCanPickupHandToolFromMenu(handTool) end

--- Returns true if the holder is empty and the tool is storable (`spec_storable`); with a spawned tool it must be that tool, otherwise the tool needs a holster node of this type and the same owner farm.
---@param handTool any
function HandToolHolder:getCanPickupHandTool(handTool) end

--- Stores a hand tool if allowed: records it, calls the store callback, links its root node to the holder node aligned through `HandToolUtil.linkAndTransformRelativeToParent`, resets the graphical node, and updates the dummy. Returns true on success.
---@param handTool any
function HandToolHolder:onPickupHandTool(handTool) end

--- Stores whether the local player is in range and updates the dummy visibility.
---@param isInRange any
function HandToolHolder:setPlayerInRange(isInRange) end

--- Shows the dummy tool only when the player is in range and the holder is empty.
function HandToolHolder:updateDummyHandTool() end

--- If the given tool is the stored one, unlinks it, clears the holder, calls the pickup callback, updates the dummy and returns the tool; otherwise does nothing.
---@param handTool any
function HandToolHolder:onDropHandTool(handTool) end

--- Debug: draws gizmos at the holder node and, if a tool is stored, at the tool's holster node.
function HandToolHolder:drawDebug() end

--- Calls the parent and propagates the owner farm id to the spawned hand tool (no event sent).
---@param farmId any
---@param noEventSend any
function HandToolHolder:setOwnerFarmId(farmId, noEventSend) end

--- Sets the function called with the hand tool when it is stored.
---@param storeCallback any
function HandToolHolder:setStoreCallback(storeCallback) end

--- Sets the function called with the hand tool when it is taken out.
---@param pickupCallback any
function HandToolHolder:setPickupCallback(pickupCallback) end

--- Trigger callback: for the local player root node, enter adds the activatable and sets in range, leave removes it and clears in range.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function HandToolHolder:onPlayerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
