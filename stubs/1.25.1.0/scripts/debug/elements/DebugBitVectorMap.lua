---@meta
-- FS25 1.25.1.0 : debug/elements/DebugBitVectorMap.lua (generated stub, FS25 Lua Atlas)

--- DebugBitVectorMap draws a coloured grid of small cells on the terrain around a centre, where each cell colour comes from a value returned by a check function (default palette: 0 red, 1 green, 2 blue, undefined dark grey; default radius 15, cell size 0.5, optional legend). It is not a DebugElement subclass; it has its own `draw`. The grid routine `drawAroundCenter` is not in this dump (UNVERIFIED).
---@class DebugBitVectorMap
DebugBitVectorMap = {}

--- Creates the grid object with default radius, cell size, opacity, value-to-colour table, undefined-value colour, Y offset, padding factor and legend enabled.
---@param customMt table?
---@return DebugBitVectorMap
function DebugBitVectorMap.new(customMt) end

--- Draws the grid centred on the AI vehicle's root node (skipped if the vehicle is deleted or being deleted) with `aiAreaCheck`, or else centred on the active camera with the custom function. Does nothing if neither is set.
function DebugBitVectorMap:draw() end

--- Binds the grid to an AI vehicle so cell values come from the vehicle's AI work area check. Returns self for chaining.
---@param vehicle table
---@return DebugBitVectorMap
function DebugBitVectorMap:createWithAIVehicle(vehicle) end

--- Sets a custom function that supplies the cell value for each area; the grid is then drawn around the active camera. Returns self.
---@param customFunc function
---@return DebugBitVectorMap
function DebugBitVectorMap:createWithCustomFunc(customFunc) end

--- Stores a function for extra drawing or information; how and when it is called is in code absent from this dump (UNVERIFIED). Returns self.
---@param drawInfoFunc function
---@return DebugBitVectorMap
function DebugBitVectorMap:setAdditionalDrawInfoFunc(drawInfoFunc) end

--- Returns the result of `AIVehicleUtil.getAIAreaOfVehicle` for the stored AI vehicle on the given parallelogram in world XZ coordinates (start, width, height corners).
---@param startWorldX any
---@param startWorldZ any
---@param widthWorldX any
---@param widthWorldZ any
---@param heightWorldX any
---@param heightWorldZ any
function DebugBitVectorMap:aiAreaCheck(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end
