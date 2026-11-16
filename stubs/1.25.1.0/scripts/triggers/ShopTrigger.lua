---@meta
-- FS25 1.25.1.0 : triggers/ShopTrigger.lua (generated stub, FS25 Lua Atlas)

--- Map trigger (a shop spot) that lets the local player open the shop menu. Its first child node is the symbol and its second child is the spawn point where the player is placed when opening. Only enabled in career missions, and the symbol is shown only for farm members and when the trigger-marker setting is on. Includes ShopTriggerActivatable. Client side.
---@class ShopTrigger
ShopTrigger = {}

--- Map trigger (a shop spot) that lets the local player open the shop menu. Its first child node is the symbol and its second child is the spawn point where the player is placed when opening. Only enabled in career missions, and the symbol is shown only for farm members and when the trigger-marker setting is on. Includes ShopTriggerActivatable. Client side.
---@class ShopTriggerActivatable
ShopTriggerActivatable = {}

--- Map-load entry point for a shop trigger node: builds a ShopTrigger and adds it to the mission's non-updateable objects.
---@param id integer
function ShopTrigger:onCreate(id) end

--- Creates the trigger: on a client checks the PLAYER collision mask bit (warning if missing) and registers the physics callback. Takes child 0 as symbol and child 1 as player spawn, subscribes to farm change and SHOW_TRIGGER_MARKER setting messages, sets icon visibility and creates the activatable.
---@param node integer
---@return table
function ShopTrigger.new(node) end

--- Unsubscribes from messages, removes the physics trigger if any, clears the symbol reference and removes the activatable.
function ShopTrigger:delete() end

--- Opens the ShopMenu screen, then teleports the local player to the spawn node and sets their yaw from its local -Z direction. If the guided tour is running it shows an info dialog and does nothing else.
function ShopTrigger:openShop() end

--- On enter or leave of the local player's root node, adds or removes the activatable (career missions, enabled trigger only). On enter, if the platform auto-activates triggers and the action is available, it opens the shop directly.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function ShopTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Shows the symbol only if the trigger is enabled, the mission is a career, the local farm is not the spectator farm and the SHOW_TRIGGER_MARKER setting is on.
function ShopTrigger:updateIconVisibility() end

--- Message handler: refreshes the icon visibility when the local player's farm changed; other players are ignored.
---@param player any
function ShopTrigger:playerFarmChanged(player) end

--- Message handler for the trigger-marker setting: refreshes the icon visibility.
function ShopTrigger:onTriggerVisibilityChanged() end

--- Creates the activatable bound to a shop trigger, with the localized text of action_activateShop.
---@param shopTrigger any
function ShopTriggerActivatable.new(shopTrigger) end

--- Returns true when the trigger is enabled, the local player is not in a vehicle and the local farm is not the spectator farm.
function ShopTriggerActivatable:getIsActivatable() end

--- Runs the action by opening the shop through the owning trigger.
function ShopTriggerActivatable:run() end
