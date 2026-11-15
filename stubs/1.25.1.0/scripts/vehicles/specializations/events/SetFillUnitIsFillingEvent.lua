---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetFillUnitIsFillingEvent.lua (stub généré, atlas Lua FS25)

---@class SetFillUnitIsFillingEvent : Event
SetFillUnitIsFillingEvent = {}

---@return table
function SetFillUnitIsFillingEvent.emptyNew() end

---@param vehicle table
---@param isFilling boolean
function SetFillUnitIsFillingEvent.new(vehicle, isFilling) end

---@param streamId integer
---@param connection Connection
function SetFillUnitIsFillingEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetFillUnitIsFillingEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetFillUnitIsFillingEvent:run(connection) end
