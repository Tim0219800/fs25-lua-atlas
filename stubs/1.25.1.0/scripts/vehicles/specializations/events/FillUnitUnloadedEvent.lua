---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FillUnitUnloadedEvent.lua (stub généré, atlas Lua FS25)

---@class FillUnitUnloadedEvent : Event
FillUnitUnloadedEvent = {}

---@return table
function FillUnitUnloadedEvent.emptyNew() end

---@param object table
---@param pallet any
---@param showWarning any
---@param result any
function FillUnitUnloadedEvent.new(object, pallet, showWarning, result) end

---@param streamId integer
---@param connection Connection
function FillUnitUnloadedEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FillUnitUnloadedEvent:writeStream(streamId, connection) end

---@param connection Connection
function FillUnitUnloadedEvent:run(connection) end
