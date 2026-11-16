---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableHotspots.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that attaches one or more map hotspots (PlaceableHotspot) to a building, with type, name, world position and optional teleport position. Hotspots are added to the mission on post-finalize and refreshed through updateHotspots when ownership changes. It has no prerequisites.
---@class PlaceableHotspots
PlaceableHotspots = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableHotspots.prerequisitesPresent(specializations) end

--- Registers getHotspot, updateHotspots and setHotspotVisible. The last two have no body in the SDK dump (UNVERIFIED).
---@param placeableType any
function PlaceableHotspots.registerFunctions(placeableType) end

--- Subscribes to load, delete, post-finalize-placement and owner-changed events.
---@param placeableType any
function PlaceableHotspots.registerEventListeners(placeableType) end

--- Declares hotspot entries: linkNode, teleportNode, type (default UNLOADING), worldPosition, teleportWorldPosition and text.
---@param schema any
---@param basePath any
function PlaceableHotspots.registerXMLPaths(schema, basePath) end

--- Creates one PlaceableHotspot per XML entry. Unknown types fall back to UNLOADING with a warning. Position comes from the link node (or placeable root) unless worldPosition is given; an explicit teleport position is raised to at least the terrain height. Translates the text with the mod's i18n.
---@param savegame table
function PlaceableHotspots:onLoad(savegame) end

--- Unsubscribes from the message center, removes each hotspot from the mission map and deletes it.
function PlaceableHotspots:onDelete() end

--- Adds every hotspot to the mission map and calls updateHotspots.
function PlaceableHotspots:onPostFinalizePlacement() end

--- Calls updateHotspots after an owner change.
function PlaceableHotspots:onOwnerChanged() end

--- Returns the hotspot at the given 1-based index, or the first one when no index is given.
---@param index any
function PlaceableHotspots:getHotspot(index) end
