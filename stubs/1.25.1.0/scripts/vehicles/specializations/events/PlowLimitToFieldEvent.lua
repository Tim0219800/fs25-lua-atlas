---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlowLimitToFieldEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlowLimitToFieldEvent : Event
PlowLimitToFieldEvent = {}

---@return table
function PlowLimitToFieldEvent.emptyNew() end

---@param object table
---@param plowLimitToField boolean
function PlowLimitToFieldEvent.new(object, plowLimitToField) end

---@param streamId integer
---@param connection Connection
function PlowLimitToFieldEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlowLimitToFieldEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlowLimitToFieldEvent:run(connection) end
