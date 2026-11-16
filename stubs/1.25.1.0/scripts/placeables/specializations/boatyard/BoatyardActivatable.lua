---@meta
-- FS25 1.25.1.0 : placeables/specializations/boatyard/BoatyardActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object that offers to buy a boatyard that has no owner yet. The prompt includes the boatyard name, and running it requests the purchase if the boatyard is still unowned.
---@class BoatyardActivatable
BoatyardActivatable = {}

--- Creates the activatable for a boatyard and builds the prompt from `action_buyOBJECT` and the boatyard name.
---@param boatyard any
function BoatyardActivatable.new(boatyard) end

--- Returns true only while the boatyard owner is the unowned marker (`AccessHandler.EVERYONE`).
function BoatyardActivatable:getIsActivatable() end

--- If the boatyard is still unowned, calls its `buyRequest`.
function BoatyardActivatable:run() end
