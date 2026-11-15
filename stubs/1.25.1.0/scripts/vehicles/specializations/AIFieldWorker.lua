---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIFieldWorker.lua (stub généré, atlas Lua FS25)

---@class AIFieldWorker
AIFieldWorker = {}

---@param specializations table
---@return boolean
function AIFieldWorker.prerequisitesPresent(specializations) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIFieldWorker:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function AIFieldWorker:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIFieldWorker:onWriteStream(streamId, connection) end

---@param dt number
function AIFieldWorker:updateAIFieldWorker(dt) end

function AIFieldWorker:updateAIFieldWorkerDriveStrategies() end

---@param superFunc any
function AIFieldWorker:aiContinue(superFunc) end
