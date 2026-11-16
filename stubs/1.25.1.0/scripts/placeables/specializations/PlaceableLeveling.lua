---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableLeveling.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization describing how the ground is leveled and painted around a building when it is placed. It loads level areas (flattened, optionally painted with a ground type), paint-only areas and the smoothing parameters, then builds TerrainDeformation objects and queues them through the terrain deformation queue. It has no prerequisites; the deformation is run on demand by the placement code.
---@class PlaceableLeveling
PlaceableLeveling = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableLeveling.prerequisitesPresent(specializations) end

--- Registers the leveling methods: area loaders, deformation objects, add area, apply, and the two leveling getters.
---@param placeableType table
function PlaceableLeveling.registerFunctions(placeableType) end

--- Subscribes to the load event.
---@param placeableType table
function PlaceableLeveling.registerEventListeners(placeableType) end

--- Declares leveling attributes (requireLeveling, maxSmoothDistance, maxSlope, maxEdgeAngle, smoothingGroundType, realignAfterLeveling) and the levelArea and paintArea entries with start, width, height nodes and groundType.
---@param schema XMLSchema
---@param basePath string
function PlaceableLeveling.registerXMLPaths(schema, basePath) end

--- Reads leveling settings (maxSmoothDistance is clamped to 0 to 10 with a warning, slope and edge angle default to 45), warns if the leveling block is missing and loads level and paint areas. Also checks for the deprecated rampAreas element.
---@param savegame table
function PlaceableLeveling:onLoad(savegame) end

--- Reads a level area (three nodes and an optional groundType) into the table; returns false with a warning if a node is missing.
---@param xmlFile XMLFile
---@param key string
---@param area table
---@return boolean
function PlaceableLeveling:loadLevelArea(xmlFile, key, area) end

--- Same as loadLevelArea but for paint-only areas, with warnings worded for paint areas.
---@param xmlFile XMLFile
---@param key string
---@param area table
---@return boolean
function PlaceableLeveling:loadPaintArea(xmlFile, key, area) end

--- Builds the TerrainDeformation objects for a terrain node: one for all level areas (blocked-area map, outside smoothing brush and limits, collision mask, small max displacements) and, unless blocking-only, one painting object for paint areas. Returns an empty list without a valid terrain root. Caller owns and deletes them.
---@param terrainRootNode integer
---@param forBlockingOnly boolean
---@param isBlocking boolean
---@return array
function PlaceableLeveling:getDeformationObjects(terrainRootNode, forBlockingOnly, isBlocking) end

--- Converts an area's three nodes to world coordinates, builds the two edge vectors from the start corner and adds the parallelogram to the deformation object with the brush id and the blocked-area-map write flag.
---@param deformationObject TerrainDeformation
---@param area table
---@param terrainBrushId integer
---@param writeBlockedAreaMap boolean
function PlaceableLeveling:addDeformationArea(deformationObject, area, terrainBrushId, writeBlockedAreaMap) end

--- Returns whether the placeable asks for ground leveling.
---@return boolean
function PlaceableLeveling:getRequiresLeveling() end

--- Returns whether the placeable is realigned in height after leveling (default true).
---@return boolean
function PlaceableLeveling:getRequiresRealignAfterLeveling() end

--- Runs the deformation objects one after another through g_terrainDeformationQueue, either as a preview or for real, summing the displaced volume. The callback receives the state, total volume and a blocking object name on failure, and objects are deleted through the async task manager. Calls the callback at once with success if there is nothing to do.
---@param isPreview boolean
---@param callback function
function PlaceableLeveling:applyDeformation(isPreview, callback) end
