---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableFoliageAreas.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that lets a building define parallelogram areas (start, width, height nodes) painted with a fruit type at a growth state, or with a deco foliage layer, when the placeable is finalized. It only writes to the map on the server. It has no prerequisites.
---@class PlaceableFoliageAreas
PlaceableFoliageAreas = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableFoliageAreas.prerequisitesPresent(specializations) end

--- Registers the loadFoliageArea method on the placeable type.
---@param placeableType any
function PlaceableFoliageAreas.registerFunctions(placeableType) end

--- Subscribes to the load and post-finalize-placement events.
---@param placeableType any
function PlaceableFoliageAreas.registerEventListeners(placeableType) end

--- Declares foliageAreas.foliageArea entries: start, width and height nodes, fruitType, growthStateName, decoFoliage and numeric state.
---@param schema any
---@param basePath any
function PlaceableFoliageAreas.registerXMLPaths(schema, basePath) end

--- Iterates the foliageArea entries and keeps those that loadFoliageArea accepts in spec.areas.
---@param savegame table
function PlaceableFoliageAreas:onLoad(savegame) end

--- Reads one area into the given table. If both fruitType and decoFoliage are set, decoFoliage is ignored. Resolves the fruit type and growth state (default is the max harvesting state minus one), checks the deco layer exists on the map, and needs the three nodes. Returns false on any failure.
---@param xmlFile any
---@param key any
---@param area any
function PlaceableFoliageAreas:loadFoliageArea(xmlFile, key, area) end

--- Server only: for fruit areas queues a FieldUpdateTask with the fruit type and growth state on the area; for deco areas calls applyDecoFoliage on the foliage system with the three corner world positions.
function PlaceableFoliageAreas:onPostFinalizePlacement() end
