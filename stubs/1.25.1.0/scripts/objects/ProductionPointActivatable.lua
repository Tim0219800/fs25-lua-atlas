---@meta
-- FS25 1.25.1.0 : objects/ProductionPointActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable shown when the player stands in a production point's interaction trigger. Depending on ownership it offers to buy the production point or to manage it (open the production menu). Created and registered by ProductionPoint's interaction trigger callback.
---@class ProductionPointActivatable
ProductionPointActivatable = {}

--- Creates the activatable for a production point, keeps its mission and sets the action text.
---@param productionPoint any
function ProductionPointActivatable.new(productionPoint) end

--- Sets the action text to 'buy' when the point is unowned and buying uses the interaction trigger, otherwise to 'manage'.
function ProductionPointActivatable:updateText() end

--- True if the local farm has access to the production point according to the access handler.
function ProductionPointActivatable:getIsActivatable() end

--- If the point is unowned (EVERYONE) and buyable through the trigger, starts the purchase request; if the local farm owns it, opens the production menu.
function ProductionPointActivatable:run() end

--- Returns the distance from the position to the interaction trigger node for an owned point not bought through the trigger; otherwise math.huge so it is never preferred.
---@param x any
---@param y any
---@param z any
function ProductionPointActivatable:getDistance(x, y, z) end
