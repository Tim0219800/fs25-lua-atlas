---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterFillType.lua (generated stub, FS25 Lua Atlas)

---@class AIParameterFillType : AIParameter
AIParameterFillType = {}

---@param customMt any
function AIParameterFillType.new(customMt) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterFillType:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function AIParameterFillType:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function AIParameterFillType:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIParameterFillType:writeStream(streamId, connection) end

---@param fillTypes any
function AIParameterFillType:setValidFillTypes(fillTypes) end

function AIParameterFillType:setNextItem() end

function AIParameterFillType:setPreviousItem() end

---@param index any
function AIParameterFillType:setFillTypeByIndex(index) end

---@param fillTypeIndex any
function AIParameterFillType:setFillTypeIndex(fillTypeIndex) end

function AIParameterFillType:getFillTypeIndex() end

function AIParameterFillType:getString() end

function AIParameterFillType:validate() end
