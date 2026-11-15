---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIAutomaticSteeringCourseEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIAutomaticSteeringCourseEvent : Event
AIAutomaticSteeringCourseEvent = {}

---@return table
function AIAutomaticSteeringCourseEvent.emptyNew() end

---@param vehicle table
---@param steeringFieldCourse integer
function AIAutomaticSteeringCourseEvent.new(vehicle, steeringFieldCourse) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringCourseEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringCourseEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIAutomaticSteeringCourseEvent:run(connection) end
