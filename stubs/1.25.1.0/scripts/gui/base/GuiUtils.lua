---@meta
-- FS25 1.25.1.0 : gui/base/GuiUtils.lua (generated stub, FS25 Lua Atlas)

--- Static helpers that convert GUI XML attribute strings into numbers: normalized sizes (px / dp units), colors, UV rectangles, plus a point/overlay hit test. Used by the GUI layer when reading layouts and texture configs. Some functions called from other files (for example GuiUtils.rotateUVs) are not defined in this file.
---@class GuiUtils
GuiUtils = {}

--- Splits a space-separated string (or reads a table) into numbers and normalizes them against a reference size; handles `px` and `dp` suffixes and alternates X/Y references. Missing entries are repeated from the default's length, CSS-style; returns the default if input is nil.
---@param data str
---@param refSize refSize
---@param defaultValue defaultValue
---@return array
function GuiUtils.getNormalizedValues(data, refSize, defaultValue) end

--- Parses a string into a 4-number {r, g, b, a} array through `string.getVector(str, 4)`, or returns the given default when parsing fails.
---@param colorStr str
---@param defaultValue defaultValue
---@return array
function GuiUtils.getColorArray(colorStr, defaultValue) end

--- Parses a string into a vector and accepts it only if it has 4 numbers (one color) or 16 numbers (four colors, one per corner); otherwise returns the default.
---@param colorStr str
---@param defaultValue defaultValue
---@return array
function GuiUtils.getColorGradientArray(colorStr, defaultValue) end

--- Converts a string "x y sizeX sizeY" (pixels) into the 8-value UV array, using the reference texture size (default 1024x1024), flipping V. Optionally rotates the result via `GuiUtils.rotateUVs` (not in this file, UNVERIFIED); logs a dev error if unreadable.
---@param str str
---@param ref ref
---@param defaultValue defaultValue
---@param rotation any
---@return array
function GuiUtils.getUVs(str, ref, defaultValue, rotation) end

--- Returns true if a point lies inside the overlay rectangle, which must have positive size. With a 4-number hotspot table the rectangle bounds are shifted by those offsets.
---@param posX posX
---@param posY posY
---@param overlayX overlayX
---@param overlayY overlayY
---@param overlaySizeX overlaySizeX
---@param overlaySizeY overlaySizeY
---@param hotspot hotspot
function GuiUtils.checkOverlayOverlap(posX, posY, overlayX, overlayY, overlaySizeX, overlaySizeY, hotspot) end
