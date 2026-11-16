---@meta
-- FS25 1.25.1.0 : placeables/specializations/activatables/DestructibleActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object that lets a player start repairing a destructible placeable. Availability depends on the placeable, and running it sends a PlaceableDestructibleRepairEvent to the server, except during a guided tour where an info dialog is shown instead.
---@class DestructibleActivatable
DestructibleActivatable = {}

--- Creates the activatable for a placeable and sets the prompt text `action_destructibleStartRepairing`.
---@param placeable any
function DestructibleActivatable.new(placeable) end

--- Returns the result of the placeable `getCanRepairDestructible` for the local farm id.
function DestructibleActivatable:getIsActivatable() end

--- Shows an info dialog and stops if a guided tour is running; otherwise sends a PlaceableDestructibleRepairEvent to the server connection.
function DestructibleActivatable:run() end
