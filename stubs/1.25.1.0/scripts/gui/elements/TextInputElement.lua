---@meta
-- FS25 1.25.1.0 : gui/elements/TextInputElement.lua (stub généré, atlas Lua FS25)

---@class TextInputElement : ButtonElement
TextInputElement = {}

---@param target any
---@param custom_mt any
function TextInputElement.new(target, custom_mt) end

function TextInputElement:delete() end

---@param str any
function TextInputElement:translate(str) end

---@param xmlFile any
---@param key any
function TextInputElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function TextInputElement:loadProfile(profile, applyProfile) end

---@param src any
function TextInputElement:copyAttributes(src) end

function TextInputElement:finalize() end

function TextInputElement:getIsActive() end

---@param isCapturing any
function TextInputElement:setCaptureInput(isCapturing) end

---@param alpha any
function TextInputElement:setAlpha(alpha) end

function TextInputElement:getDoRenderText() end

function TextInputElement:reset() end

---@param text any
function TextInputElement:setText(text) end

---@param force any
function TextInputElement:setForcePressed(force) end

---@param unicode any
function TextInputElement:getIsUnicodeAllowed(unicode) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function TextInputElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param isLeftCtrlPressed any
function TextInputElement:moveCursorLeft(isLeftCtrlPressed) end

---@param isLeftCtrlPressed any
function TextInputElement:moveCursorRight(isLeftCtrlPressed) end

---@param position any
function TextInputElement:setCursorPosition(position) end

---@param deleteRightCharacterFromCursor any
function TextInputElement:deleteText(deleteRightCharacterFromCursor) end

function TextInputElement:stopSpecialKeyRepeating() end

function TextInputElement:openIme() end

function TextInputElement:abortIme() end

---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
function TextInputElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

---@param action any
---@param value any
---@param eventUsed any
function TextInputElement:inputEvent(action, value, eventUsed) end

---@param dt any
function TextInputElement:update(dt) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function TextInputElement:draw(clipX1, clipY1, clipX2, clipY2) end

---@param direction any
function TextInputElement:shouldFocusChange(direction) end

function TextInputElement:onFocusLeave() end

function TextInputElement:onFocusActivate() end

function TextInputElement:onClose() end

---@param text any
---@param textXPos any
---@param displacementX any
---@param textYPos any
function TextInputElement:drawTextPart(text, textXPos, displacementX, textYPos) end

---@param textXPos any
---@param displacementX any
---@param textYPos any
function TextInputElement:drawCursor(textXPos, displacementX, textYPos) end

function TextInputElement:updateVisibleTextElements() end

---@param text any
---@param textSize any
---@param availableWidth any
---@param trimFront any
function TextInputElement.limitTextToAvailableWidth(text, textSize, availableWidth, trimFront) end

function TextInputElement:getAvailableTextWidth() end

function TextInputElement:getNeededTextWidth() end

function TextInputElement:getText() end
