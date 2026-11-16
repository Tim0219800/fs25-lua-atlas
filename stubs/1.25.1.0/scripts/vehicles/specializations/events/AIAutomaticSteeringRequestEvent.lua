---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIAutomaticSteeringRequestEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event asking for an automatic-steering field course to be generated for a vehicle at a field position with given settings. Handling directly calls the vehicle's `generateSteeringFieldCourse`.
---@class AIAutomaticSteeringRequestEvent : Event
AIAutomaticSteeringRequestEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AIAutomaticSteeringRequestEvent.emptyNew() end

--- Creates a request for a vehicle with a field position (x, z) and the field course settings to use.
---@param vehicle table
---@param x integer
---@param z any
---@param fieldCourseSettings any
function AIAutomaticSteeringRequestEvent.new(vehicle, x, z, fieldCourseSettings) end

--- Reads the vehicle, a terrain detail pixel position through `g_fieldCourseManager` and the `FieldCourseSettings` attributes, builds the settings object, then calls `run`.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringRequestEvent:readStream(streamId, connection) end

--- Writes the vehicle, the terrain pixel position and the field course settings.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringRequestEvent:writeStream(streamId, connection) end

--- If the vehicle is synchronized, calls `generateSteeringFieldCourse(x, z, settings)` on it. Intended for the receiving side (presumably the server; UNVERIFIED, no side check here).
---@param connection Connection
function AIAutomaticSteeringRequestEvent:run(connection) end
