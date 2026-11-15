---@meta
-- FS25 1.25.1.0 : gui/elements/IngameMapElement.lua (stub généré, atlas Lua FS25)

---@class IngameMapElement : GuiElement
IngameMapElement = {}

---@param target any
---@param custom_mt any
function IngameMapElement.new(target, custom_mt) end

function IngameMapElement:delete() end

---@param xmlFile any
---@param key any
function IngameMapElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function IngameMapElement:loadProfile(profile, applyProfile) end

---@param src any
function IngameMapElement:copyAttributes(src) end

function IngameMapElement:onGuiSetupFinished() end

---@param screenX any
---@param screenY any
---@param width any
---@param height any
function IngameMapElement:addCursorDeadzone(screenX, screenY, width, height) end

function IngameMapElement:clearCursorDeadzones() end

---@param inputScreenX any
---@param inputScreenY any
function IngameMapElement:isInputInDeadzones(inputScreenX, inputScreenY) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function IngameMapElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function IngameMapElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

---@param x any
---@param y any
function IngameMapElement:moveCenter(x, y) end

---@param hotspot hotspot
---@param extraOffsetX any
function IngameMapElement:panToHotspot(hotspot, extraOffsetX) end

---@param direction zoomTarget
---@param zoomTarget any
function IngameMapElement:zoom(direction, zoomTarget) end

---@param dt any
function IngameMapElement:update(dt) end

function IngameMapElement:resetFrameInputState() end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function IngameMapElement:draw(clipX1, clipY1, clipX2, clipY2) end

function IngameMapElement:onOpen() end

function IngameMapElement:onClose() end

function IngameMapElement:reset() end

---@param deltaX any
---@param deltaY any
---@param dt any
function IngameMapElement:updateCursor(deltaX, deltaY, dt) end

---@param posX any
---@param posY any
function IngameMapElement:selectHotspotAt(posX, posY) end

---@param hotspots any
---@param posX any
---@param posY any
function IngameMapElement:selectHotspotFrom(hotspots, posX, posY) end

---@param posX any
---@param posY any
function IngameMapElement:getLocalPosition(posX, posY) end

function IngameMapElement:getLocalPointerTarget() end

---@param localPosX any
---@param localPosY any
function IngameMapElement:onClickMap(localPosX, localPosY) end

---@param localPosX any
---@param localPosY any
function IngameMapElement:localToWorldPos(localPosX, localPosY) end

---@param x any
---@param z any
function IngameMapElement:isPointVisible(x, z) end

---@param ingameMap any
function IngameMapElement:setIngameMap(ingameMap) end

---@param terrainSize any
function IngameMapElement:setTerrainSize(terrainSize) end

function IngameMapElement:registerActionEvents() end

function IngameMapElement:removeActionEvents() end

---@param _ any
---@param inputValue any
function IngameMapElement:onHorizontalCursorInput(_, inputValue) end

---@param _ any
---@param inputValue any
function IngameMapElement:onVerticalCursorInput(_, inputValue) end

function IngameMapElement:onAccept() end

---@param _ inputValue
---@param inputValue direction
---@param direction any
function IngameMapElement:onZoomInput(_, inputValue, direction) end

---@param offset number
---@param pinchCenterX pinchCenterX
---@param pinchCenterY pinchCenterY
---@param distance number
function IngameMapElement:onPinchEvent(offset, pinchCenterX, pinchCenterY, distance) end

function IngameMapElement:checkAndResetMouse() end
