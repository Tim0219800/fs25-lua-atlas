---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIAutomaticSteeringRequestEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIAutomaticSteeringRequestEvent : Event
AIAutomaticSteeringRequestEvent = {}

---@return table
function AIAutomaticSteeringRequestEvent.emptyNew() end

---@param vehicle table
---@param x integer
---@param z any
---@param fieldCourseSettings any
function AIAutomaticSteeringRequestEvent.new(vehicle, x, z, fieldCourseSettings) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringRequestEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringRequestEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIAutomaticSteeringRequestEvent:run(connection) end
