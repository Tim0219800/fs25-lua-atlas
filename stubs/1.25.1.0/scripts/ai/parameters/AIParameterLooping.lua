---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterLooping.lua (generated stub, FS25 Lua Atlas)

--- AI job parameter holding a yes/no looping choice that the player toggles in the UI. It is saved to XML as a boolean attribute and streamed as one bool.
---@class AIParameterLooping : AIParameter
AIParameterLooping = {}

--- Creates the parameter with type SELECTOR and looping off.
---@param customMt any
function AIParameterLooping.new(customMt) end

--- Writes the looping flag to `#isLooping`.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterLooping:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads `#isLooping`, keeping the current value if absent.
---@param xmlFile any
---@param key any
function AIParameterLooping:loadFromXMLFile(xmlFile, key) end

--- Reads one bool and applies it as the looping flag.
---@param streamId any
---@param connection any
function AIParameterLooping:readStream(streamId, connection) end

--- Writes the looping flag as one bool.
---@param streamId any
---@param connection any
function AIParameterLooping:writeStream(streamId, connection) end

--- Sets the looping flag.
---@param isLooping any
function AIParameterLooping:setIsLooping(isLooping) end

--- Returns the looping flag.
function AIParameterLooping:getIsLooping() end

--- Returns the localized "looping" or "no looping" text.
function AIParameterLooping:getString() end

--- Toggles the looping flag.
function AIParameterLooping:setNextItem() end

--- Toggles the looping flag, same as `setNextItem`.
function AIParameterLooping:setPreviousItem() end
