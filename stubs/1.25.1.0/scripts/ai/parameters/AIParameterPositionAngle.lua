---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterPositionAngle.lua (stub généré, atlas Lua FS25)

---@class AIParameterPositionAngle : AIParameterPosition
AIParameterPositionAngle = {}

---@param snappingAngle any
---@param customMt any
function AIParameterPositionAngle.new(snappingAngle, customMt) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterPositionAngle:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function AIParameterPositionAngle:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function AIParameterPositionAngle:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIParameterPositionAngle:writeStream(streamId, connection) end

---@param angleRad any
function AIParameterPositionAngle:setAngle(angleRad) end

function AIParameterPositionAngle:getAngle() end

function AIParameterPositionAngle:getDirection() end

---@param angle any
function AIParameterPositionAngle:setSnappingAngle(angle) end

function AIParameterPositionAngle:getSnappingAngle() end

function AIParameterPositionAngle:getString() end

---@param fillTypeIndex any
---@param farmId any
function AIParameterPositionAngle:validate(fillTypeIndex, farmId) end
