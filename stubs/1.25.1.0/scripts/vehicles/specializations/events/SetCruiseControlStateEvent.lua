---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetCruiseControlStateEvent.lua (stub généré, atlas Lua FS25)

---@class SetCruiseControlStateEvent : Event
SetCruiseControlStateEvent = {}

---@return table
function SetCruiseControlStateEvent.emptyNew() end

---@param vehicle table
---@param state integer
function SetCruiseControlStateEvent.new(vehicle, state) end

---@param streamId integer
---@param connection Connection
function SetCruiseControlStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetCruiseControlStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetCruiseControlStateEvent:run(connection) end
