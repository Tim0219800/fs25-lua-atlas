---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetPipeDischargeToGroundEvent.lua (generated stub, FS25 Lua Atlas)

---@class SetPipeDischargeToGroundEvent : Event
SetPipeDischargeToGroundEvent = {}

---@return table
function SetPipeDischargeToGroundEvent.emptyNew() end

---@param object table
---@param dischargeState boolean
function SetPipeDischargeToGroundEvent.new(object, dischargeState) end

---@param streamId integer
---@param connection Connection
function SetPipeDischargeToGroundEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetPipeDischargeToGroundEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetPipeDischargeToGroundEvent:run(connection) end

---@param object table
---@param dischargeState boolean
---@param noEventSend boolean
function SetPipeDischargeToGroundEvent.sendEvent(object, dischargeState, noEventSend) end
