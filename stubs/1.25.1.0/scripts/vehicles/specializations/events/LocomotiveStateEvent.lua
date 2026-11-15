---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/LocomotiveStateEvent.lua (stub généré, atlas Lua FS25)

---@class LocomotiveStateEvent : Event
LocomotiveStateEvent = {}

---@return table
function LocomotiveStateEvent.emptyNew() end

---@param object table
---@param state boolean
function LocomotiveStateEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function LocomotiveStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function LocomotiveStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function LocomotiveStateEvent:run(connection) end
