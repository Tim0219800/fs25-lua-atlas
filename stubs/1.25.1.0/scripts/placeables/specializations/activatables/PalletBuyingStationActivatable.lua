---@meta
-- FS25 1.25.1.0 : placeables/specializations/activatables/PalletBuyingStationActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object for a pallet buying station placeable. It is available to players who can access the placeable, with a caller-supplied prompt text, and running it opens the placeable shop.
---@class PalletBuyingStationActivatable
PalletBuyingStationActivatable = {}

--- Creates the activatable for a placeable with the given prompt text.
---@param placeable any
---@param text any
function PalletBuyingStationActivatable.new(placeable, text) end

--- Returns whether the local player may access the placeable according to the access handler.
function PalletBuyingStationActivatable:getIsActivatable() end

--- Calls `openShop` on the placeable.
function PalletBuyingStationActivatable:run() end
