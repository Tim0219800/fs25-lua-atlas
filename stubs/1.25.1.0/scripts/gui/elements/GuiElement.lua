---@meta
-- FS25 1.25.1.0 : gui/elements/GuiElement.lua (generated stub, FS25 Lua Atlas)

--- GuiElement is the root class of every UI element. It holds the parent/children tree, position, size and anchors (normalized screen units), visibility, alpha fading, enabled/selected/focused/highlighted state, optional frame borders, tooltips and callbacks bound to a target view. Properties come from XML attributes and from guiProfiles values; XML overrides the profile. It forwards mouse, touch, key and input events to children and works with FocusManager and GuiOverlay. The mixin GuiMixin, FocusManager and g_gui live in other files.
---@class GuiElement
GuiElement = {}

--- Constructor. Sets up the child list, target, empty profile, position/size/anchor tables, visible and enabled defaults, alpha 1, fade times 0, normal overlay state and handleFocus true. Includes GuiMixin.
---@param target target
---@param custom_mt any
function GuiElement.new(target, custom_mt) end

--- Loads a profile named by #profile, then reads id, callbacks (onCreate, onOpen, onClose, onDraw), name, pivot, position, size, anchors, flags, frame settings, fade times (seconds, stored in ms), tooltip (supports $l10n_ keys) and focus settings, then resolves sizes.
---@param xmlFile xmlFile
---@param key key
function GuiElement:loadFromXML(xmlFile, key) end

--- Reads the same layout, state, frame, focus and fade properties from a profile object. If applyProfile is true it also re-resolves sizes, fixes thin lines and updates absolute positions. Invalid fade times log a dev warning.
---@param profile profile
---@param applyProfile boolean
function GuiElement:loadProfile(profile, applyProfile) end

--- Applies a profile by name at runtime through g_gui:getProfile. The size update is skipped when blockSizeUpdate is set, and the call is ignored if the same profile is already set and ignoreSameProfile is true.
---@param profileName profileName
---@param blockSizeUpdate boolean?
---@param ignoreSameProfile boolean?
function GuiElement:applyProfile(profileName, blockSizeUpdate, ignoreSameProfile) end

--- Converts the size, width and height strings into normalized sizes. A value ending in percent is relative to the parent size minus absoluteSizeOffset; otherwise it uses GuiUtils.getNormalizedValue. Then refreshes anchor deltas.
function GuiElement:resolveSizeString() end

--- Deletes all children recursively, detaches this element from its parent and removes it from FocusManager.
function GuiElement:delete() end

--- Creates a copy via self.new() and copyAttributes, clones children recursively (optionally keeping ids), reloads focus handling and raises onCreate unless suppressed. Parent is optional. Note: new() is called without a target.
---@param parent table
---@param includeId boolean?
---@param suppressOnCreate boolean?
---@param blockFocusHandlingReload any
---@return table
function GuiElement:clone(parent, includeId, suppressOnCreate, blockFocusHandlingReload) end

--- Copies names, state flags, size, margin, callbacks, target, profile, fade, focus data, frame data, position, anchors and hotspot from a source element. Note: it copies ignoreLayout whereas XML and profiles use layoutIgnore.
---@param src table
function GuiElement:copyAttributes(src) end

--- Propagates the end of GUI setup to children, then resolves toolTipElementId among the target's descendants and warns if the element is not found.
function GuiElement:onGuiSetupFinished() end

--- Shows or hides one of the four frame border sides by index. Does nothing if the element has no frame.
---@param sideIndex integer
---@param isVisible any
function GuiElement:toggleFrameSide(sideIndex, isVisible) end

--- Recomputes the rectangles of the four frame borders from the absolute position, size and thickness, then trims overlaps at the corners.
function GuiElement:updateFramePosition() end

--- Corner helper: shortens a horizontal border by the width of a vertical one when the vertical border is thicker, shifting x when on the left.
---@param verticalPart any
---@param horizontalPart any
---@param isLeft any
function GuiElement:cutFrameBordersHorizontal(verticalPart, horizontalPart, isLeft) end

--- Corner helper: shortens a vertical border by the height of a horizontal one when the horizontal one is at least as long, shifting y for the bottom side.
---@param horizontalPart any
---@param verticalPart any
---@param isBottom any
function GuiElement:cutFrameBordersVertical(horizontalPart, verticalPart, isBottom) end

--- Forwards a mouse event to visible children from last to first (top-most first) and returns true if any child used it.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function GuiElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Same as mouseEvent for touch input, forwarding to visible children and returning whether the event was used.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function GuiElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

--- Bubbles an input action up to the parent when not already used; returns whether it was handled.
---@param action action
---@param value value
---@param eventUsed eventUsed
---@return True
function GuiElement:inputEvent(action, value, eventUsed) end

