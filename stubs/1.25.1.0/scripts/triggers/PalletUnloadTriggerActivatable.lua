---@meta
-- FS25 1.25.1.0 : triggers/PalletUnloadTriggerActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable (interaction prompt) used by PalletUnloadTrigger when automatic unloading is off. It shows an unload action while pallets are in range and the local player, or the vehicle the player drives, is in the trigger. Client side.
---@class PalletUnloadTriggerActivatable
PalletUnloadTriggerActivatable = {}

--- Creates the activatable for the owning pallet trigger, with the localized text of button_unload.
---@param palletUnloadTrigger any
function PalletUnloadTriggerActivatable.new(palletUnloadTrigger) end

--- Returns true only if the owner is enabled, no GUI is open, the player may access the owner, at least one pallet is in range, and the player is in range on foot or driving a vehicle in range.
function PalletUnloadTriggerActivatable:getIsActivatable() end

--- Runs the action by calling unloadPallets on the owner with the local farm id.
function PalletUnloadTriggerActivatable:run() end

--- Returns the distance from the given world position to the owner's trigger node, or math.huge if the owner has no trigger node.
---@param x any
---@param y any
---@param z any
function PalletUnloadTriggerActivatable:getDistance(x, y, z) end
