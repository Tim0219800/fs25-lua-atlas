---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableTipOcclusionAreas.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that lets a building mark ground areas where bulk material cannot be tipped. It loads rectangles from `placeable.tipOcclusionUpdateAreas` (start and end nodes) or a legacy single `tipOcclusionUpdateArea`. On the server it flags the matching region of the height-map collision data as dirty so tip collisions get refreshed.
---@class PlaceableTipOcclusionAreas
PlaceableTipOcclusionAreas = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableTipOcclusionAreas.prerequisitesPresent(specializations) end

--- Registers `loadTipOcclusionArea` and `updateTipOcclusionAreas` on the placeable type.
---@param placeableType any
function PlaceableTipOcclusionAreas.registerFunctions(placeableType) end

--- Subscribes to onLoad, onDelete and onFinalizePlacement.
---@param placeableType any
function PlaceableTipOcclusionAreas.registerEventListeners(placeableType) end

--- Declares the XML keys for the legacy single area (`#sizeX`, `#sizeZ`, `#centerX`, `#centerZ`) and the multi-area list with `#startNode` and `#endNode`.
---@param schema any
---@param basePath any
function PlaceableTipOcclusionAreas.registerXMLPaths(schema, basePath) end

--- Builds the list of areas from the XML (each listed area through `loadTipOcclusionArea`, plus the legacy single area if size X and Z are both given) and clears the update-on-delete flag.
---@param savegame table
function PlaceableTipOcclusionAreas:onLoad(savegame) end

--- Server only, and not while reloading: if the flag set at placement is on, refreshes the occlusion areas so the freed ground can be used again.
function PlaceableTipOcclusionAreas:onDelete() end

--- Reads start and end nodes, warns and returns false if one is missing, then fills `area` with center and size (in root-node local XZ) from the two node positions. Returns true on success.
---@param xmlFile any
---@param key any
---@param area any
function PlaceableTipOcclusionAreas:loadTipOcclusionArea(xmlFile, key, area) end

--- Server only: refreshes the occlusion areas unless the placeable was loaded from a valid savegame whose tip and placement collision data are still valid; then arms the refresh on delete.
function PlaceableTipOcclusionAreas:onFinalizePlacement() end

--- Server only: converts each area into a world-space bounding box and marks it dirty in `g_densityMapHeightManager` collision map.
function PlaceableTipOcclusionAreas:updateTipOcclusionAreas() end
