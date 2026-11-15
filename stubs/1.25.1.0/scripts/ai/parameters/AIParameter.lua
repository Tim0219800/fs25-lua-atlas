---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameter.lua (stub généré, atlas Lua FS25)

---@class AIParameter
AIParameter = {}

---@param customMt any
function AIParameter.new(customMt) end

---@param streamId any
---@param connection any
function AIParameter:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIParameter:writeStream(streamId, connection) end

function AIParameter:getType() end

function AIParameter:getIsValid() end

---@param isValid any
function AIParameter:setIsValid(isValid) end

function AIParameter:getCanBeChanged() end

function AIParameter:getString() end
