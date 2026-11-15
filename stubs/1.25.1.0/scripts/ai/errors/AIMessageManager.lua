---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageManager.lua (stub généré, atlas Lua FS25)

---@class AIMessageManager
AIMessageManager = {}

---@param customMt any
---@return table
function AIMessageManager.new(customMt) end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function AIMessageManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

function AIMessageManager:delete() end

---@param name any
---@param classObject any
function AIMessageManager:registerMessage(name, classObject) end

---@param messageObject any
function AIMessageManager:getMessageIndex(messageObject) end

---@param messageIndex any
function AIMessageManager:createMessage(messageIndex) end
