---@meta
-- FS25 1.25.1.0 : gui/elements/PictureElement.lua (generated stub, FS25 Lua Atlas)

--- Bitmap element that draws its image with a content mode (no scaling, scale to fill, or scale with aspect fit) based on a declared source image size. It extends BitmapElement and replaces its draw. The helper that computes the adjusted rectangle (getAdjustedPosition) and the CONTENT_MODE constants are not in this dump (UNVERIFIED).
---@class PictureElement : BitmapElement
PictureElement = {}

--- Constructor. Builds a BitmapElement with aspect-fit content mode, a default image size of 2048 by 2048 and aspect ratio 1.
---@param target any
---@param custom_mt any
function PictureElement.new(target, custom_mt) end

--- Loads the base element, reads the imageSize attribute as normalized screen values and recomputes the aspect ratio.
---@param xmlFile any
---@param key any
function PictureElement:loadFromXML(xmlFile, key) end

--- Loads the base profile, then imageSize (with the aspect ratio) and pictureContentMode, which accepts noScaling, scaleToFill or scaleAspectFit; other values leave the mode unchanged.
---@param profile any
---@param applyProfile any
function PictureElement:loadProfile(profile, applyProfile) end

--- Copies content mode, aspect ratio and image size from a source element after the base copy.
---@param src any
function PictureElement:copyAttributes(src) end

--- Renders the overlay in the adjusted rectangle with the given clip bounds, draws a yellow debug frame when debug is enabled, and skips BitmapElement's draw by calling the grandparent draw directly.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function PictureElement:draw(clipX1, clipY1, clipX2, clipY2) end
