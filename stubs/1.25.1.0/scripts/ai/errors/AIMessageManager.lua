---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageManager.lua (generated stub, FS25 Lua Atlas)

--- Manager that registers every AI message class under an upper-case name and an index, and creates instances from that index. `loadMapData` registers the 24 error and 3 success messages of the base game; the index is what `AIJobStopEvent` sends over the network.
---@class AIMessageManager
AIMessageManager = {}

--- Creates the manager instance; the tables are only filled later by `loadMapData`.
---@param customMt any
---@return table
function AIMessageManager.new(customMt) end

--- Resets the lookup tables and registers all base-game AI messages (ERROR_* and SUCCESS_*). The order of registration defines the network indices. Returns nothing despite the map-data convention.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function AIMessageManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Clears the message list and both lookup tables.
function AIMessageManager:delete() end

--- Registers a message class under an upper-cased name. Returns nil with a warning if the name is invalid, already used or the class is nil; otherwise returns the entry. Mods can use it to add messages.
---@param name any
---@param classObject any
function AIMessageManager:registerMessage(name, classObject) end

--- Returns the registration index of the class of the given message object, or nil if its class is unknown.
---@param messageObject any
function AIMessageManager:getMessageIndex(messageObject) end

--- Instantiates the message class registered at the index by calling its `new()` without arguments. Returns nil if the index is nil or unknown. Note: classes needing constructor arguments, like `AIMessageErrorCouldNotPrepare`, get nil and rely on `readStream`.
---@param messageIndex any
function AIMessageManager:createMessage(messageIndex) end
