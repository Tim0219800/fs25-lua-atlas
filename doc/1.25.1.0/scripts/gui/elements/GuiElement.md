# gui/elements/GuiElement.lua

*[Version française](../../../fr/scripts/gui/elements/GuiElement.md)*

Source: `dataS/scripts/gui/elements/GuiElement.lua` — FS25 1.25.1.0

✍ GuiElement is the root class of every UI element. It holds the parent/children tree, position, size and anchors (normalized screen units), visibility, alpha fading, enabled/selected/focused/highlighted state, optional frame borders, tooltips and callbacks bound to a target view. Properties come from XML attributes and from guiProfiles values; XML overrides the profile. It forwards mouse, touch, key and input events to children and works with FocusManager and GuiOverlay. The mixin GuiMixin, FocusManager and g_gui live in other files.

- **GuiElement** (l.99)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuiElement.new(target: target, custom_mt: any)` | 144 | ✍ Constructor. Sets up the child list, target, empty profile, position/size/anchor tables, visible and enabled defaults, alpha 1, fade times 0, normal overlay state and handleFocus true. Includes GuiMixin. |
| `GuiElement:loadFromXML(xmlFile: xmlFile, key: key)` | 222 | ✍ Loads a profile named by #profile, then reads id, callbacks (onCreate, onOpen, onClose, onDraw), name, pivot, position, size, anchors, flags, frame settings, fade times (seconds, stored in ms), tooltip (supports $l10n_ keys) and focus settings, then resolves sizes. |
| `GuiElement:loadProfile(profile: profile, applyProfile: boolean)` | 315 | ✍ Reads the same layout, state, frame, focus and fade properties from a profile object. If applyProfile is true it also re-resolves sizes, fixes thin lines and updates absolute positions. Invalid fade times log a dev warning. |
| `GuiElement:applyProfile(profileName: profileName, blockSizeUpdate: boolean?, ignoreSameProfile: boolean?)` | 393 | ✍ Applies a profile by name at runtime through g_gui:getProfile. The size update is skipped when blockSizeUpdate is set, and the call is ignored if the same profile is already set and ignoreSameProfile is true. |
| `GuiElement:resolveSizeString()` | 405 | ✍ Converts the size, width and height strings into normalized sizes. A value ending in percent is relative to the parent size minus absoluteSizeOffset; otherwise it uses GuiUtils.getNormalizedValue. Then refreshes anchor deltas. |
| `GuiElement:delete()` | 453 | ✍ Deletes all children recursively, detaches this element from its parent and removes it from FocusManager. |
| `GuiElement:clone(parent: table, includeId: boolean?, suppressOnCreate: boolean?, blockFocusHandlingReload: any) → table` | 473 | ✍ Creates a copy via self.new() and copyAttributes, clones children recursively (optionally keeping ids), reloads focus handling and raises onCreate unless suppressed. Parent is optional. Note: new() is called without a target. |
| `GuiElement:copyAttributes(src: table)` | 503 | ✍ Copies names, state flags, size, margin, callbacks, target, profile, fade, focus data, frame data, position, anchors and hotspot from a source element. Note: it copies ignoreLayout whereas XML and profiles use layoutIgnore. |
| `GuiElement:onGuiSetupFinished()` | 568 | ✍ Propagates the end of GUI setup to children, then resolves toolTipElementId among the target's descendants and warns if the element is not found. |
| `GuiElement:toggleFrameSide(sideIndex: integer, isVisible: any)` | 587 | ✍ Shows or hides one of the four frame border sides by index. Does nothing if the element has no frame. |
| `GuiElement:updateFramePosition()` | 595 | ✍ Recomputes the rectangles of the four frame borders from the absolute position, size and thickness, then trims overlaps at the corners. |
| `GuiElement:cutFrameBordersHorizontal(verticalPart: any, horizontalPart: any, isLeft: any)` | 649 | ✍ Corner helper: shortens a horizontal border by the width of a vertical one when the vertical border is thicker, shifting x when on the left. |
| `GuiElement:cutFrameBordersVertical(horizontalPart: any, verticalPart: any, isBottom: any)` | 661 | ✍ Corner helper: shortens a vertical border by the height of a horizontal one when the horizontal one is at least as long, shifting y for the bottom side. |
| `GuiElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 706 | ✍ Forwards a mouse event to visible children from last to first (top-most first) and returns true if any child used it. |
| `GuiElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 725 | ✍ Same as mouseEvent for touch input, forwarding to visible children and returning whether the event was used. |
| `GuiElement:inputEvent(action: action, value: value, eventUsed: eventUsed) → True` | 752 | ✍ Bubbles an input action up to the parent when not already used; returns whether it was handled. |
| `GuiElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any) → True` | 777 | ✍ Forwards a keyboard event to visible children, last to first, and returns true if any used it. |
| `GuiElement:update(dt: any)` | 796 | ✍ Per-frame update: advances the fade by dt using fadeInTime or fadeOutTime, then updates every active child. |
| `GuiElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 815 | ✍ Starts a new 2D layer if requested, computes the clip area, raises onDraw, draws debug outlines when debug is on, draws visible children, then the frame borders and focus debug text. |
| `GuiElement:onOpen()` | 884 | ✍ Raises the onOpen callback and notifies all children. |
| `GuiElement:onClose()` | 895 | ✍ Raises the onClose callback and notifies all children. |
| `GuiElement:shouldFocusChange(direction: any)` | 905 | ✍ Returns true only if every child agrees that the focus may change in the given direction. |
| `GuiElement:canReceiveFocus()` | 918 | ✍ Default returns false; focusable subclasses override it. |
| `GuiElement:onFocusLeave()` | 925 | ✍ Clears focus on this element and children and clears the tooltip text if a tooltip element is used. |
| `GuiElement:onFocusEnter()` | 941 | ✍ Sets focus on this element and children and shows the tooltip text in the tooltip element if configured. |
| `GuiElement:onFocusActivate()` | 957 | ✍ Propagates focus activation to children that handle focus. |
| `GuiElement:onHighlight()` | 969 | ✍ Marks this element and children highlighted, shows the tooltip, and moves focus here when focusOnHighlight is set. |
| `GuiElement:onHighlightRemove()` | 989 | ✍ Removes the highlight from this element and children and clears the tooltip text. |
| `GuiElement:getHandleFocus()` | 1004 | ✍ Returns whether the element takes part in focus handling. |
| `GuiElement:setHandleFocus(handleFocus: any)` | 1010 | ✍ Sets whether the element takes part in focus handling. |
| `GuiElement:addElement(element: any)` | 1016 | ✍ Appends a child, first removing it from its previous parent, and sets its parent field. |
| `GuiElement:removeElement(element: any)` | 1027 | ✍ Removes a child from the list and clears its parent. The child is not deleted. |
| `GuiElement:unlinkElement()` | 1040 | ✍ Detaches this element from its parent without deleting it. |
| `GuiElement:updateAbsolutePosition()` | 1049 | ✍ Computes absolute position and size from parent borders, anchors and anchor deltas, then updates all children and the frame rectangles. |
| `GuiElement:reset()` | 1080 | ✍ Resets all children recursively; the base class holds no state of its own to reset. |
| `GuiElement:isChildOf(element: any)` | 1089 | ✍ Walks up the parent chain and returns true if the given element is an ancestor. Returns false for itself. |
| `GuiElement:getFocusTarget(incomingDirection: incomingDirection, moveDirection: moveDirection) → GuiElement` | 1115 | ✍ Returns the element that should actually receive focus; the base class returns itself. |
| `GuiElement:setPosition(x: any, y: any)` | 1121 | ✍ Sets the relative position (nil keeps an axis), then refreshes anchor deltas and absolute positions. |
| `GuiElement:move(dx: any, dy: any)` | 1131 | ✍ Shifts the relative position by dx, dy and updates absolute positions. Anchor deltas are not recomputed here. |
| `GuiElement:setAbsolutePosition(x: any, y: any)` | 1140 | ✍ Moves the element to an absolute screen position and shifts all children by the same offset, then updates the frame. Relative position fields are not changed. |
| `GuiElement:setSize(x: boolean, y: any, updateChildAnchorDeltas: boolean)` | 1162 | ✍ Sets size (nil keeps an axis), enforcing at least one pixel on non-zero axes if thin line protection is on, then updates anchor deltas and absolute positions. |
| `GuiElement:setVisible(visible: any)` | 1185 | ✍ Sets this element's own visible flag. |
| `GuiElement:getIsVisible()` | 1192 | ✍ True if this element and all its ancestors are visible. |
| `GuiElement:getIsVisibleNonRec()` | 1206 | ✍ True if this element is visible and its alpha is above zero; parents are not checked. |
| `GuiElement:setDisabled(disabled: disabled, blockDelegate: any)` | 1214 | ✍ Sets the disabled flag and, when updateChildrenState is on and delegation is not blocked, applies it to all children. |
| `GuiElement:getIsDisabled()` | 1226 | ✍ Returns the disabled flag. |
| `GuiElement:setSelected(selected: selected, blockDelegate: any)` | 1233 | ✍ Sets the selected flag, propagating to children when updateChildrenState is on and delegation is not blocked. |
| `GuiElement:getIsSelected()` | 1245 | ✍ Returns the selected flag. |
| `GuiElement:setFocused(focused: focused, blockDelegate: any)` | 1252 | ✍ Sets the focused flag, propagating to children when updateChildrenState is on and delegation is not blocked. |
| `GuiElement:getIsFocused()` | 1264 | ✍ Returns the focused flag. |
| `GuiElement:getIsHighlighted()` | 1283 | ✍ Returns the highlighted flag. |
| `GuiElement:getOverlayState()` | 1289 | ✍ Returns the overlay state by priority: disabled, selected, focused, highlighted, otherwise normal. |
| `GuiElement:fadeIn(factor: any)` | 1305 | ✍ Starts fading in at the given speed factor (default 1) if fadeInTime is above zero, otherwise sets alpha to 1 immediately. |
| `GuiElement:fadeOut(factor: any)` | 1317 | ✍ Starts fading out at the given speed factor if fadeOutTime is above zero, otherwise sets alpha to 0 immediately. |
| `GuiElement:setAlpha(alpha: alpha)` | 1329 | ✍ Sets alpha (clamped 0 to 1) on this element and all children when it changes, and stops any fade at 0 or 1. |
| `GuiElement:getIsActive()` | 1345 | ✍ True if the element is not disabled and is visible including ancestors. |
| `GuiElement:getIsActiveNonRec()` | 1351 | ✍ True if the element is not disabled and visible with positive alpha, without checking ancestors. |
| `GuiElement:getClipArea(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 1357 | ✍ If clipping is enabled, intersects the incoming clip rectangle with this element's bounds and returns the four values; otherwise returns the input unchanged. |
| `GuiElement:setSoundSuppressed(doSuppress: any)` | 1371 | ✍ Sets the sound-suppressed flag on this element and all children. |
| `GuiElement:getSoundSuppressed()` | 1382 | ✍ Returns whether sounds are suppressed for this element. |
| `GuiElement:findDescendantsRec(accumulator: accumulator, rootElement: rootElement?, predicateFunction: predicateFunction?)` | 1393 | ✍ Recursive helper: appends to an accumulator every descendant of a root that passes an optional predicate, depth first (children before the matching element). |
| `GuiElement:getDescendants(predicateFunction: any) → List` | 1412 | ✍ Returns a list of all descendants, filtered by an optional predicate function. |
| `GuiElement:getFirstDescendant(predicateFunction: any) → First` | 1444 | ✍ Returns the first descendant matching the predicate, or nil. It builds the whole list first, so it is not cheap. |
| `GuiElement:getDescendantById(id: id) → Element` | 1458 | ✍ Returns the first descendant whose id equals the given id, or nil. |
| `GuiElement:getDescendantByName(name: name) → Element` | 1475 | ✍ Returns the first descendant whose name equals the given name, or nil. |
| `GuiElement:fixThinLines()` | 1512 | ✍ With thin line protection on, raises non-zero size components to at least one pixel and refreshes absolute positions. |
| `GuiElement:getParentBorders() → number, number, number, number` | 1533 | ✍ Returns the parent's absolute borders (minX, minY, maxX, maxY), or the full screen 0,0,1,1 without parent. |
| `GuiElement:getBorders() → number, number, number, number` | 1547 | ✍ Returns this element's absolute borders as minX, minY, maxX, maxY. |
| `GuiElement:getParentOriginalBorders() → number, number, number, number` | 1563 | ✍ Returns the parent's relative (original) borders, or 0,0,1,1 without parent. |
| `GuiElement:getOriginalBorders() → number, number, number, number` | 1577 | ✍ Returns the borders computed from the relative position and size, not the absolute ones. |
| `GuiElement:getCenter() → number, number` | 1590 | ✍ Returns the absolute center point x, y of the element. |
| `GuiElement:getAspectScale() → number, number` | 1600 | ✍ Returns the global aspect scale values g_aspectScaleX and g_aspectScaleY. |
| `GuiElement:addCallback(xmlFile: xmlFile, key: key, funcName: funcName)` | 1611 | ✍ Reads a callback name from an XML attribute and stores the matching function under funcName, taken from the target if there is one, otherwise from ClassUtil.getFunction. |
| `GuiElement:raiseCallback(name: any, ...: any)` | 1635 | ✍ Calls the stored callback by field name, with the target as first argument when one is set, and returns its result (nil if absent). |
| `GuiElement.extractIndexAndNameFromID(elementId: elementId) → Index` | 1652 | ✍ Splits an id like name[3] into the numeric index and the base name. Returns nil and the full id when the id has no valid bracket index. |
| `GuiElement:setId(xmlFile: any, key: any)` | 1670 | ✍ Reads the #id attribute and stores it if the base name has only letters, digits and underscores; otherwise prints an error and ignores it. |
| `GuiElement:include(guiMixinType: guiMixinType)` | 1692 | ✍ Instantiates a mixin type and attaches it to this element. |
| `findFirstFocusableSearch()` | 1714 | ✍ Global function with an empty body in this file. It looks like a leftover stub that does nothing; any search logic is UNVERIFIED. |
| `GuiElement:toString()` | 1776 | ✍ Returns a debug string with id, focus id, profile name and absolute position. |
