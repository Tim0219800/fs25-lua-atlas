---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterLooping.lua (generated stub, FS25 Lua Atlas)

---@class AIParameterLooping : AIParameter
AIParameterLooping = {}

---@param customMt any
function AIParameterLooping.new(customMt) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterLooping:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function AIParameterLooping:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function AIParameterLooping:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIParameterLooping:writeStream(streamId, connection) end

---@param isLooping any
function AIParameterLooping:setIsLooping(isLooping) end

function AIParameterLooping:getIsLooping() end

function AIParameterLooping:getString() end

function AIParameterLooping:setNextItem() end

function AIParameterLooping:setPreviousItem() end
