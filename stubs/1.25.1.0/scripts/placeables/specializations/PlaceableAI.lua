---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableAI.lua (stub généré, atlas Lua FS25)

---@class PlaceableAI
PlaceableAI = {}

---@param specializations table
---@return boolean
function PlaceableAI.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableAI.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableAI.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableAI.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableAI:onLoad(savegame) end

---@param savegame any
function PlaceableAI:onPostLoad(savegame) end

function PlaceableAI:onDelete() end

---@param xmlFile any
---@param key any
---@param area any
function PlaceableAI:loadAIUpdateArea(xmlFile, key, area) end

---@param xmlFile any
---@param key any
---@param spline any
function PlaceableAI:loadAISpline(xmlFile, key, spline) end

---@param xmlFile any
---@param key any
---@param obstacle any
function PlaceableAI:loadAIObstacle(xmlFile, key, obstacle) end

function PlaceableAI:onFinalizePlacement() end

---@param obstacle any
---@param active any
function PlaceableAI:setObstacleActive(obstacle, active) end

function PlaceableAI:updateAIUpdateAreas() end
