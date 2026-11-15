---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterCutLengthEvent.lua (stub généré, atlas Lua FS25)

---@class WoodHarvesterCutLengthEvent : Event
WoodHarvesterCutLengthEvent = {}

---@return table
function WoodHarvesterCutLengthEvent.emptyNew() end

---@param object table
---@param index number
function WoodHarvesterCutLengthEvent.new(object, index) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterCutLengthEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterCutLengthEvent:writeStream(streamId, connection) end

---@param connection Connection
function WoodHarvesterCutLengthEvent:run(connection) end

---@param object table
---@param index number
---@param noEventSend boolean
function WoodHarvesterCutLengthEvent.sendEvent(object, index, noEventSend) end
