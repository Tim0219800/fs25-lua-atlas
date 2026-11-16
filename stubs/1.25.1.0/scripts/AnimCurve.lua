---@meta
-- FS25 1.25.1.0 : AnimCurve.lua (generated stub, FS25 Lua Atlas)

--- Animation curve class holding keyframes and a current/max time. This dump contains only `reset`; the constructor and interpolation code are absent, so the rest is UNVERIFIED.
---@class AnimCurve
AnimCurve = {}

--- Clears all keyframes and sets the keyframe count, current time and max time back to 0. The interpolator is kept.
function AnimCurve:reset() end
