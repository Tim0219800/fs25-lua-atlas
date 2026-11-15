# gui/base/FocusManager.lua

Source: `dataS/scripts/gui/base/FocusManager.lua` — FS25 1.25.1.0

- **FocusManager** (l.22)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FocusManager:setGui(gui: gui)` | 76 |  |
| `FocusManager:setSoundPlayer(guiSoundPlayer: any)` | 113 |  |
| `FocusManager:getElementById(id: any)` | 119 |  |
| `FocusManager:getFocusedElement()` | 125 |  |
| `FocusManager.serveAutoFocusId()` | 132 |  |
| `FocusManager:loadElementFromXML(xmlFile: any, xmlBaseNode: any, element: any)` | 141 |  |
| `FocusManager:loadElementFromCustomValues(element: element, focusId: focusId, focusChangeData: focusChangeData, focusActive: focusActive, isAlwaysFocusedOnOpen: isAlwaysFocusedOnOpen) → True` | 239 |  |
| `FocusManager:removeElement(element: any)` | 279 |  |
| `FocusManager:linkElements(sourceElement: sourceElement, direction: direction, targetElement: targetElement)` | 322 |  |
| `FocusManager:inputEvent(action: action, value: value, eventUsed: eventUsed) → True` | 336 |  |
| `FocusManager.getDirectionForAxisValue(inputAction: any, value: any)` | 373 |  |
| `FocusManager:isFocusInputLocked(inputAxis: inputAxis, value: value) → isLocked` | 401 |  |
| `FocusManager:lockFocusInput(axisAction: inputAxis, delay: delay, value: value)` | 420 |  |
| `FocusManager:releaseMovementFocusInput(action: action)` | 434 |  |
| `FocusManager:resetFocusInputLocks()` | 451 |  |
| `FocusManager.getClosestPointOnBoundingBox(x: x, y: y, boxMinX: boxMinX, boxMinY: boxMinY, boxMaxX: boxMaxX, boxMaxY: boxMaxY) → Closest` | 470 |  |
| `FocusManager.getShortestBoundingBoxVector(minX: any, minY: any, maxX: any, maxY: any, otherBoxMinX: any, otherBoxMinY: any, otherBoxMaxX: any, otherBoxMaxY: any, otherCenterX: any, otherCenterY: any)` | 490 |  |
| `FocusManager.checkElementDistance(curElement: curElement, other: other, dirX: dirX, dirY: dirY, curElementOffsetY: curElementOffsetY, closestOther: closestOther, closestDistanceSq: closestDistanceSq)` | 513 |  |
| `FocusManager:getNextFocusElement(element: element, direction: direction) → Next` | 582 |  |
| `FocusManager.getNestedFocusTarget(element: element, direction: direction) → Focus` | 636 |  |
| `FocusManager:updateFocus(element: element, direction: isFocusMoving, updateOnly: direction)` | 653 |  |
| `FocusManager:setHighlight(element: element)` | 732 |  |
| `FocusManager:unsetHighlight(element: element)` | 755 |  |
| `FocusManager:setFocus(element: element, direction: direction, ...: ...) → True` | 769 |  |
| `FocusManager:unsetFocus(element: element, ...: ...)` | 814 |  |
| `FocusManager:requireLock()` | 831 |  |
| `FocusManager:releaseLock()` | 837 |  |
| `FocusManager:isLocked()` | 843 |  |
| `FocusManager:isDirectionLocked(direction: direction) → True` | 851 |  |
| `FocusManager:hasFocus(element: any)` | 857 |  |
| `FocusManager:getFocusOverrideFunction(forDirections: any, substitute: any, useSubstituteForFocus: any)` | 867 |  |
| `FocusManager:deleteGuiFocusData(guiName: guiName)` | 895 |  |
