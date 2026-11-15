---@meta
-- FS25 1.25.1.0 : gui/base/GuiOverlay.lua (generated stub, FS25 Lua Atlas)

---@class GuiOverlay
GuiOverlay = {}

---@param self table
---@param overlay table
---@param overlayName string
---@param imageSize table
---@param profile table?
---@param xmlFile integer?
---@param key string?
---@return table
function GuiOverlay.loadOverlay(self, overlay, overlayName, imageSize, profile, xmlFile, key) end

---@param xmlFile integer
---@param key string
---@param overlay table
---@param overlayName string
---@param imageSize table
function GuiOverlay.loadXMLUVs(xmlFile, key, overlay, overlayName, imageSize) end

---@param profile table
---@param overlay table
---@param overlayName string
---@param imageSize table
function GuiOverlay.loadProfileUVs(profile, overlay, overlayName, imageSize) end

---@param xmlFile integer
---@param key string
---@param overlay table
---@param overlayName string
function GuiOverlay.loadXMLColors(xmlFile, key, overlay, overlayName) end

---@param profile table
---@param overlay table
---@param overlayName string
function GuiOverlay.loadProfileColors(profile, overlay, overlayName) end

---@param xmlFile integer
---@param key string
---@param overlay table
---@param overlayName string
function GuiOverlay.loadXMLFilenames(xmlFile, key, overlay, overlayName) end

---@param profile table
---@param overlay table
---@param overlayName string
function GuiOverlay.loadProfileFilenames(profile, overlay, overlayName) end

---@param filename string
---@return string
function GuiOverlay.resolveFilename(filename) end

---@param overlay table
---@param filename string?
---@return table
function GuiOverlay.createOverlay(overlay, filename) end

---@param overlay table
function GuiOverlay.createStateOverlays(overlay) end

---@param overlay table
---@param overlaySrc table
---@param overrideFilename string?
---@return table
function GuiOverlay.copyOverlay(overlay, overlaySrc, overrideFilename) end

---@param overlay table
function GuiOverlay.deleteOverlay(overlay) end

---@param overlay table
---@param state integer
---@return Color
function GuiOverlay.getOverlayColor(overlay, state) end

---@param overlay Overlay
---@param state integer
---@return table
function GuiOverlay.getOverlayUVs(overlay, state) end

---@param overlay table
---@param currentState integer
---@return table
function GuiOverlay.getOverlay(overlay, currentState) end

---@param overlay table
---@param currentState integer
---@return table
function GuiOverlay.getMaskOverlay(overlay, currentState) end

---@param overlay table
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param state integer
---@param clipX1 number?
---@param clipY1 number?
---@param clipX2 number?
---@param clipY2 number?
---@param maskPosX number?
---@param maskPosY number?
---@param maskSizeX number?
---@param maskSizeY number?
function GuiOverlay.renderOverlay(overlay, posX, posY, sizeX, sizeY, state, clipX1, clipY1, clipX2, clipY2, maskPosX, maskPosY, maskSizeX, maskSizeY) end

---@param overlay table
---@param source table
function GuiOverlay.copyColors(overlay, source) end

---@param overlay table
---@param rotation number
---@param centerX number
---@param centerY number
function GuiOverlay.setRotation(overlay, rotation, centerX, centerY) end

---@param overlay table
---@param r number
---@param g number
---@param b number
---@param a number
function GuiOverlay.setColor(overlay, r, g, b, a) end

---@param overlay table
---@param r number
---@param g number
---@param b number
---@param a number
function GuiOverlay.setSelectedColor(overlay, r, g, b, a) end
