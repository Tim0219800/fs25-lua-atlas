---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterPosition.lua (generated stub, FS25 Lua Atlas)

---@class AIParameterPosition : AIParameter
AIParameterPosition = {}

---@param customMt any
function AIParameterPosition.new(customMt) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterPosition:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function AIParameterPosition:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function AIParameterPosition:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIParameterPosition:writeStream(streamId, connection) end

---@param x any
---@param z any
function AIParameterPosition:setPosition(x, z) end

function AIParameterPosition:getPosition() end

function AIParameterPosition:getString() end

function AIParameterPosition:validate() end
