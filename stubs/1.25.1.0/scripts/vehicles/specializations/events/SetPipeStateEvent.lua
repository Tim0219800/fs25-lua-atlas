---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetPipeStateEvent.lua (stub généré, atlas Lua FS25)

---@class SetPipeStateEvent : Event
SetPipeStateEvent = {}

---@return table
function SetPipeStateEvent.emptyNew() end

---@param object table
---@param pipeState integer
function SetPipeStateEvent.new(object, pipeState) end

---@param streamId integer
---@param connection Connection
function SetPipeStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetPipeStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetPipeStateEvent:run(connection) end
