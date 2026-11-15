---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FillUnitUnloadEvent.lua (generated stub, FS25 Lua Atlas)

---@class FillUnitUnloadEvent : Event
FillUnitUnloadEvent = {}

---@return table
function FillUnitUnloadEvent.emptyNew() end

---@param object table
function FillUnitUnloadEvent.new(object) end

function FillUnitUnloadEvent.newServerToClient() end

---@param streamId integer
---@param connection Connection
function FillUnitUnloadEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FillUnitUnloadEvent:writeStream(streamId, connection) end

---@param connection Connection
function FillUnitUnloadEvent:run(connection) end
