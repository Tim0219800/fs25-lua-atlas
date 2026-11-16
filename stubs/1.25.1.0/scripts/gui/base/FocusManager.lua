---@meta
-- FS25 1.25.1.0 : gui/base/FocusManager.lua (generated stub, FS25 Lua Atlas)

--- Singleton-style manager that decides which GuiElement of the current screen has keyboard/gamepad focus and how focus moves between elements. Focus data is kept per screen; neighbours come from XML attributes (focusId, focusChange*, focusInit, focusChangeOverride), from custom code, or are found automatically by proximity. Navigation uses the MENU_AXIS_* actions with repeat delays, and focus or highlight changes play GUI hover sounds through a GuiSoundPlayer. Constants such as TOP/BOTTOM/LEFT/RIGHT, delays and EPSILON are defined outside the visible bodies (UNVERIFIED).
---@class FocusManager
FocusManager = {}

--- Switches the active screen: removes focus and highlight from the previous one, creates or restores the focus data of the new one, re-focuses its initial or last element with sound muted, and clears input delay locks.
---@param gui gui
function FocusManager:setGui(gui) end

--- Stores the GuiSoundPlayer used for hover sounds on focus and highlight changes. It must be set before sounds are triggered, otherwise those calls fail.
---@param guiSoundPlayer any
function FocusManager:setSoundPlayer(guiSoundPlayer) end

--- Returns the focusable element registered under the given focus id in the current screen, or nil.
---@param id any
function FocusManager:getElementById(id) end

--- Returns the element that currently holds focus in the active screen, or nil.
function FocusManager:getFocusedElement() end

--- Returns a new unique id of the form focusAuto_N from a global counter, then increments the counter.
function FocusManager.serveAutoFocusId() end

--- Reads focusId, the four focusChange* links, focusInit (onOpen marks the initial focus) and focusChangeOverride from XML, then registers the element in the current screen. An onOpen element is focused immediately, silently. Note: in the non-target branch the override is stored on the manager (self), not on the element.
---@param xmlFile any
---@param xmlBaseNode any
---@param element any
function FocusManager:loadElementFromXML(xmlFile, xmlBaseNode, element) end

--- Registers an element and, recursively, its children with code-supplied focus data. Returns false if the given focus id is already used (the element is then skipped), otherwise true if the element and all children were added.
---@param element element
---@param focusId focusId
---@param focusChangeData focusChangeData
---@param focusActive focusActive
---@param isAlwaysFocusedOnOpen isAlwaysFocusedOnOpen
---@return True
function FocusManager:loadElementFromCustomValues(element, focusId, focusChangeData, focusActive, isAlwaysFocusedOnOpen) end

--- Removes an element and its children from focus handling: leaves focus if needed, clears its id from every screen it was added to, and resets its focusId and link data.
---@param element any
function FocusManager:removeElement(element) end

--- Sets a one-way focus link from the source element to the target for a direction; passing nil as target stores "nil", which blocks that direction. Call twice with swapped arguments for a two-way link.
---@param sourceElement sourceElement
---@param direction direction
---@param targetElement targetElement
function FocusManager:linkElements(sourceElement, direction, targetElement) end

--- Handles a menu input: converts axis actions beyond the analog tolerance into a direction and updates focus, and triggers onFocusActivate on the focused, visible element for MENU_ACCEPT unless input is locked. Returns true if the event counts as consumed.
---@param action action
---@param value value
---@param eventUsed eventUsed
---@return True
function FocusManager:inputEvent(action, value, eventUsed) end

--- Maps an up/down or left/right axis action and the sign of its value to BOTTOM/TOP/LEFT/RIGHT; returns nil for a nil or zero value or any other action.
---@param inputAction any
---@param value any
function FocusManager.getDirectionForAxisValue(inputAction, value) end

--- Returns true while an input (a direction, or a plain action such as accept) is still within its lock delay measured against g_time.
---@param inputAxis inputAxis
---@param value value
---@return isLocked
function FocusManager:isFocusInputLocked(inputAxis, value) end

--- Records the current time and blocks that input for the given delay in milliseconds. The value is only used to tell the direction of an axis.
---@param axisAction inputAxis
---@param delay delay
---@param value value
function FocusManager:lockFocusInput(axisAction, delay, value) end

--- Clears the lock records for both directions of a left/right or up/down axis, called when the input is released. Ignores other actions.
---@param action action
function FocusManager:releaseMovementFocusInput(action) end

