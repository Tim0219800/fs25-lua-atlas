---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelDebug.lua (generated stub, FS25 Lua Atlas)

--- Debug helper attached to a wheel. It draws friction-versus-slip graphs for the longitudinal and lateral tire forces on screen and fills the wheel debug table (slip, load, friction, suspension compression, rpm, steering angle, radius, stiffness, mass, tire type, deformation, contact type). It relies on engine wheel-shape functions that are not in the dump (UNVERIFIED details).
---@class WheelDebug
WheelDebug = {}

--- Creates the debug helper for a wheel and remembers its vehicle.
---@param wheel any
function WheelDebug.new(wheel) end

--- Frees the friction graphs and the slip overlays if they were created.
function WheelDebug:delete() end

--- Draws the longitudinal and lateral friction curves for this wheel (positioned by wheel index) and overlays the current slip/force point. Does nothing until the physics wheel shape exists. Uses engine functions such as `getWheelShapeSlip` and `computeWheelShapeTireForces` (UNVERIFIED behaviour).
function WheelDebug:drawSlipGraphs() end

--- Returns the 15 column headers of the wheel debug table.
function WheelDebug.getDebugValueHeader() end

--- Appends this wheel's debug values to the given table columns, or 'n/a' in every column when the wheel shape is not created. Includes a suspension compression percentage and the max tire deformation across visual parts.
---@param debugTable any
function WheelDebug:fillDebugValues(debugTable) end
