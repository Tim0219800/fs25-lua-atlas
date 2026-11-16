---@meta
-- FS25 1.25.1.0 : gui/elements/AnimationElement.lua (generated stub, FS25 Lua Atlas)

--- GUI image element that animates itself, either by stepping UV coordinates across the frames of a sprite sheet (UV_SHIFT, default) or by continuously rotating the overlay. Derived from BitmapElement and uses the "image" layer. Client-side GUI only.
---@class AnimationElement : BitmapElement
AnimationElement = {}

--- Constructor. Defaults: UV_SHIFT mode, 8 frames, 120 ms per step (or per rotation turn), no rotation pivot; creates the element through BitmapElement.
---@param target any
---@param custom_mt any
function AnimationElement.new(target, custom_mt) end

--- Reads animationOffset, animationFrames, animationSpeed, animationRotationPivot, animationUVOffset and animationMode ("uvshift" or anything else = rotate) from the XML node, remembers the default UVs, then computes frame data.
---@param xmlFile any
---@param key any
function AnimationElement:loadFromXML(xmlFile, key) end

--- Same settings as the XML loader (offset, frames, speed, rotation pivot, UV offset, mode) but read from a GUI profile. Does not recompute frame data itself.
---@param profile any
---@param applyProfile any
function AnimationElement:loadProfile(profile, applyProfile) end

--- Copies the animation settings and default UVs from a source element, resets the image UVs to those defaults and recomputes the frame data.
---@param src any
function AnimationElement:copyAttributes(src) end

--- Per-frame update. In UV_SHIFT mode advances to the next frame (wrapping to 0) each time the timer of animationSpeed ms elapses; in ROTATE mode turns the overlay by a full turn per animationSpeed ms.
---@param dt any
function AnimationElement:update(dt) end

--- In UV_SHIFT mode, sets the image UVs to the horizontal slice of the current frame (start position plus frame size and optional gap times the frame index). No effect in rotate mode.
function AnimationElement:updateAnimationUVs() end

--- Applies the current rotation angle to the overlay around the pivot (the custom rotation pivot if set, otherwise the element pivot) scaled by the absolute size.
function AnimationElement:updateRotation() end

--- If an overlay exists, derives the width of one frame and the start position from the overlay UVs, frame count and gap, then refreshes the UVs.
function AnimationElement:setAnimationData() end
