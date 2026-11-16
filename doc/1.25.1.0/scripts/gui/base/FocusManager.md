# gui/base/FocusManager.lua

*[Version française](../../../fr/scripts/gui/base/FocusManager.md)*

Source: `dataS/scripts/gui/base/FocusManager.lua` — FS25 1.25.1.0

✍ Singleton-style manager that decides which GuiElement of the current screen has keyboard/gamepad focus and how focus moves between elements. Focus data is kept per screen; neighbours come from XML attributes (focusId, focusChange*, focusInit, focusChangeOverride), from custom code, or are found automatically by proximity. Navigation uses the MENU_AXIS_* actions with repeat delays, and focus or highlight changes play GUI hover sounds through a GuiSoundPlayer. Constants such as TOP/BOTTOM/LEFT/RIGHT, delays and EPSILON are defined outside the visible bodies (UNVERIFIED).

- **FocusManager** (l.22)

## Functions

| Function | Line | Description |
|---|---|---|
| `FocusManager:setGui(gui: gui)` | 76 | ✍ Switches the active screen: removes focus and highlight from the previous one, creates or restores the focus data of the new one, re-focuses its initial or last element with sound muted, and clears input delay locks. |
| `FocusManager:setSoundPlayer(guiSoundPlayer: any)` | 113 | ✍ Stores the GuiSoundPlayer used for hover sounds on focus and highlight changes. It must be set before sounds are triggered, otherwise those calls fail. |
| `FocusManager:getElementById(id: any)` | 119 | ✍ Returns the focusable element registered under the given focus id in the current screen, or nil. |
| `FocusManager:getFocusedElement()` | 125 | ✍ Returns the element that currently holds focus in the active screen, or nil. |
| `FocusManager.serveAutoFocusId()` | 132 | ✍ Returns a new unique id of the form focusAuto_N from a global counter, then increments the counter. |
| `FocusManager:loadElementFromXML(xmlFile: any, xmlBaseNode: any, element: any)` | 141 | ✍ Reads focusId, the four focusChange* links, focusInit (onOpen marks the initial focus) and focusChangeOverride from XML, then registers the element in the current screen. An onOpen element is focused immediately, silently. Note: in the non-target branch the override is stored on the manager (self), not on the element. |
| `FocusManager:loadElementFromCustomValues(element: element, focusId: focusId, focusChangeData: focusChangeData, focusActive: focusActive, isAlwaysFocusedOnOpen: isAlwaysFocusedOnOpen) → True` | 239 | ✍ Registers an element and, recursively, its children with code-supplied focus data. Returns false if the given focus id is already used (the element is then skipped), otherwise true if the element and all children were added. |
| `FocusManager:removeElement(element: any)` | 279 | ✍ Removes an element and its children from focus handling: leaves focus if needed, clears its id from every screen it was added to, and resets its focusId and link data. |
| `FocusManager:linkElements(sourceElement: sourceElement, direction: direction, targetElement: targetElement)` | 322 | ✍ Sets a one-way focus link from the source element to the target for a direction; passing nil as target stores "nil", which blocks that direction. Call twice with swapped arguments for a two-way link. |
| `FocusManager:inputEvent(action: action, value: value, eventUsed: eventUsed) → True` | 336 | ✍ Handles a menu input: converts axis actions beyond the analog tolerance into a direction and updates focus, and triggers onFocusActivate on the focused, visible element for MENU_ACCEPT unless input is locked. Returns true if the event counts as consumed. |
| `FocusManager.getDirectionForAxisValue(inputAction: any, value: any)` | 373 | ✍ Maps an up/down or left/right axis action and the sign of its value to BOTTOM/TOP/LEFT/RIGHT; returns nil for a nil or zero value or any other action. |
| `FocusManager:isFocusInputLocked(inputAxis: inputAxis, value: value) → isLocked` | 401 | ✍ Returns true while an input (a direction, or a plain action such as accept) is still within its lock delay measured against g_time. |
| `FocusManager:lockFocusInput(axisAction: inputAxis, delay: delay, value: value)` | 420 | ✍ Records the current time and blocks that input for the given delay in milliseconds. The value is only used to tell the direction of an axis. |
| `FocusManager:releaseMovementFocusInput(action: action)` | 434 | ✍ Clears the lock records for both directions of a left/right or up/down axis, called when the input is released. Ignores other actions. |
| `FocusManager:resetFocusInputLocks()` | 451 | ✍ Clears all recorded input times and sets every lock deadline to zero. |
| `FocusManager.getClosestPointOnBoundingBox(x: x, y: y, boxMinX: boxMinX, boxMinY: boxMinY, boxMaxX: boxMaxX, boxMaxY: boxMaxY) → Closest` | 470 | ✍ Clamps a point to a rectangle and returns the clamped x, y; a point already inside is returned unchanged. |
| `FocusManager.getShortestBoundingBoxVector(minX: any, minY: any, maxX: any, maxY: any, otherBoxMinX: any, otherBoxMinY: any, otherBoxMaxX: any, otherBoxMaxY: any, otherCenterX: any, otherCenterY: any)` | 490 | ✍ Returns the x, y vector of the shortest link between two rectangles, using the other element's center to pick the point on the first. Overlapping boxes give reversed directions. |
| `FocusManager.checkElementDistance(curElement: curElement, other: other, dirX: dirX, dirY: dirY, curElementOffsetY: curElementOffsetY, closestOther: closestOther, closestDistanceSq: closestDistanceSq)` | 513 | ✍ Compares one candidate with the current best neighbour in a scan direction, skipping disabled, hidden, non-focusable, parent or child elements. Ties are broken by position so paths stay symmetric. Returns the best element and its squared distance. |
| `FocusManager:getNextFocusElement(element: element, direction: direction) → Next` | 582 | ✍ Finds the neighbour in a direction: the configured link if present, otherwise the nearest focusable element by geometry. With no result, LEFT retries as TOP, RIGHT as BOTTOM, and TOP/BOTTOM wrap around the screen or parent. Returns the element and the direction actually used. |
| `FocusManager.getNestedFocusTarget(element: element, direction: direction) → Focus` | 636 | ✍ Repeatedly asks each element for its focus target in the opposing direction until the target no longer changes, and returns that deepest element. getFocusTarget is implemented by GuiElement classes outside this file (UNVERIFIED). |
| `FocusManager:updateFocus(element: element, direction: isFocusMoving, updateOnly: direction)` | 653 | ✍ Applies the repeat-delay logic for a direction and, when allowed, moves focus from the focused element: uses its focusChangeOverride if any, else getNextFocusElement, and tries up to 30 steps past non-focusable neighbours. With updateOnly it only updates the lock timing. |
| `FocusManager:setHighlight(element: element)` | 732 | ✍ Highlights one element (usually the mouse hover target), removing the previous highlight and calling onHighlight; plays the hover sound unless suppressed. Does nothing if the element has no handleFocus or is already highlighted. |
| `FocusManager:unsetHighlight(element: element)` | 755 | ✍ Clears the highlight if the given element is the highlighted one and calls its onHighlightRemove. |
| `FocusManager:setFocus(element: element, direction: direction, ...: ...) → True` | 769 | ✍ Gives focus to the element's nested focus target and calls onFocusEnter with the extra arguments; unfocuses the previous element. Returns false if input is globally locked, the element cannot take focus, the target belongs to another screen, or it is already focused. Plays the hover or custom focus sound. |
| `FocusManager:unsetFocus(element: element, ...: ...)` | 814 | ✍ Calls onFocusLeave on the element only if it is the currently focused one and still reports itself focused; otherwise does nothing. |
| `FocusManager:requireLock()` | 831 | ✍ Sets the global flag that makes setFocus refuse every focus change, for all screens. |
| `FocusManager:releaseLock()` | 837 | ✍ Clears the global focus lock set by requireLock. |
| `FocusManager:isLocked()` | 843 | ✍ Returns the global focus lock flag. |
| `FocusManager:isDirectionLocked(direction: direction) → True` | 851 | ✍ Returns true if a recorded input time exists for the direction, meaning that direction is currently held or in its repeat window. |
| `FocusManager:hasFocus(element: any)` | 857 | ✍ Returns true if the element is the registered focus element of the current screen and reports itself focused. |
| `FocusManager:getFocusOverrideFunction(forDirections: any, substitute: any, useSubstituteForFocus: any)` | 867 | ✍ Builds a function usable as a focus override: for the listed directions it returns (true, substitute), or the substitute's own next neighbour when useSubstituteForFocus is set. For other directions, or an empty list, it returns (false, nil). |
| `FocusManager:deleteGuiFocusData(guiName: guiName)` | 895 | ✍ Discards all stored focus data of the named screen. |
