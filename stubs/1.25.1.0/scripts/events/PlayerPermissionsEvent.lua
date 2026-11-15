---@meta
-- FS25 1.25.1.0 : events/PlayerPermissionsEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlayerPermissionsEvent : Event
PlayerPermissionsEvent = {}

---@param userId integer
---@param permissions table
---@param isFarmManager boolean
---@param noEventSend boolean
function PlayerPermissionsEvent.sendEvent(userId, permissions, isFarmManager, noEventSend) end
