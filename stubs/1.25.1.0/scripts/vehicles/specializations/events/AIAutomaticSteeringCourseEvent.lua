---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIAutomaticSteeringCourseEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronises the automatic-steering field course of a vehicle (set or cleared) between server and clients. Application happens inside `readStream`; `run` is empty. It has no `sendEvent` helper, so the sender builds and broadcasts it itself. Uses `SteeringFieldCourse` (defined elsewhere, UNVERIFIED).
---@class AIAutomaticSteeringCourseEvent : Event
AIAutomaticSteeringCourseEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AIAutomaticSteeringCourseEvent.emptyNew() end

--- Creates the event carrying a vehicle and its steering field course (may be nil to clear it).
---@param vehicle table
---@param steeringFieldCourse integer
function AIAutomaticSteeringCourseEvent.new(vehicle, steeringFieldCourse) end

--- Reads the vehicle, first clears its automatic steering course, then if a course is present reads it asynchronously (`SteeringFieldCourse.readStream`) and applies it with `setAIAutomaticSteeringCourse`, all only if the vehicle is synchronized.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringCourseEvent:readStream(streamId, connection) end

--- Writes the vehicle reference, a presence flag and, when set, the steering field course.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringCourseEvent:writeStream(streamId, connection) end

--- Empty; all work is done in `readStream`.
---@param connection Connection
function AIAutomaticSteeringCourseEvent:run(connection) end
