---@meta
-- FS25 1.25.1.0 : utils/SplineUtil.lua (stub généré, atlas Lua FS25)

---@class SplineUtil
SplineUtil = {}

---@param t number
---@return number
function SplineUtil.getValidSplineTime(t) end

---@param spline integer
---@param t number
---@param posX number
---@param posZ number
---@param checkDistance number
---@param maxSteps number
---@return number
---@return integer
function SplineUtil.getSplineTimeAtWorldPos(spline, t, posX, posZ, checkDistance, maxSteps) end

---@param spline integer
---@param splineTime number
---@return number
function SplineUtil.getSlopeAngle(spline, splineTime) end

---@param splineNode integer
---@return number
---@return number
---@return number
function SplineUtil.getCenterPosition(splineNode) end

---@param cubicSpline integer
---@param thresholdAngleDeg number?
---@param stepSizeInMeter number?
---@return array
function SplineUtil.convertToLinearSplineXZ(cubicSpline, thresholdAngleDeg, stepSizeInMeter) end

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
