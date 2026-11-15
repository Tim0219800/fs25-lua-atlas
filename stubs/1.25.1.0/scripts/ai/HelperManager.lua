---@meta
-- FS25 1.25.1.0 : ai/HelperManager.lua (stub généré, atlas Lua FS25)

---@class HelperManager : AbstractManager
HelperManager = {}

---@param customMt any
---@return table
function HelperManager.new(customMt) end

function HelperManager:initDataStructures() end

---@param missionInfo any
---@param baseDirectory any
function HelperManager:loadDefaultTypes(missionInfo, baseDirectory) end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function HelperManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@param xmlFileHandle any
---@param missionInfo any
---@param baseDirectory any
---@param isBaseType any
---@param customEnvironment any
---@return boolean
function HelperManager:loadHelpers(xmlFileHandle, missionInfo, baseDirectory, isBaseType, customEnvironment) end

---@param name string
---@param title string
---@param color string
---@param playerStyle any
---@param baseDir string
---@param isBaseType any
---@return boolean
function HelperManager:addHelper(name, title, color, playerStyle, baseDir, isBaseType) end

---@return table
function HelperManager:getRandomHelper() end

---@return table
function HelperManager:getRandomHelperStyle() end

---@return integer
function HelperManager:getRandomIndex() end

---@param index integer
---@return table
function HelperManager:getHelperByIndex(index) end

---@param name string
---@return table
function HelperManager:getHelperByName(name) end

---@param helper table
---@return boolean
function HelperManager:useHelper(helper) end

---@param helper table
function HelperManager:releaseHelper(helper) end

---@return integer
function HelperManager:getNumOfHelpers() end
