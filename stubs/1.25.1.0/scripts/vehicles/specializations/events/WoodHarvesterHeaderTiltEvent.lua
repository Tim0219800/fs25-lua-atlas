---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.lua (generated stub, FS25 Lua Atlas)

---@class WoodHarvesterHeaderTiltEvent : Event
WoodHarvesterHeaderTiltEvent = {}

---@return table
function WoodHarvesterHeaderTiltEvent.emptyNew() end

---@param object table
---@param state number
function WoodHarvesterHeaderTiltEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterHeaderTiltEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterHeaderTiltEvent:writeStream(streamId, connection) end

---@param connection Connection
function WoodHarvesterHeaderTiltEvent:run(connection) end

---@param object table
---@param state number
---@param noEventSend boolean
function WoodHarvesterHeaderTiltEvent.sendEvent(object, state, noEventSend) end
