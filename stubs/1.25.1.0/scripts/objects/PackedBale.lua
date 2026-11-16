---@meta
-- FS25 1.25.1.0 : objects/PackedBale.lua (generated stub, FS25 Lua Atlas)

--- Subclass of Bale for a bale made of several smaller bales (a packed/stacked bale). It reads the single-bale config and the child nodes from the bale XML (bale.packedBale#singleBale and singleBale#node), and lets a player on foot cut it open through PackedBaleActivatable. Unpacking spawns normal Bale objects at those nodes on the server; clients send a BaleUnpackEvent (defined elsewhere).
---@class PackedBale : Bale
PackedBale = {}

--- Subclass of Bale for a bale made of several smaller bales (a packed/stacked bale). It reads the single-bale config and the child nodes from the bale XML (bale.packedBale#singleBale and singleBale#node), and lets a player on foot cut it open through PackedBaleActivatable. Unpacking spawns normal Bale objects at those nodes on the server; clients send a BaleUnpackEvent (defined elsewhere).
---@class PackedBaleActivatable
PackedBaleActivatable = {}

--- Creates the packed bale: registers the class name, prepares the list of single-bale nodes, creates the activatable and sets the maximum unpack distance from PackedBale.MAX_UNPACK_DISTANCE (defined outside this file).
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function PackedBale.new(isServer, isClient, customMt) end

--- Removes the activatable from the activatable system, then calls the parent delete.
function PackedBale:delete() end

--- Loads parent attributes, then the single-bale file (must exist, otherwise logs an XML error and returns false) and the list of single-bale nodes. Registers the activatable and returns true on success.
---@param xmlFile table
function PackedBale:loadBaleAttributesFromXML(xmlFile) end

--- Server: for each single-bale node, spawns a normal Bale with the same fill type and as much fill level as it can hold, owned by the same farm, then deletes the packed bale. Client: sends a BaleUnpackEvent to the server. Removes the activatable first.
---@param noEventSend boolean
function PackedBale:unpack(noEventSend) end

--- True if the player's interaction position exists and is closer than the maximum unpack distance.
function PackedBale:getCanInteract() end

--- Returns the local player's position, or nothing if the player is in a vehicle or has no access to this bale.
function PackedBale:getInteractionPosition() end

--- Creates the activatable for a packed bale and loads the 'action_cutBale' text.
---@param packedBale any
function PackedBaleActivatable.new(packedBale) end

--- Active when the player can interact with the packed bale.
function PackedBaleActivatable:getIsActivatable() end

--- Calls unpack on the packed bale.
function PackedBaleActivatable:run() end
