---@meta
-- FS25 1.25.1.0 : ai/AIJobTypeManager.lua (generated stub, FS25 Lua Atlas)

---@class AIJobTypeManager
AIJobTypeManager = {}

---@param isServer any
---@param customMt any
---@return table
function AIJobTypeManager.new(isServer, customMt) end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function AIJobTypeManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

function AIJobTypeManager:delete() end

---@param name any
---@param title any
---@param classObject any
function AIJobTypeManager:registerJobType(name, title, classObject) end

---@param job any
function AIJobTypeManager:getJobTypeIndex(job) end

---@param typeIndex any
function AIJobTypeManager:createJob(typeIndex) end

---@param index any
function AIJobTypeManager:getJobTypeByIndex(index) end

---@param name any
function AIJobTypeManager:getJobTypeIndexByName(name) end
