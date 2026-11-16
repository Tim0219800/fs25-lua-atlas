---@meta
-- FS25 1.25.1.0 : placeables/specializations/activatables/FactoryActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object that offers to buy a factory that has no owner yet. The prompt text includes the factory name and running it requests the purchase when the factory is still unowned.
---@class FactoryActivatable
FactoryActivatable = {}

--- Creates the activatable for a factory and builds the prompt from `action_buyOBJECT` and the factory name.
---@param factory any
function FactoryActivatable.new(factory) end

--- Returns true only while the factory owner is the unowned marker (`AccessHandler.EVERYONE`).
function FactoryActivatable:getIsActivatable() end

--- If the factory is still unowned, calls its `buyRequest`.
function FactoryActivatable:run() end
