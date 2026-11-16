---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableNPCSpot.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that lets a building define NPC spots (positions where non-player characters can stand). Spots are built from the XML on load and registered with g_npcManager once the placement is final. NPCSpot and the NPC manager are defined elsewhere.
---@class PlaceableNPCSpot
PlaceableNPCSpot = {}

--- Always returns true: no prerequisite specialization is required.
---@param specializations table
---@return boolean
function PlaceableNPCSpot.prerequisitesPresent(specializations) end

--- Subscribes to onLoad, onDelete and onFinalizePlacement.
---@param placeableType any
function PlaceableNPCSpot.registerEventListeners(placeableType) end

--- Declares the npcSpots.spot XML entries by delegating to NPCSpot.registerXMLPaths.
---@param schema any
---@param basePath any
function PlaceableNPCSpot.registerXMLPaths(schema, basePath) end

--- Creates one NPCSpot per npcSpots.spot entry with a unique id built from the placeable's unique id and the index; spots that fail to load are deleted. Stores the list only if it is not empty.
---@param savegame table
function PlaceableNPCSpot:onLoad(savegame) end

--- Adds each spot to the NPC manager.
function PlaceableNPCSpot:onFinalizePlacement() end

--- Removes each spot from the NPC manager. Note: the spots themselves are not deleted here.
function PlaceableNPCSpot:onDelete() end
