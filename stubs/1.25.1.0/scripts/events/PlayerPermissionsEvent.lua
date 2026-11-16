---@meta
-- FS25 1.25.1.0 : events/PlayerPermissionsEvent.lua (generated stub, FS25 Lua Atlas)

--- Event class for pushing a player's farm permissions. In this dump only the static helper `sendEvent` is present; `new`, the stream methods and `run` are absent, so what the event carries and how it is applied are UNVERIFIED.
---@class PlayerPermissionsEvent : Event
PlayerPermissionsEvent = {}

--- Builds the event (unless `noEventSend` is true). On a server it broadcasts it, passing the player found through the user's farm; on a client it sends it to the server connection. Assumes the user belongs to a farm.
---@param userId integer
---@param permissions table
---@param isFarmManager boolean
---@param noEventSend boolean
function PlayerPermissionsEvent.sendEvent(userId, permissions, isFarmManager, noEventSend) end
