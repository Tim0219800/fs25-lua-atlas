---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FoliageBending.lua (generated stub, FS25 Lua Atlas)

--- Specialization that makes a vehicle push aside foliage on the map through g_currentMission.foliageBendingSystem. Bending nodes are rectangles (X and Z extents plus a height offset) attached to a vehicle node, created when the vehicle is activated and destroyed on deactivation or deletion. Configuration-dependent foliageBendingModifier entries can resize or disable nodes. The FoliageBendingSystem class itself is not in the dump (UNVERIFIED).
---@class FoliageBending
FoliageBending = {}

--- Always returns true: no prerequisite specialization.
---@param specializations any
function FoliageBending.prerequisitesPresent(specializations) end

--- Declares the XML attributes of a bending node (node, min/max X and Z extents, yOffset).
function FoliageBending.initSpecialization() end

--- After all specializations are known, registers the foliageBendingModifier XML element under every vehicle configuration type: index or indices, extents, yOffset, isActive and overwrite.
function FoliageBending.postInitSpecialization() end

--- Registers the bending node load, modifier load, activate, deactivate and lookup functions on the vehicle type.
---@param vehicleType any
function FoliageBending.registerFunctions(vehicleType) end

--- Subscribes to post load, delete, activate and deactivate events.
---@param vehicleType any
function FoliageBending.registerEventListeners(vehicleType) end

--- Loads all vehicle.foliageBending.bendingNode entries, then applies foliageBendingModifier entries of the active configurations: either overwriting the node extents or widening them, and optionally disabling a node. Warns on undefined indices.
---@param savegame any
function FoliageBending:onPostLoad(savegame) end

--- Removes all active bending objects of the vehicle from the foliage bending system.
function FoliageBending:onDelete() end

--- Reads one bending node: node (defaults to the vehicle root node), extents minX/maxX/minZ/maxZ (default -1 to 1) and yOffset (default 0). Always returns true.
---@param xmlFile any
---@param key any
---@param bendingNode any
function FoliageBending:loadBendingNodeFromXML(xmlFile, key, bendingNode) end

--- Reads one modifier (index or indices, optional extents, isActive, overwrite) and queues it in spec.bendingModifiers. Returns nothing and logs a warning when no index is given.
---@param xmlFile any
---@param key any
function FoliageBending:loadBendingNodeModifierFromXML(xmlFile, key) end

--- Creates a rectangle in g_currentMission.foliageBendingSystem for each active node that has none yet, storing its id. The system class is not in the dump (UNVERIFIED behaviour).
function FoliageBending:activateBendingNodes() end

--- Destroys the foliage bending objects created for this vehicle and clears their ids; safe to call when no node exists.
function FoliageBending:deactivateBendingNodes() end

--- Returns the bending node table at the given index (nil if out of range).
---@param index any
function FoliageBending:getFoliageBendingNodeByIndex(index) end

--- Calls activateBendingNodes when the vehicle is activated.
function FoliageBending:onActivate() end

--- Calls deactivateBendingNodes when the vehicle is deactivated.
function FoliageBending:onDeactivate() end
