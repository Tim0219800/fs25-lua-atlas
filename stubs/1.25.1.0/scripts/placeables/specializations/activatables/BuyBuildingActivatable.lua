---@meta
-- FS25 1.25.1.0 : placeables/specializations/activatables/BuyBuildingActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object that shows a buy-building action prompt for an unowned placeable. It is usable when the local farm can access the placeable, and running it asks the placeable to start a purchase if it still has no owner.
---@class BuyBuildingActivatable
BuyBuildingActivatable = {}

--- Creates the activatable for a placeable and sets the localized prompt `action_buyBuilding`.
---@param placeable any
function BuyBuildingActivatable.new(placeable) end

--- Returns whether the current farm may access the placeable according to the mission access handler.
function BuyBuildingActivatable:getIsActivatable() end

--- If the placeable owner is the unowned marker (`AccessHandler.EVERYONE`), calls its `buyRequest`; otherwise does nothing.
function BuyBuildingActivatable:run() end
