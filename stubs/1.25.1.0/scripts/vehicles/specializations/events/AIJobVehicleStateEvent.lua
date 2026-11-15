---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIJobVehicleStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIJobVehicleStateEvent : Event
AIJobVehicleStateEvent = {}

---@return table
function AIJobVehicleStateEvent.emptyNew() end

---@param vehicle table
---@param job boolean
---@param helperIndex any
---@param startedFarmId any
function AIJobVehicleStateEvent.new(vehicle, job, helperIndex, startedFarmId) end

---@param streamId integer
---@param connection Connection
function AIJobVehicleStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIJobVehicleStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIJobVehicleStateEvent:run(connection) end
