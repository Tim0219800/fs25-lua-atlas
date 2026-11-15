# gui/elements/GuiElement.lua

Source: `dataS/scripts/gui/elements/GuiElement.lua` — FS25 1.25.1.0

- **GuiElement** (l.99)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `GuiElement.new(target: target, custom_mt: any)` | 144 |  |
| `GuiElement:loadFromXML(xmlFile: xmlFile, key: key)` | 222 |  |
| `GuiElement:loadProfile(profile: profile, applyProfile: boolean)` | 315 |  |
| `GuiElement:applyProfile(profileName: profileName, blockSizeUpdate: boolean?, ignoreSameProfile: boolean?)` | 393 |  |
| `GuiElement:resolveSizeString()` | 405 |  |
| `GuiElement:delete()` | 453 |  |
| `GuiElement:clone(parent: table, includeId: boolean?, suppressOnCreate: boolean?, blockFocusHandlingReload: any) → table` | 473 |  |
| `GuiElement:copyAttributes(src: table)` | 503 |  |
| `GuiElement:onGuiSetupFinished()` | 568 |  |
| `GuiElement:toggleFrameSide(sideIndex: integer, isVisible: any)` | 587 |  |
| `GuiElement:updateFramePosition()` | 595 |  |
| `GuiElement:cutFrameBordersHorizontal(verticalPart: any, horizontalPart: any, isLeft: any)` | 649 |  |
| `GuiElement:cutFrameBordersVertical(horizontalPart: any, verticalPart: any, isBottom: any)` | 661 |  |
| `GuiElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 706 |  |
| `GuiElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 725 |  |
| `GuiElement:inputEvent(action: action, value: value, eventUsed: eventUsed) → True` | 752 |  |
| `GuiElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any) → True` | 777 |  |
| `GuiElement:update(dt: any)` | 796 |  |
| `GuiElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 815 |  |
| `GuiElement:onOpen()` | 884 |  |
| `GuiElement:onClose()` | 895 |  |
| `GuiElement:shouldFocusChange(direction: any)` | 905 |  |
| `GuiElement:canReceiveFocus()` | 918 |  |
| `GuiElement:onFocusLeave()` | 925 |  |
| `GuiElement:onFocusEnter()` | 941 |  |
| `GuiElement:onFocusActivate()` | 957 |  |
| `GuiElement:onHighlight()` | 969 |  |
| `GuiElement:onHighlightRemove()` | 989 |  |
| `GuiElement:getHandleFocus()` | 1004 |  |
| `GuiElement:setHandleFocus(handleFocus: any)` | 1010 |  |
| `GuiElement:addElement(element: any)` | 1016 |  |
| `GuiElement:removeElement(element: any)` | 1027 |  |
| `GuiElement:unlinkElement()` | 1040 |  |
| `GuiElement:updateAbsolutePosition()` | 1049 |  |
| `GuiElement:reset()` | 1080 |  |
| `GuiElement:isChildOf(element: any)` | 1089 |  |
| `GuiElement:getFocusTarget(incomingDirection: incomingDirection, moveDirection: moveDirection) → GuiElement` | 1115 |  |
| `GuiElement:setPosition(x: any, y: any)` | 1121 |  |
| `GuiElement:move(dx: any, dy: any)` | 1131 |  |
| `GuiElement:setAbsolutePosition(x: any, y: any)` | 1140 |  |
| `GuiElement:setSize(x: boolean, y: any, updateChildAnchorDeltas: boolean)` | 1162 |  |
| `GuiElement:setVisible(visible: any)` | 1185 |  |
| `GuiElement:getIsVisible()` | 1192 |  |
| `GuiElement:getIsVisibleNonRec()` | 1206 |  |
| `GuiElement:setDisabled(disabled: disabled, blockDelegate: any)` | 1214 |  |
| `GuiElement:getIsDisabled()` | 1226 |  |
| `GuiElement:setSelected(selected: selected, blockDelegate: any)` | 1233 |  |
| `GuiElement:getIsSelected()` | 1245 |  |
| `GuiElement:setFocused(focused: focused, blockDelegate: any)` | 1252 |  |
| `GuiElement:getIsFocused()` | 1264 |  |
| `GuiElement:getIsHighlighted()` | 1283 |  |
| `GuiElement:getOverlayState()` | 1289 |  |
| `GuiElement:fadeIn(factor: any)` | 1305 |  |
| `GuiElement:fadeOut(factor: any)` | 1317 |  |
| `GuiElement:setAlpha(alpha: alpha)` | 1329 |  |
| `GuiElement:getIsActive()` | 1345 |  |
| `GuiElement:getIsActiveNonRec()` | 1351 |  |
| `GuiElement:getClipArea(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 1357 |  |
| `GuiElement:setSoundSuppressed(doSuppress: any)` | 1371 |  |
| `GuiElement:getSoundSuppressed()` | 1382 |  |
| `GuiElement:findDescendantsRec(accumulator: accumulator, rootElement: rootElement?, predicateFunction: predicateFunction?)` | 1393 |  |
| `GuiElement:getDescendants(predicateFunction: any) → List` | 1412 |  |
| `GuiElement:getFirstDescendant(predicateFunction: any) → First` | 1444 |  |
| `GuiElement:getDescendantById(id: id) → Element` | 1458 |  |
| `GuiElement:getDescendantByName(name: name) → Element` | 1475 |  |
| `GuiElement:fixThinLines()` | 1512 |  |
| `GuiElement:getParentBorders() → number, number, number, number` | 1533 |  |
| `GuiElement:getBorders() → number, number, number, number` | 1547 |  |
| `GuiElement:getParentOriginalBorders() → number, number, number, number` | 1563 |  |
| `GuiElement:getOriginalBorders() → number, number, number, number` | 1577 |  |
| `GuiElement:getCenter() → number, number` | 1590 |  |
| `GuiElement:getAspectScale() → number, number` | 1600 |  |
| `GuiElement:addCallback(xmlFile: xmlFile, key: key, funcName: funcName)` | 1611 |  |
| `GuiElement:raiseCallback(name: any, ...: any)` | 1635 |  |
| `GuiElement.extractIndexAndNameFromID(elementId: elementId) → Index` | 1652 |  |
| `GuiElement:setId(xmlFile: any, key: any)` | 1670 |  |
| `GuiElement:include(guiMixinType: guiMixinType)` | 1692 |  |
| `findFirstFocusableSearch()` | 1714 |  |
| `GuiElement:toString()` | 1776 |  |
