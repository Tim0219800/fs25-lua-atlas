---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlowPackerStateEvent.lua (stub généré, atlas Lua FS25)

---@class PlowPackerStateEvent : Event
PlowPackerStateEvent = {}

---@return table
function PlowPackerStateEvent.emptyNew() end

---@param object table
---@param state boolean
---@param updateAnimations boolean
function PlowPackerStateEvent.new(object, state, updateAnimations) end

---@param streamId integer
---@param connection Connection
function PlowPackerStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlowPackerStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlowPackerStateEvent:run(connection) end

---@param object table
---@param state boolean
---@param updateAnimations boolean
---@param noEventSend boolean
function PlowPackerStateEvent.sendEvent(object, state, updateAnimations, noEventSend) end