--- Clears all recorded input times and sets every lock deadline to zero.
function FocusManager:resetFocusInputLocks() end

--- Clamps a point to a rectangle and returns the clamped x, y; a point already inside is returned unchanged.
---@param x x
---@param y y
---@param boxMinX boxMinX
---@param boxMinY boxMinY
---@param boxMaxX boxMaxX
---@param boxMaxY boxMaxY
---@return Closest
function FocusManager.getClosestPointOnBoundingBox(x, y, boxMinX, boxMinY, boxMaxX, boxMaxY) end

--- Returns the x, y vector of the shortest link between two rectangles, using the other element's center to pick the point on the first. Overlapping boxes give reversed directions.
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

--- Compares one candidate with the current best neighbour in a scan direction, skipping disabled, hidden, non-focusable, parent or child elements. Ties are broken by position so paths stay symmetric. Returns the best element and its squared distance.
---@param curElement curElement
---@param other other
---@param dirX dirX
---@param dirY dirY
---@param curElementOffsetY curElementOffsetY
---@param closestOther closestOther
---@param closestDistanceSq closestDistanceSq
function FocusManager.checkElementDistance(curElement, other, dirX, dirY, curElementOffsetY, closestOther, closestDistanceSq) end

--- Finds the neighbour in a direction: the configured link if present, otherwise the nearest focusable element by geometry. With no result, LEFT retries as TOP, RIGHT as BOTTOM, and TOP/BOTTOM wrap around the screen or parent. Returns the element and the direction actually used.
---@param element element
---@param direction direction
---@return Next
function FocusManager:getNextFocusElement(element, direction) end

--- Repeatedly asks each element for its focus target in the opposing direction until the target no longer changes, and returns that deepest element. getFocusTarget is implemented by GuiElement classes outside this file (UNVERIFIED).
---@param element element
---@param direction direction
---@return Focus
function FocusManager.getNestedFocusTarget(element, direction) end

--- Applies the repeat-delay logic for a direction and, when allowed, moves focus from the focused element: uses its focusChangeOverride if any, else getNextFocusElement, and tries up to 30 steps past non-focusable neighbours. With updateOnly it only updates the lock timing.
---@param element element
---@param direction isFocusMoving
---@param updateOnly direction
function FocusManager:updateFocus(element, direction, updateOnly) end

--- Highlights one element (usually the mouse hover target), removing the previous highlight and calling onHighlight; plays the hover sound unless suppressed. Does nothing if the element has no handleFocus or is already highlighted.
---@param element element
function FocusManager:setHighlight(element) end

--- Clears the highlight if the given element is the highlighted one and calls its onHighlightRemove.
---@param element element
function FocusManager:unsetHighlight(element) end

--- Gives focus to the element's nested focus target and calls onFocusEnter with the extra arguments; unfocuses the previous element. Returns false if input is globally locked, the element cannot take focus, the target belongs to another screen, or it is already focused. Plays the hover or custom focus sound.
---@param element element
---@param direction direction
---@return True
function FocusManager:setFocus(element, direction, ...) end

--- Calls onFocusLeave on the element only if it is the currently focused one and still reports itself focused; otherwise does nothing.
---@param element element
function FocusManager:unsetFocus(element, ...) end

--- Sets the global flag that makes setFocus refuse every focus change, for all screens.
function FocusManager:requireLock() end

--- Clears the global focus lock set by requireLock.
function FocusManager:releaseLock() end

--- Returns the global focus lock flag.
function FocusManager:isLocked() end

--- Returns true if a recorded input time exists for the direction, meaning that direction is currently held or in its repeat window.
---@param direction direction
---@return True
function FocusManager:isDirectionLocked(direction) end

--- Returns true if the element is the registered focus element of the current screen and reports itself focused.
---@param element any
function FocusManager:hasFocus(element) end

--- Builds a function usable as a focus override: for the listed directions it returns (true, substitute), or the substitute's own next neighbour when useSubstituteForFocus is set. For other directions, or an empty list, it returns (false, nil).
---@param forDirections any
---@param substitute any
---@param useSubstituteForFocus any
function FocusManager:getFocusOverrideFunction(forDirections, substitute, useSubstituteForFocus) end

--- Discards all stored focus data of the named screen.
---@param guiName guiName
function FocusManager:deleteGuiFocusData(guiName) end
