---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelManager.lua (stub généré, atlas Lua FS25)

---@class WheelManager : AbstractManager
WheelManager = {}

---@param customMt any
---@return table
function WheelManager.new(customMt) end

function WheelManager:initDataStructures() end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function WheelManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@param xmlFile table
---@param key string
---@param baseDirectory string
function WheelManager:loadWheelsFromXML(xmlFile, key, baseDirectory) end

---@param dimension string
---@return number
---@return number
function WheelManager:getWheelRadiusAndWidthFromDimension(dimension) end

---@param filename string
---@return number
---@return number
function WheelManager:getWheelRadiusAndWidthFromFilename(filename) end
