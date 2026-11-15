---@meta
-- FS25 1.25.1.0 : gui/elements/ButtonElement.lua (stub généré, atlas Lua FS25)

---@class ButtonElement : TextElement
ButtonElement = {}

---@param target any
---@param custom_mt any
function ButtonElement.new(target, custom_mt) end

function ButtonElement:delete() end

---@param xmlFile any
---@param key any
function ButtonElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function ButtonElement:loadProfile(profile, applyProfile) end

---@param src any
function ButtonElement:copyAttributes(src) end

---@param profile profile
---@param xmlFile xmlFile
---@param key key
function ButtonElement:loadInputGlyphColors(profile, xmlFile, key) end

---@param isKeyboardMode any
---@param isTouchMode any
---@param isGamepadMode any
function ButtonElement:setInputMode(isKeyboardMode, isTouchMode, isGamepadMode) end

---@param alpha any
function ButtonElement:setAlpha(alpha) end

---@param disabled any
function ButtonElement:setDisabled(disabled) end

---@param inputActionName any
function ButtonElement:setInputAction(inputActionName) end

function ButtonElement:onOpen() end

function ButtonElement:onClose() end

function ButtonElement:reset() end

---@param filename any
---@param iconFilename any
function ButtonElement:setImageFilename(filename, iconFilename) end

---@param backgroundUVs any
---@param iconUVs any
function ButtonElement:setImageUVs(backgroundUVs, iconUVs) end

---@param backgroundSliceId any
---@param iconSliceId any
function ButtonElement:setImageSlice(backgroundSliceId, iconSliceId) end

function ButtonElement:getIsActive() end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function ButtonElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function ButtonElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
function ButtonElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

---@param textWidth any
---@param textHeight any
function ButtonElement:getIconOffset(textWidth, textHeight) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function ButtonElement:draw(clipX1, clipY1, clipX2, clipY2) end

---@param textOffsetX number
---@param textOffsetY number
---@return number
---@return number
function ButtonElement:getIconModifiedTextOffset(textOffsetX, textOffsetY) end

function ButtonElement:getTextOffset() end

function ButtonElement:getText2Offset() end

function ButtonElement:getIconSize() end

---@param x any
---@param y any
function ButtonElement:setIconSize(x, y) end

function ButtonElement:canReceiveFocus() end

function ButtonElement:onFocusLeave() end

function ButtonElement:onFocusEnter() end

function ButtonElement:onHighlight() end

function ButtonElement:onHighlightRemove() end

function ButtonElement:onFocusActivate() end

function ButtonElement:getIsPressed() end

function ButtonElement:getOverlayState() end

---@param forceTextSize any
function ButtonElement:updateSize(forceTextSize) end

---@param text any
---@param forceTextSize any
---@param isInitializing any
---@param forceScrollingParameterUpdate any
function ButtonElement:setText(text, forceTextSize, isInitializing, forceScrollingParameterUpdate) end

---@param size any
function ButtonElement:setTextSize(size) end

---@param soundName any
function ButtonElement:setClickSound(soundName) end
