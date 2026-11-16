---@meta
-- FS25 1.25.1.0 : misc/BezierCurve.lua (generated stub, FS25 Lua Atlas)

--- Cubic Bezier curve for easing animations, with the end points fixed at (0,0) and (1,1) and two free control points. It keeps polynomial coefficients for each axis and recomputes them when a control point changes. Only these setters are in the dump; the constructor and sampling code are absent from this file's visible code (UNVERIFIED).
---@class BezierCurve
BezierCurve = {}

--- Recomputes the cubic coefficients ax, bx, cx and ay, by, cy from the two control points; called by every setter.
function BezierCurve:recalculateCoefficients() end

--- Sets the first control point X, clamped to 0..1, then recalculates the coefficients.
---@param newValue number
function BezierCurve:setPositionX1(newValue) end

--- Sets the first control point Y, clamped to 0..1 (the in-code doc does not mention the clamp), then recalculates the coefficients.
---@param newValue number
function BezierCurve:setPositionY1(newValue) end

--- Sets the second control point X, clamped to 0..1, then recalculates the coefficients.
---@param newValue number
function BezierCurve:setPositionX2(newValue) end

--- Sets the second control point Y, clamped to 0..1, then recalculates the coefficients.
---@param newValue number
function BezierCurve:setPositionY2(newValue) end
