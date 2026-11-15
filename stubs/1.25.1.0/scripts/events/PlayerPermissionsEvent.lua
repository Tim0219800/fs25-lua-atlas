---@meta
-- FS25 1.25.1.0 : events/PlayerPermissionsEvent.lua (stub généré, atlas Lua FS25)

---@class PlayerPermissionsEvent : Event
PlayerPermissionsEvent = {}

---@param userId integer
---@param permissions table
---@param isFarmManager boolean
---@param noEventSend boolean
function PlayerPermissionsEvent.sendEvent(userId, permissions, isFarmManager, noEventSend) end
