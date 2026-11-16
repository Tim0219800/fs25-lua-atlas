---@meta
-- FS25 1.25.1.0 : gui/hud/HUDSliderElement.lua (generated stub, FS25 Lua Atlas)

--- HUD slider for touch devices (mobile UI). It registers three touch areas (down, always, up) on a background overlay through g_touchHandler and moves the wrapped overlay along one axis between minimum and maximum translations, with optional center and lock positions. Extends HUDElement. Only the constructor is in this file; callbacks such as onSliderDown, setCallback, setAxisPosition or resetSlider are referenced by other code but not defined here (UNVERIFIED where they come from).
---@class HUDSliderElement : HUDElement
HUDSliderElement = {}

--- Builds the slider around an overlay and a background overlay, storing axis, min/center/max/lock translations and default speed 0.0002, then registers three touch areas on the background and sets their pressed-size gain. Note: its doc comment describes FrameElement parameters, not these.
---@param overlay number
---@param backgroundOverlay number
---@param touchAreaOffsetX number
---@param touchAreaOffsetY number
---@param touchAreaPressedGain table?
---@param transAxis any
---@param minTrans any
---@param centerTrans any
---@param maxTrans any
---@param lockTrans any
function HUDSliderElement.new(overlay, backgroundOverlay, touchAreaOffsetX, touchAreaOffsetY, touchAreaPressedGain, transAxis, minTrans, centerTrans, maxTrans, lockTrans) end
