---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ShallowWaterObstacles.lua (generated stub, FS25 Lua Atlas)

---@param specializations any
function ShallowWaterObstacles.prerequisitesPresent(specializations) end

function ShallowWaterObstacles.initSpecialization() end

---@param vehicleType any
function ShallowWaterObstacles.registerFunctions(vehicleType) end

---@param vehicleType any
function ShallowWaterObstacles.registerEventListeners(vehicleType) end

---@param savegame any
function ShallowWaterObstacles:onPostLoad(savegame) end

---@param savegame table
function ShallowWaterObstacles:onLoadFinished(savegame) end

function ShallowWaterObstacles:onDelete() end

---@param xmlFile any
---@param key any
---@param obstacleNode any
function ShallowWaterObstacles:loadObstacleNodeFromXML(xmlFile, key, obstacleNode) end

---@param obstacleNode any
function ShallowWaterObstacles.getShallowWaterParameters(obstacleNode) end
