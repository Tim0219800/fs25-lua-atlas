---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableLeveling.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableLeveling
PlaceableLeveling = {}

---@param specializations table
---@return boolean
function PlaceableLeveling.prerequisitesPresent(specializations) end

---@param placeableType table
function PlaceableLeveling.registerFunctions(placeableType) end

---@param placeableType table
function PlaceableLeveling.registerEventListeners(placeableType) end

---@param schema XMLSchema
---@param basePath string
function PlaceableLeveling.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableLeveling:onLoad(savegame) end

---@param xmlFile XMLFile
---@param key string
---@param area table
---@return boolean
function PlaceableLeveling:loadLevelArea(xmlFile, key, area) end

---@param xmlFile XMLFile
---@param key string
---@param area table
---@return boolean
function PlaceableLeveling:loadPaintArea(xmlFile, key, area) end

---@param terrainRootNode integer
---@param forBlockingOnly boolean
---@param isBlocking boolean
---@return array
function PlaceableLeveling:getDeformationObjects(terrainRootNode, forBlockingOnly, isBlocking) end

---@param deformationObject TerrainDeformation
---@param area table
---@param terrainBrushId integer
---@param writeBlockedAreaMap boolean
function PlaceableLeveling:addDeformationArea(deformationObject, area, terrainBrushId, writeBlockedAreaMap) end

---@return boolean
function PlaceableLeveling:getRequiresLeveling() end

---@return boolean
function PlaceableLeveling:getRequiresRealignAfterLeveling() end

---@param isPreview boolean
---@param callback function
function PlaceableLeveling:applyDeformation(isPreview, callback) end
