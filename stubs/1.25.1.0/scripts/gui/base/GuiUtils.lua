---@meta
-- FS25 1.25.1.0 : gui/base/GuiUtils.lua (stub généré, atlas Lua FS25)

---@class GuiUtils
GuiUtils = {}

---@param data str
---@param refSize refSize
---@param defaultValue defaultValue
---@return array
function GuiUtils.getNormalizedValues(data, refSize, defaultValue) end

---@param colorStr str
---@param defaultValue defaultValue
---@return array
function GuiUtils.getColorArray(colorStr, defaultValue) end

---@param colorStr str
---@param defaultValue defaultValue
---@return array
function GuiUtils.getColorGradientArray(colorStr, defaultValue) end

---@param str str
---@param ref ref
---@param defaultValue defaultValue
---@param rotation any
---@return array
function GuiUtils.getUVs(str, ref, defaultValue, rotation) end

---@param posX posX
---@param posY posY
---@param overlayX overlayX
---@param overlayY overlayY
---@param overlaySizeX overlaySizeX
---@param overlaySizeY overlaySizeY
---@param hotspot hotspot
function GuiUtils.checkOverlayOverlap(posX, posY, overlayX, overlayY, overlaySizeX, overlaySizeY, hotspot) end