--- Forwards a keyboard event to visible children, last to first, and returns true if any used it.
---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
---@return True
function GuiElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

--- Per-frame update: advances the fade by dt using fadeInTime or fadeOutTime, then updates every active child.
---@param dt any
function GuiElement:update(dt) end

--- Starts a new 2D layer if requested, computes the clip area, raises onDraw, draws debug outlines when debug is on, draws visible children, then the frame borders and focus debug text.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function GuiElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Raises the onOpen callback and notifies all children.
function GuiElement:onOpen() end

--- Raises the onClose callback and notifies all children.
function GuiElement:onClose() end

--- Returns true only if every child agrees that the focus may change in the given direction.
---@param direction any
function GuiElement:shouldFocusChange(direction) end

--- Default returns false; focusable subclasses override it.
function GuiElement:canReceiveFocus() end

--- Clears focus on this element and children and clears the tooltip text if a tooltip element is used.
function GuiElement:onFocusLeave() end

--- Sets focus on this element and children and shows the tooltip text in the tooltip element if configured.
function GuiElement:onFocusEnter() end

--- Propagates focus activation to children that handle focus.
function GuiElement:onFocusActivate() end

--- Marks this element and children highlighted, shows the tooltip, and moves focus here when focusOnHighlight is set.
function GuiElement:onHighlight() end

--- Removes the highlight from this element and children and clears the tooltip text.
function GuiElement:onHighlightRemove() end

--- Returns whether the element takes part in focus handling.
function GuiElement:getHandleFocus() end

--- Sets whether the element takes part in focus handling.
---@param handleFocus any
function GuiElement:setHandleFocus(handleFocus) end

--- Appends a child, first removing it from its previous parent, and sets its parent field.
---@param element any
function GuiElement:addElement(element) end

--- Removes a child from the list and clears its parent. The child is not deleted.
---@param element any
function GuiElement:removeElement(element) end

--- Detaches this element from its parent without deleting it.
function GuiElement:unlinkElement() end

--- Computes absolute position and size from parent borders, anchors and anchor deltas, then updates all children and the frame rectangles.
function GuiElement:updateAbsolutePosition() end

--- Resets all children recursively; the base class holds no state of its own to reset.
function GuiElement:reset() end

--- Walks up the parent chain and returns true if the given element is an ancestor. Returns false for itself.
---@param element any
function GuiElement:isChildOf(element) end

--- Returns the element that should actually receive focus; the base class returns itself.
---@param incomingDirection incomingDirection
---@param moveDirection moveDirection
---@return GuiElement
function GuiElement:getFocusTarget(incomingDirection, moveDirection) end

--- Sets the relative position (nil keeps an axis), then refreshes anchor deltas and absolute positions.
---@param x any
---@param y any
function GuiElement:setPosition(x, y) end

--- Shifts the relative position by dx, dy and updates absolute positions. Anchor deltas are not recomputed here.
---@param dx any
---@param dy any
function GuiElement:move(dx, dy) end

--- Moves the element to an absolute screen position and shifts all children by the same offset, then updates the frame. Relative position fields are not changed.
---@param x any
---@param y any
function GuiElement:setAbsolutePosition(x, y) end

--- Sets size (nil keeps an axis), enforcing at least one pixel on non-zero axes if thin line protection is on, then updates anchor deltas and absolute positions.
---@param x boolean
---@param y any
---@param updateChildAnchorDeltas boolean
function GuiElement:setSize(x, y, updateChildAnchorDeltas) end

--- Sets this element's own visible flag.
---@param visible any
function GuiElement:setVisible(visible) end

--- True if this element and all its ancestors are visible.
function GuiElement:getIsVisible() end

--- True if this element is visible and its alpha is above zero; parents are not checked.
function GuiElement:getIsVisibleNonRec() end

--- Sets the disabled flag and, when updateChildrenState is on and delegation is not blocked, applies it to all children.
---@param disabled disabled
---@param blockDelegate any
function GuiElement:setDisabled(disabled, blockDelegate) end

--- Returns the disabled flag.
function GuiElement:getIsDisabled() end

--- Sets the selected flag, propagating to children when updateChildrenState is on and delegation is not blocked.
---@param selected selected
---@param blockDelegate any
function GuiElement:setSelected(selected, blockDelegate) end

--- Returns the selected flag.
function GuiElement:getIsSelected() end

--- Sets the focused flag, propagating to children when updateChildrenState is on and delegation is not blocked.
---@param focused focused
---@param blockDelegate any
function GuiElement:setFocused(focused, blockDelegate) end

--- Returns the focused flag.
function GuiElement:getIsFocused() end

