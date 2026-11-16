---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableIndoorAreas.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that marks parallelogram areas as indoor in the mission's indoor mask when the placeable is finalized, and resets them to outdoor on deletion. The mask is used by the game to tell inside from outside (exact consumers are UNVERIFIED). It has no prerequisites.
---@class PlaceableIndoorAreas
PlaceableIndoorAreas = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableIndoorAreas.prerequisitesPresent(specializations) end

--- Registers the loadIndoorArea method.
---@param placeableType any
function PlaceableIndoorAreas.registerFunctions(placeableType) end

--- Subscribes to load, delete and finalize-placement events.
---@param placeableType any
function PlaceableIndoorAreas.registerEventListeners(placeableType) end

--- Declares indoorAreas.indoorArea entries with startNode, widthNode and heightNode.
---@param schema any
---@param basePath any
function PlaceableIndoorAreas.registerXMLPaths(schema, basePath) end

--- Loads the indoor areas via loadIndoorArea and logs an XML warning if no indoorAreas block exists.
---@param savegame table
function PlaceableIndoorAreas:onLoad(savegame) end

--- If areas were marked, sets them back to OUTDOOR in the indoor mask, except while the placeable is reloading.
function PlaceableIndoorAreas:onDelete() end

--- Reads one area's three nodes into the table; returns false with a warning if one is missing.
---@param xmlFile any
---@param key any
---@param area any
function PlaceableIndoorAreas:loadIndoorArea(xmlFile, key, area) end

--- Sets every area to INDOOR in the mission indoor mask and enables the reset to outdoor on deletion.
function PlaceableIndoorAreas:onFinalizePlacement() end
