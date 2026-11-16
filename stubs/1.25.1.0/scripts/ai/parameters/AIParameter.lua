---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameter.lua (generated stub, FS25 Lua Atlas)

--- Base class of the values a player edits when setting up an AI job. It holds a type (`AIParameterType`, default TEXT) and a validity flag, and offers empty hooks for network serialization; subclasses add storage, validation and UI value cycling.
---@class AIParameter
AIParameter = {}

--- Creates a parameter of type TEXT that starts valid.
---@param customMt any
function AIParameter.new(customMt) end

--- Empty hook for reading the value from a network stream.
---@param streamId any
---@param connection any
function AIParameter:readStream(streamId, connection) end

--- Empty hook for writing the value to a network stream.
---@param streamId any
---@param connection any
function AIParameter:writeStream(streamId, connection) end

--- Returns the `AIParameterType` of the parameter.
function AIParameter:getType() end

--- Returns the validity flag, which the UI can use to highlight an invalid parameter.
function AIParameter:getIsValid() end

--- Sets the validity flag.
---@param isValid any
function AIParameter:setIsValid(isValid) end

--- Returns true; read-only parameters such as the vehicle override it.
function AIParameter:getCanBeChanged() end

--- Returns an empty string; subclasses return the text shown in the UI.
function AIParameter:getString() end
