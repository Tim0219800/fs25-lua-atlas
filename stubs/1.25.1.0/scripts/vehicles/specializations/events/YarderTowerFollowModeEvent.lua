---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/YarderTowerFollowModeEvent.lua (stub généré, atlas Lua FS25)

---@class YarderTowerFollowModeEvent : Event
YarderTowerFollowModeEvent = {}

---@return table
function YarderTowerFollowModeEvent.emptyNew() end

---@param object table
---@param state table
---@return table
function YarderTowerFollowModeEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function YarderTowerFollowModeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function YarderTowerFollowModeEvent:writeStream(streamId, connection) end

---@param connection Connection
function YarderTowerFollowModeEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param noEventSend boolean
function YarderTowerFollowModeEvent.sendEvent(vehicle, state, noEventSend) end
