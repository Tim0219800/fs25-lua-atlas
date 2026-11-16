---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableClearAreas.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that defines rectangular areas (start, width and height nodes) cleared when the placeable is first built. On the server, for a placeable not loaded from a savegame, it removes fields, weeds, stones, tire tracks, decoration and heap content on the areas.
---@class PlaceableClearAreas
PlaceableClearAreas = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableClearAreas.prerequisitesPresent(specializations) end

--- Registers `loadClearArea`.
---@param placeableType any
function PlaceableClearAreas.registerFunctions(placeableType) end

--- Subscribes to `onLoad` and `onPostFinalizePlacement`.
---@param placeableType any
function PlaceableClearAreas.registerEventListeners(placeableType) end

--- Declares `clearAreas.clearArea(?)` with `startNode`, `widthNode` and `heightNode`.
---@param schema any
---@param basePath any
function PlaceableClearAreas.registerXMLPaths(schema, basePath) end

--- Loads every `clearArea` entry that is valid and warns when the `clearAreas` section is missing.
---@param savegame table
function PlaceableClearAreas:onLoad(savegame) end

--- Reads the start, width and height nodes into the area table; logs a warning and returns false if any is missing, else true.
---@param xmlFile any
---@param key any
---@param area any
function PlaceableClearAreas:loadClearArea(xmlFile, key, area) end

--- Server only, and only for new placements: for each area removes field, weed, stone, tire track and deco content via `FSDensityMapUtil` and clears height-map content via `DensityMapHeightUtil.clearArea`.
function PlaceableClearAreas:onPostFinalizePlacement() end
