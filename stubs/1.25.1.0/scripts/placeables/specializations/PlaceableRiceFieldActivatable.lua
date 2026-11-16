---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableRiceFieldActivatable.lua (generated stub, FS25 Lua Atlas)

--- Helper class (not a specialization) that lets the local player interact with one rice field of a PlaceableRiceField. It follows the activatable interface (getIsActivatable, getDistance, run) and opens RiceFieldDialog to choose a water level target. Client-side UI object.
---@class PlaceableRiceFieldActivatable
PlaceableRiceFieldActivatable = {}

--- Creates the activatable for a rice field placeable with no field selected yet and the generic interact text.
---@param riceFieldPlaceable any
function PlaceableRiceFieldActivatable.new(riceFieldPlaceable) end

--- True only if a field index is set, the field exists and the local player's farm can access the land at the field's player trigger.
function PlaceableRiceFieldActivatable:getIsActivatable() end

--- Sets which field of the placeable this activatable targets (nil clears it).
---@param fieldIndex any
function PlaceableRiceFieldActivatable:setRiceFieldIndex(fieldIndex) end

--- Returns the horizontal distance (XZ) from the given position to the field's player trigger, or math.huge if no field is selected or it has no trigger node.
---@param posX any
---@param posY any
---@param posZ any
function PlaceableRiceFieldActivatable:getDistance(posX, posY, posZ) end

--- Opens RiceFieldDialog; if accepted, sets the field's water height target to the max water level times the chosen percentage via setWaterHeightTarget.
function PlaceableRiceFieldActivatable:run() end
