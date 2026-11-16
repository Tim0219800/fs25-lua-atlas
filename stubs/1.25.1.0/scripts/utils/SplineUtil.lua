---@meta
-- FS25 1.25.1.0 : utils/SplineUtil.lua (generated stub, FS25 Lua Atlas)

--- Static helpers for spline nodes: time clamping, nearest-point searches, slope, center, conversion of a cubic spline to a linear polyline on XZ, and closest edit point queries. The dump has signatures with annotations but no bodies, so behaviour comes from the annotations and is UNVERIFIED.
---@class SplineUtil
SplineUtil = {}

--- Signature only (no body in the SDK dump): Turns an input into a valid spline time in the 0 to 1 range; whether it clamps or wraps is not shown.
---@param t number
---@return number
function SplineUtil.getValidSplineTime(t) end

--- Signature only (no body in the SDK dump): Searches for the spline time nearest a world position (x and z only), starting at time t and stepping by a check distance up to a maximum step count. Returns the time and the steps used.
---@param spline integer
---@param t number
---@param posX number
---@param posZ number
---@param checkDistance number
---@param maxSteps number
---@return number
---@return integer
function SplineUtil.getSplineTimeAtWorldPos(spline, t, posX, posZ, checkDistance, maxSteps) end

--- Signature only (no body in the SDK dump): Returns the slope angle in radians of the spline at a given time.
---@param spline integer
---@param splineTime number
---@return number
function SplineUtil.getSlopeAngle(spline, splineTime) end

--- Signature only (no body in the SDK dump): Returns the x, y, z center position of a spline node; how the center is computed is not shown.
---@param splineNode integer
---@return number
---@return number
---@return number
function SplineUtil.getCenterPosition(splineNode) end

--- Signature only (no body in the SDK dump): Converts a cubic spline into an array of positions approximating it linearly on XZ, with an optional angle threshold (default 5 degrees) and step size (default 0.5 m).
---@param cubicSpline integer
---@param thresholdAngleDeg number?
---@param stepSizeInMeter number?
---@return array
function SplineUtil.convertToLinearSplineXZ(cubicSpline, thresholdAngleDeg, stepSizeInMeter) end

--- Signature only (no body in the SDK dump): Finds the edit point nearest in 3D to a world position by exact search over all edit points. Returns a 0-based index, distance and position, or nil if the node is invalid.
---@param splineNode integer
---@param posX number
---@param posY number
---@param posZ number
---@return integer?
---@return number?
---@return number?
---@return number?
---@return number?
function SplineUtil.getClosestEditPoint(splineNode, posX, posY, posZ) end

--- Signature only (no body in the SDK dump): Projects a world position onto the curve and returns the closest curve point, its spline time and the 0-based indices of the edit points before and after it (nil outside the ends). An optional error tolerance can be given.
---@param splineNode integer
---@param posX number
---@param posY number
---@param posZ number
---@param eps number?
---@return number?
---@return number?
---@return number?
---@return number?
---@return integer?
---@return integer?
function SplineUtil.getClosestEditPointsOnCurve(splineNode, posX, posY, posZ, eps) end
