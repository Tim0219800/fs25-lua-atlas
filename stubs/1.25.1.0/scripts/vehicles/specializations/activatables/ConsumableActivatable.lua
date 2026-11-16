---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/ConsumableActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object used by the Consumable specialization to let the player choose a consumable variation for an empty consumable slot of a vehicle. It reads `spec_consumable.types`, asks g_consumableManager for the available variations and shows an OptionDialog. The choice is sent to the server with ConsumableRefillEvent. The `TYPE_TEXTS` table it uses is not defined in this file (UNVERIFIED where it is set).
---@class ConsumableActivatable
ConsumableActivatable = {}

--- Creates the activatable for the given vehicle with an empty activate text.
---@param vehicle any
function ConsumableActivatable.new(vehicle) end

--- Returns true if the vehicle is active for input and at least one consumable type has a consuming fill level of 0 (needs refilling).
function ConsumableActivatable:getIsActivatable() end

--- For each empty consumable type, fetches its variations and opens an option dialog; the selected variation is sent via ConsumableRefillEvent. Note: with several empty types it opens one dialog per type in the same call.
function ConsumableActivatable:run() end

--- Sets the activate text to the localized label of an empty consumable type; with several empty types the last one wins.
function ConsumableActivatable:updateActivateText() end
