---@meta
-- FS25 1.25.1.0 : gui/base/FocusManager.lua (stub généré, atlas Lua FS25)

---@class FocusManager
FocusManager = {}

---@param gui gui
function FocusManager:setGui(gui) end

---@param guiSoundPlayer any
function FocusManager:setSoundPlayer(guiSoundPlayer) end

---@param id any
function FocusManager:getElementById(id) end

function FocusManager:getFocusedElement() end

function FocusManager.serveAutoFocusId() end

---@param xmlFile any
---@param xmlBaseNode any
---@param element any
function FocusManager:loadElementFromXML(xmlFile, xmlBaseNode, element) end

---@param element element
---@param focusId focusId
---@param focusChangeData focusChangeData
---@param focusActive focusActive
---@param isAlwaysFocusedOnOpen isAlwaysFocusedOnOpen
---@return True
function FocusManager:loadElementFromCustomValues(element, focusId, focusChangeData, focusActive, isAlwaysFocusedOnOpen) end

---@param element any
function FocusManager:removeElement(element) end

---@param sourceElement sourceElement
---@param direction direction
---@param targetElement targetElement
function FocusManager:linkElements(sourceElement, direction, targetElement) end

---@param action action
---@param value value
---@param eventUsed eventUsed
---@return True
function FocusManager:inputEvent(action, value, eventUsed) end

---@param inputAction any
---@param value any
function FocusManager.getDirectionForAxisValue(inputAction, value) end

---@param inputAxis inputAxis
---@param value value
---@return isLocked
function FocusManager:isFocusInputLocked(inputAxis, value) end

---@param axisAction inputAxis
---@param delay delay
---@param value value
function FocusManager:lockFocusInput(axisAction, delay, value) end

---@param action action
function FocusManager:releaseMovementFocusInput(action) end

function FocusManager:resetFocusInputLocks() end

---@param x x
---@param y y
---@param boxMinX boxMinX
---@param boxMinY boxMinY
---@param boxMaxX boxMaxX
---@param boxMaxY boxMaxY
---@return Closest
function FocusManager.getClosestPointOnBoundingBox(x, y, boxMinX, boxMinY, boxMaxX, boxMaxY) end

---@param minX any
---@param minY any
---@param maxX any
---@param maxY any
---@param otherBoxMinX any
---@param otherBoxMinY any
---@param otherBoxMaxX any
---@param otherBoxMaxY any
---@param otherCenterX any
---@param otherCenterY any
function FocusManager.getShortestBoundingBoxVector(minX, minY, maxX, maxY, otherBoxMinX, otherBoxMinY, otherBoxMaxX, otherBoxMaxY, otherCenterX, otherCenterY) end

---@param curElement curElement
---@param other other
---@param dirX dirX
---@param dirY dirY
---@param curElementOffsetY curElementOffsetY
---@param closestOther closestOther
---@param closestDistanceSq closestDistanceSq
function FocusManager.checkElementDistance(curElement, other, dirX, dirY, curElementOffsetY, closestOther, closestDistanceSq) end

---@param element element
---@param direction direction
---@return Next
function FocusManager:getNextFocusElement(element, direction) end

---@param element element
---@param direction direction
---@return Focus
function FocusManager.getNestedFocusTarget(element, direction) end

---@param element element
---@param direction isFocusMoving
---@param updateOnly direction
function FocusManager:updateFocus(element, direction, updateOnly) end

---@param element element
function FocusManager:setHighlight(element) end

---@param element element
function FocusManager:unsetHighlight(element) end

---@param element element
---@param direction direction
---@return True
function FocusManager:setFocus(element, direction, ...) end

---@param element element
function FocusManager:unsetFocus(element, ...) end

function FocusManager:requireLock() end

function FocusManager:releaseLock() end

function FocusManager:isLocked() end

---@param direction direction
---@return True
function FocusManager:isDirectionLocked(direction) end

---@param element any
function FocusManager:hasFocus(element) end

---@param forDirections any
---@param substitute any
---@param useSubstituteForFocus any
function FocusManager:getFocusOverrideFunction(forDirections, substitute, useSubstituteForFocus) end

---@param guiName guiName
function FocusManager:deleteGuiFocusData(guiName) end
