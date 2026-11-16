---@meta
-- FS25 1.25.1.0 : objects/InlineBale.lua (generated stub, FS25 Lua Atlas)

--- Network object (extends Object) representing a chain of wrapped bales laid end to end, as made by an inline bale wrapper. It keeps the ordered list of InlineBaleSingle bales, links neighbours with physics joints that stiffen over time, spawns connector visuals and tracks the wrapping progress. It can be cut open by a player through InlineBaleActivatable, is saved/loaded by uniqueId of its bales and is synchronised with dirty flags for bales and wrapper. Config is read from an inlineBale XML (maxOpenDistance, connector, replacementBale, textures, wrapping keys, joint limits).
---@class InlineBale : Object
InlineBale = {}

--- Network object (extends Object) representing a chain of wrapped bales laid end to end, as made by an inline bale wrapper. It keeps the ordered list of InlineBaleSingle bales, links neighbours with physics joints that stiffen over time, spawns connector visuals and tracks the wrapping progress. It can be cut open by a player through InlineBaleActivatable, is saved/loaded by uniqueId of its bales and is synchronised with dirty flags for bales and wrapper. Config is read from an inlineBale XML (maxOpenDistance, connector, replacementBale, textures, wrapping keys, joint limits).
---@class InlineBaleActivatable
InlineBaleActivatable = {}

--- Creates the inline bale object: empty bale and joint tables, default joint limits and lock time (5000 ms), registers it with the item system and the class-name registry, and creates its activatable and dirty flags.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function InlineBale.new(isServer, isClient, customMt) end

--- Removes the activatable and the item-system entry, unregisters the class name, then calls the parent delete. Does not delete the individual bales.
function InlineBale:delete() end

--- Loads the inline bale XML: open distance, connector file/axis/offset, optional replacement bale, wrap diffuse and normal textures (required), wrapping-state keyframes and joint limits/lock time. Returns false on a missing file or texture.
---@param configFileName configFileName
---@return table
function InlineBale:loadFromConfigXML(configFileName) end

--- Savegame loading: reads the config filename and uniqueId, loads the config, then queues the uniqueIds of the saved bales in balesToLoad. If none were saved the inline bale is flagged for removal.
---@param xmlFile XMLFile
---@param key string
---@return boolean
function InlineBale:loadFromXMLFile(xmlFile, key) end

--- Writes config filename, uniqueId and the uniqueId of each bale. Skipped entirely when the only bale is still the pending one.
---@param xmlFile any
---@param key any
function InlineBale:saveToXMLFile(xmlFile, key) end

--- Client-side join: reads the config filename, loads the config, calls the parent readStream, registers in the item system and reads the bale list.
---@param streamId integer
---@param connection table
function InlineBale:readStream(streamId, connection) end

--- Server-side join: writes the config filename, calls the parent writeStream and writes the bale list.
---@param streamId integer
---@param connection table
function InlineBale:writeStream(streamId, connection) end

--- Client-side update read (only from the server connection): optionally reads the bale list and the current wrapper node object, according to two flags.
---@param streamId integer
---@param timestamp integer
---@param connection table
function InlineBale:readUpdateStream(streamId, timestamp, connection) end

--- Server-side update write: sends the bale list when the bale dirty flag is set and the current wrapper when the wrapper dirty flag is set.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function InlineBale:writeUpdateStream(streamId, connection, dirtyMask) end

--- Reads the bale count and object ids from a stream. Removes connectors from the old bales, clears the list, queues the ids in balesToLoad and registers the activatable if any bale exists.
---@param streamId any
---@param timestamp any
---@param connection any
function InlineBale:readBales(streamId, timestamp, connection) end

--- Writes the bale count and node objects to a stream. The last bale is skipped while a pending bale exists because it is about to be replaced; stores the sent count in numBalesSent.
---@param streamId any
---@param connection any
---@param dirtyMask any
function InlineBale:writeBales(streamId, connection, dirtyMask) end

--- Empty override, does nothing.
---@param dt number
function InlineBale:update(dt) end

--- Main tick. Server: resolves queued savegame bales by uniqueId, advances joint stiffening, computes per-bale wrapping state along the wrapper position, flags bale changes for sync, handles delayed wake-up and deletion of empty objects. Client: resolves queued network ids, adds the bales and rebuilds connectors.
---@param dt number
function InlineBale:updateTick(dt) end