--- Returns the highlighted flag.
function GuiElement:getIsHighlighted() end

--- Returns the overlay state by priority: disabled, selected, focused, highlighted, otherwise normal.
function GuiElement:getOverlayState() end

--- Starts fading in at the given speed factor (default 1) if fadeInTime is above zero, otherwise sets alpha to 1 immediately.
---@param factor any
function GuiElement:fadeIn(factor) end

--- Starts fading out at the given speed factor if fadeOutTime is above zero, otherwise sets alpha to 0 immediately.
---@param factor any
function GuiElement:fadeOut(factor) end

--- Sets alpha (clamped 0 to 1) on this element and all children when it changes, and stops any fade at 0 or 1.
---@param alpha alpha
function GuiElement:setAlpha(alpha) end

--- True if the element is not disabled and is visible including ancestors.
function GuiElement:getIsActive() end

--- True if the element is not disabled and visible with positive alpha, without checking ancestors.
function GuiElement:getIsActiveNonRec() end

--- If clipping is enabled, intersects the incoming clip rectangle with this element's bounds and returns the four values; otherwise returns the input unchanged.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function GuiElement:getClipArea(clipX1, clipY1, clipX2, clipY2) end

--- Sets the sound-suppressed flag on this element and all children.
---@param doSuppress any
function GuiElement:setSoundSuppressed(doSuppress) end

--- Returns whether sounds are suppressed for this element.
function GuiElement:getSoundSuppressed() end

--- Recursive helper: appends to an accumulator every descendant of a root that passes an optional predicate, depth first (children before the matching element).
---@param accumulator accumulator
---@param rootElement rootElement?
---@param predicateFunction predicateFunction?
function GuiElement:findDescendantsRec(accumulator, rootElement, predicateFunction) end

--- Returns a list of all descendants, filtered by an optional predicate function.
---@param predicateFunction any
---@return List
function GuiElement:getDescendants(predicateFunction) end

--- Returns the first descendant matching the predicate, or nil. It builds the whole list first, so it is not cheap.
---@param predicateFunction any
---@return First
function GuiElement:getFirstDescendant(predicateFunction) end

--- Returns the first descendant whose id equals the given id, or nil.
---@param id id
---@return Element
function GuiElement:getDescendantById(id) end

--- Returns the first descendant whose name equals the given name, or nil.
---@param name name
---@return Element
function GuiElement:getDescendantByName(name) end

--- With thin line protection on, raises non-zero size components to at least one pixel and refreshes absolute positions.
function GuiElement:fixThinLines() end

--- Returns the parent's absolute borders (minX, minY, maxX, maxY), or the full screen 0,0,1,1 without parent.
---@return number
---@return number
---@return number
---@return number
function GuiElement:getParentBorders() end

--- Returns this element's absolute borders as minX, minY, maxX, maxY.
---@return number
---@return number
---@return number
---@return number
function GuiElement:getBorders() end

--- Returns the parent's relative (original) borders, or 0,0,1,1 without parent.
---@return number
---@return number
---@return number
---@return number
function GuiElement:getParentOriginalBorders() end

--- Returns the borders computed from the relative position and size, not the absolute ones.
---@return number
---@return number
---@return number
---@return number
function GuiElement:getOriginalBorders() end

--- Returns the absolute center point x, y of the element.
---@return number
---@return number
function GuiElement:getCenter() end

--- Returns the global aspect scale values g_aspectScaleX and g_aspectScaleY.
---@return number
---@return number
function GuiElement:getAspectScale() end

--- Reads a callback name from an XML attribute and stores the matching function under funcName, taken from the target if there is one, otherwise from ClassUtil.getFunction.
---@param xmlFile xmlFile
---@param key key
---@param funcName funcName
function GuiElement:addCallback(xmlFile, key, funcName) end

--- Calls the stored callback by field name, with the target as first argument when one is set, and returns its result (nil if absent).
---@param name any
function GuiElement:raiseCallback(name, ...) end

--- Splits an id like name[3] into the numeric index and the base name. Returns nil and the full id when the id has no valid bracket index.
---@param elementId elementId
---@return Index
function GuiElement.extractIndexAndNameFromID(elementId) end

--- Reads the #id attribute and stores it if the base name has only letters, digits and underscores; otherwise prints an error and ignores it.
---@param xmlFile any
---@param key any
function GuiElement:setId(xmlFile, key) end

--- Instantiates a mixin type and attaches it to this element.
---@param guiMixinType guiMixinType
function GuiElement:include(guiMixinType) end

--- Global function with an empty body in this file. It looks like a leftover stub that does nothing; any search logic is UNVERIFIED.
function findFirstFocusableSearch() end

--- Returns a debug string with id, focus id, profile name and absolute position.
function GuiElement:toString() end
