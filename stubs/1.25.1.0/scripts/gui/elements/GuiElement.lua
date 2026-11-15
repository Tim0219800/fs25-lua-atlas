---@meta
-- FS25 1.25.1.0 : gui/elements/GuiElement.lua (generated stub, FS25 Lua Atlas)

---@class GuiElement
GuiElement = {}

---@param target target
---@param custom_mt any
function GuiElement.new(target, custom_mt) end

---@param xmlFile xmlFile
---@param key key
function GuiElement:loadFromXML(xmlFile, key) end

---@param profile profile
---@param applyProfile boolean
function GuiElement:loadProfile(profile, applyProfile) end

---@param profileName profileName
---@param blockSizeUpdate boolean?
---@param ignoreSameProfile boolean?
function GuiElement:applyProfile(profileName, blockSizeUpdate, ignoreSameProfile) end

function GuiElement:resolveSizeString() end

function GuiElement:delete() end

---@param parent table
---@param includeId boolean?
---@param suppressOnCreate boolean?
---@param blockFocusHandlingReload any
---@return table
function GuiElement:clone(parent, includeId, suppressOnCreate, blockFocusHandlingReload) end

---@param src table
function GuiElement:copyAttributes(src) end

function GuiElement:onGuiSetupFinished() end

---@param sideIndex integer
---@param isVisible any
function GuiElement:toggleFrameSide(sideIndex, isVisible) end

function GuiElement:updateFramePosition() end

---@param verticalPart any
---@param horizontalPart any
---@param isLeft any
function GuiElement:cutFrameBordersHorizontal(verticalPart, horizontalPart, isLeft) end

---@param horizontalPart any
---@param verticalPart any
---@param isBottom any
function GuiElement:cutFrameBordersVertical(horizontalPart, verticalPart, isBottom) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function GuiElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function GuiElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

---@param action action
---@param value value
---@param eventUsed eventUsed
---@return True
function GuiElement:inputEvent(action, value, eventUsed) end

---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
---@return True
function GuiElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

---@param dt any
function GuiElement:update(dt) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function GuiElement:draw(clipX1, clipY1, clipX2, clipY2) end

function GuiElement:onOpen() end

function GuiElement:onClose() end

---@param direction any
function GuiElement:shouldFocusChange(direction) end

function GuiElement:canReceiveFocus() end

function GuiElement:onFocusLeave() end

function GuiElement:onFocusEnter() end

function GuiElement:onFocusActivate() end

function GuiElement:onHighlight() end

function GuiElement:onHighlightRemove() end

function GuiElement:getHandleFocus() end

---@param handleFocus any
function GuiElement:setHandleFocus(handleFocus) end

---@param element any
function GuiElement:addElement(element) end

---@param element any
function GuiElement:removeElement(element) end

function GuiElement:unlinkElement() end

function GuiElement:updateAbsolutePosition() end

function GuiElement:reset() end

---@param element any
function GuiElement:isChildOf(element) end

---@param incomingDirection incomingDirection
---@param moveDirection moveDirection
---@return GuiElement
function GuiElement:getFocusTarget(incomingDirection, moveDirection) end

---@param x any
---@param y any
function GuiElement:setPosition(x, y) end

---@param dx any
---@param dy any
function GuiElement:move(dx, dy) end

---@param x any
---@param y any
function GuiElement:setAbsolutePosition(x, y) end

---@param x boolean
---@param y any
---@param updateChildAnchorDeltas boolean
function GuiElement:setSize(x, y, updateChildAnchorDeltas) end

---@param visible any
function GuiElement:setVisible(visible) end

function GuiElement:getIsVisible() end

function GuiElement:getIsVisibleNonRec() end

---@param disabled disabled
---@param blockDelegate any
function GuiElement:setDisabled(disabled, blockDelegate) end

function GuiElement:getIsDisabled() end

---@param selected selected
---@param blockDelegate any
function GuiElement:setSelected(selected, blockDelegate) end

function GuiElement:getIsSelected() end

---@param focused focused
---@param blockDelegate any
function GuiElement:setFocused(focused, blockDelegate) end

function GuiElement:getIsFocused() end

function GuiElement:getIsHighlighted() end

function GuiElement:getOverlayState() end

---@param factor any
function GuiElement:fadeIn(factor) end

---@param factor any
function GuiElement:fadeOut(factor) end

---@param alpha alpha
function GuiElement:setAlpha(alpha) end

function GuiElement:getIsActive() end

function GuiElement:getIsActiveNonRec() end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function GuiElement:getClipArea(clipX1, clipY1, clipX2, clipY2) end

---@param doSuppress any
function GuiElement:setSoundSuppressed(doSuppress) end

function GuiElement:getSoundSuppressed() end

---@param accumulator accumulator
---@param rootElement rootElement?
---@param predicateFunction predicateFunction?
function GuiElement:findDescendantsRec(accumulator, rootElement, predicateFunction) end

---@param predicateFunction any
---@return List
function GuiElement:getDescendants(predicateFunction) end

---@param predicateFunction any
---@return First
function GuiElement:getFirstDescendant(predicateFunction) end

---@param id id
---@return Element
function GuiElement:getDescendantById(id) end

---@param name name
---@return Element
function GuiElement:getDescendantByName(name) end

function GuiElement:fixThinLines() end

---@return number
---@return number
---@return number
---@return number
function GuiElement:getParentBorders() end

---@return number
---@return number
---@return number
---@return number
function GuiElement:getBorders() end

---@return number
---@return number
---@return number
---@return number
function GuiElement:getParentOriginalBorders() end

---@return number
---@return number
---@return number
---@return number
function GuiElement:getOriginalBorders() end

---@return number
---@return number
function GuiElement:getCenter() end

---@return number
---@return number
function GuiElement:getAspectScale() end

---@param xmlFile xmlFile
---@param key key
---@param funcName funcName
function GuiElement:addCallback(xmlFile, key, funcName) end

---@param name any
function GuiElement:raiseCallback(name, ...) end

---@param elementId elementId
---@return Index
function GuiElement.extractIndexAndNameFromID(elementId) end

---@param xmlFile any
---@param key any
function GuiElement:setId(xmlFile, key) end

---@param guiMixinType guiMixinType
function GuiElement:include(guiMixinType) end

function findFirstFocusableSearch() end

function GuiElement:toString() end