--- Adds a bale to the chain. On the server it requires no pending bale and getIsBaleAllowed, then marks it pending, links it and listens for its deletion; on the client it just appends it. Returns true on success and applies any waiting wrapper info.
---@param bale any
---@param baleType any
function InlineBale:addBale(bale, baleType) end

--- Returns true for the first bale; otherwise false when the maximum count (InlineBale.MAX_NUM_BALES, defined outside this file) is reached or the bale type's inline config differs from this one.
---@param bale any
---@param baleType any
function InlineBale:getIsBaleAllowed(bale, baleType) end

--- Server-side: swaps the pending bale for a new InlineBaleSingle created at spawnNode with the same attributes, wrap textures and optional color. Deletes the old one and returns replaced (boolean) and the new network object id.
---@param spawnNode any
---@param color any
function InlineBale:replacePendingBale(spawnNode, color) end

--- Returns the bale currently waiting to be connected, or nil.
function InlineBale:getPendingBale() end

--- Registers the activatable and, if a pending bale exists, joins it to the previous bale when there are at least two, then clears the pending slot. Returns true if a bale was pending. The filename argument passed by one caller is ignored.
function InlineBale:connectPendingBale() end

--- Creates the physics joint and the visual connector between the second-to-last bale and the given last bale.
---@param bale any
function InlineBale:connectBale(bale) end

--- Builds a physics joint between two bales with collision enabled, using the starting rotation and translation limits, and stores it with a timer keyed by the first bale.
---@param bale1 any
---@param bale2 any
function InlineBale:createBaleJoint(bale1, bale2) end

--- Advances each joint's timer up to lockTime and interpolates its limits from start to end values, so the chain gradually stiffens.
---@param dt any
function InlineBale:updateBaleJoints(dt) end

--- Applies rotation and translation limits to a joint, linearly interpolated between the start and end limit tables by alpha (0 to 1).
---@param jointIndex any
---@param alpha any
function InlineBale:setBaleJointLimits(jointIndex, alpha) end

--- Attaches a connector visual to bale2 relative to bale1 if a filename is given and bale2 has none. Returns true on success, otherwise false.
---@param bale1 any
---@param bale2 any
---@param filename any
function InlineBale:loadBaleConnector(bale1, bale2, filename) end

--- Removes the connector from the given bale if not nil.
---@param bale any
function InlineBale:removeBaleConnector(bale) end

--- Stores the wrapping node, wakes the object and, when the wrapper changed, updates it and raises the wrapper dirty flag for network sync.
---@param wrapper any
---@param wrappingNode any
function InlineBale:setCurrentWrapperInfo(wrapper, wrappingNode) end

--- Returns the number of bales in the chain.
function InlineBale:getNumberOfBales() end

--- Returns the ordered table of bales.
function InlineBale:getBales() end

--- Sets the same wrapping state on every bale and on the inline bale itself.
---@param state any
function InlineBale:setWrappingState(state) end

--- Wakes the physics of all bales now, or after the given delay in ms (processed in updateTick on the server).
---@param delay any
function InlineBale:wakeUp(delay) end

--- True if bales exist, no wrapper is active and the player's interaction position is within maxOpenDistance of the first or last bale.
function InlineBale:getCanInteract() end

--- Returns the local player's position, or nothing if the player is in a vehicle or lacks access to the first bale.
function InlineBale:getInteractionPosition() end

--- True only when every bale is fully wrapped and none is still fermenting.
function InlineBale:getCanBeOpened() end

--- Opens the end bale (first or last) nearest to the given world position.
---@param x any
---@param y any
---@param z any
function InlineBale:openBaleAtPosition(x, y, z) end

--- Detaches an end bale: removes its joint and connector, updates the list, clears its inline link and, unless replaceBale is false, replaces it with a normal opened Bale with the same attributes. Deletes the inline bale when empty.
---@param bale any
---@param isFirst any
---@param replaceBale any
function InlineBale:openBale(bale, isFirst, replaceBale) end

--- Delete listener. If a bale in the chain is removed, opens (detaches) the bales on the shorter side up to it so the chain stays consistent. Does nothing while a bale is pending.
---@param bale any
function InlineBale:onBaleDeleted(bale) end

--- Creates the activatable for an inline bale and loads the 'action_cutBale' text.
---@param inlineBale any
function InlineBaleActivatable.new(inlineBale) end

--- Active only if the player can interact and the bales can be opened.
function InlineBaleActivatable:getIsActivatable() end

--- Cuts open the bale nearest to the player: directly on the server, otherwise by sending an InlineBaleOpenEvent (defined elsewhere) to the server.
function InlineBaleActivatable:run() end
