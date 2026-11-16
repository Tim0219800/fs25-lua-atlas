---@meta
-- FS25 1.25.1.0 : gui/base/Overlay.lua (generated stub, FS25 Lua Atlas)

--- Basic 2D image overlay: wraps an engine image overlay handle with position, size, alignment, UVs, color, rotation, scale and visibility, and renders it with optional clipping. Used throughout the HUD and menus, and created by `OverlayManager` from texture slices. Constants such as `Overlay.DEFAULT_UVS` and the ALIGN_* values are defined elsewhere (UNVERIFIED). Client-side only.
---@class Overlay
Overlay = {}

--- Creates an overlay at x, y with the given size, loading the image file if a filename is given (otherwise the engine id stays 0 and nothing is drawn). Defaults: white, bottom-left alignment, no rotation, full UVs.
---@param overlayFilename string?
---@param x number
---@param y number
---@param width number
---@param height number
---@param customMt table?
---@return Overlay
function Overlay.new(overlayFilename, x, y, width, height, customMt) end

--- Releases the engine image handle if one exists. The overlay must not be rendered afterwards.
function Overlay:delete() end

--- Sets the RGBA tint multiplied with the texture; nil channels keep their current value, and the engine is only called when something changes.
---@param r number?
---@param g number?
---@param b number?
---@param a number?
function Overlay:setColor(r, g, b, a) end

--- Stores and applies 8 UV values defining the displayed texture area; ignored when the overlay has no image.
---@param uvs array
function Overlay:setUVs(uvs) end

--- Looks up the slice "prefix.id" in `g_overlayManager` and applies its UVs; does nothing if the slice is unknown or there is no image. Size is not changed.
---@param sliceId string
function Overlay:setSliceId(sliceId) end

--- Sets the screen position (0 to 1); nil keeps the current coordinate. Alignment offsets are applied separately at render time.
---@param x number?
---@param y number?
function Overlay:setPosition(x, y) end

--- Returns the stored x and y position, without alignment offsets.
---@return number
---@return number
function Overlay:getPosition() end

--- Sets width and height (nil keeps the current one) and recomputes the alignment offsets. Does not change the scale factors.
---@param width number?
---@param height number?
function Overlay:setDimension(width, height) end

--- Restores the width and height given at construction and resets the scale to 1.
function Overlay:resetDimensions() end

--- Flips the image horizontally by swapping UV pairs, or restores normal UVs. Only acts if the state changes and an image exists.
---@param invertX boolean
function Overlay:setInvertX(invertX) end

--- Sets rotation in radians around a pivot given as an offset from the overlay position (screen units); the engine is only called on change.
---@param rotation number
---@param centerX number
---@param centerY number
function Overlay:setRotation(rotation, centerX, centerY) end

--- Sets the size as default size times the given factors, stores the factors and refreshes the alignment offsets.
---@param scaleWidth number
---@param scaleHeight number
function Overlay:setScale(scaleWidth, scaleHeight) end

--- Returns the current width and height scale factors.
---@return number
---@return number
function Overlay:getScale() end

--- Draws the overlay if visible, with an image and alpha above 0. With clip bounds it renders a clipped part via temporary UVs (`Overlay.getClippingUVs`, not in this file, UNVERIFIED) and restores them; also draws debug frames in debug builds.
---@param clipX1 number?
---@param clipY1 number?
---@param clipX2 number?
---@param clipY2 number?
function Overlay:render(clipX1, clipY1, clipX2, clipY2) end

--- Sets vertical (bottom, middle, top) and horizontal (left, center, right) alignment and computes the draw offsets from the current size; nil values fall back to bottom/left.
---@param vertical integer?
---@param horizontal integer?
function Overlay:setAlignment(vertical, horizontal) end

--- Shows or hides the overlay; hidden overlays skip drawing in `render`.
---@param visible boolean?
function Overlay:setIsVisible(visible) end

--- Returns whether the overlay is currently set visible.
---@return boolean
function Overlay:getIsVisible() end

--- Switches to another image file: deletes the old engine handle and creates a new one when the filename differs. Previously set UVs are not reapplied here.
---@param overlayFilename string
function Overlay:setImage(overlayFilename) end
