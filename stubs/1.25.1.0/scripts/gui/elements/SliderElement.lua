---@meta
-- FS25 1.25.1.0 : gui/elements/SliderElement.lua (generated stub, FS25 Lua Atlas)

--- Draggable slider (scroll bar) GUI element extending GuiElement with PlaySampleMixin. It keeps a numeric value between a min and max, draws a background and a handle (optionally in three parts), and by default expects two ButtonElement children as step buttons. It can bind to a data element such as a ScrollingLayoutElement or SmoothListElement to mirror its scroll range, and notifies children and the data element through onSliderValueChanged. Horizontal and vertical directions are supported.
---@class SliderElement : GuiElement
SliderElement = {}

--- Constructor. Creates the element with the sound mixin and defaults: range 0 to 100, step 1, vertical direction, buttons expected, empty overlay tables, slider visible and needed, no step rounding, no reset to default.
---@param target any
---@param custom_mt any
function SliderElement.new(target, custom_mt) end

--- Deletes the end, start, slider and background overlays, then runs the parent delete.
function SliderElement:delete() end

--- Loads the four overlays (image, sliderImage, startImage, endImage) and the XML options: direction (x or y), callbacks onClick and onChanged, hasButtons, min/max (swapped with a warning if inverted), current value, step size, three-part bitmap, hideParentWhenEmpty, step rounding, margins, sizes, data/text element ids or names and resetToDefault.
---@param xmlFile any
---@param key any
function SliderElement:loadFromXML(xmlFile, key) end

--- Profile counterpart of the XML loader: loads overlays, direction, button flag, range (swapped with a warning), current/default value, step size, three-part flag, rounding, sizes, margin, offset and resetToDefault.
---@param profile any
---@param applyProfile any
function SliderElement:loadProfile(profile, applyProfile) end

--- Copies overlays, direction, range, value, step, sizes, flags, element ids and callbacks from a source slider (cloning size tables), and clones the sound mixin. The default value is set to the copied current value.
---@param src any
function SliderElement:copyAttributes(src) end

--- Shows or hides the slider handle drawing; the slider still works.
---@param visible any
function SliderElement:setSliderVisible(visible) end

--- After base setup, resolves the text element and the data element from the target by id (or by name among the parent's descendants), printing a warning if not found, and applies sliderBoxMargin by shrinking and shifting the element along its axis.
function SliderElement:onGuiSetupFinished() end

--- Adds the child; if buttons are enabled, the first child becomes the up button and the second the down button, wired to onScrollDown/onScrollUp with the order swapped by direction. Other children are left unchanged.
---@param element any
function SliderElement:addElement(element) end

--- Binds the slider to a data element (a scrolling layout or list): unlinks the previous one, stores a back-reference on the new one in sliderElement and calls onBindUpdate without updating the element.
---@param element any
function SliderElement:setDataElement(element) end

--- Sets the slider value: moves the handle (clamped), optionally rounds to the step, rounds to 5 decimals and clamps. If the value changed, updates the text element, raises onChanged, calls onSliderValueChanged on children and (unless disabled by the flag) the data element, updates buttons and returns true.
---@param newValue any
---@param doNotUpdateDataElement any
---@param immediateMode any
function SliderElement:setValue(newValue, doNotUpdateDataElement, immediateMode) end

--- Disables the up button at the maximum value and the down button at the minimum, and both if the slider is disabled.
function SliderElement:updateSliderButtons() end

--- Sets the minimum, forced to at least 1 (a ToDo in the source), moves the value up if it is now below, and repositions the handle.
---@param minValue any
function SliderElement:setMinValue(minValue) end

--- Sets the maximum, forced to at least 1, lowers the value if the given (or current) value is above it, and repositions the handle. No check that max exceeds min.
---@param maxValue any
---@param newCurrentValue any
function SliderElement:setMaxValue(maxValue, newCurrentValue) end

--- Returns the minimum value.
function SliderElement:getMinValue() end

--- Returns the maximum value (the source comment says 'set' by mistake).
function SliderElement:getMaxValue() end

--- Returns the current slider value.
function SliderElement:getValue() end

--- Updates the absolute position through the parent, then recomputes the handle limits.
function SliderElement:updateAbsolutePosition() end

--- Resizes through the parent, then recomputes the handle limits.
---@param x any
---@param y any
function SliderElement:setSize(x, y) end

--- If auto-sizing is on, sizes the handle along the slider axis as the visible-to-total ratio of the track, with minimum sizes (larger for three-part bitmaps), pixel-aligned. Without buttons, also resizes children to the handle size.
---@param visibleItems any
---@param maxItems any
function SliderElement:setSliderSize(visibleItems, maxItems) end

--- Recomputes the minimum and maximum absolute handle positions along the slider axis from position, size and handle size, then repositions the handle.
function SliderElement:updateSliderLimits() end

--- Sets the element alpha through the parent and copies it to the background and handle overlays.
---@param alpha any
function SliderElement:setAlpha(alpha) end

--- Mouse handling: left press starts a drag (on the handle or the track), release raises onClick, mouse wheel changes value by one step, right click resets to default if allowed, and dragging converts the pointer position into a value. Stops the drag when the pointer leaves the bounds on the slider axis.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function SliderElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Computes the handle position from the slider value (inverted on the vertical axis), updates the step buttons and, without buttons, moves the children to the handle position.
function SliderElement:updateSliderPosition() end

--- Raises the onChanged callback with the current value.
function SliderElement:callOnChanged() end

--- Forwards key events to the parent when the element is active and returns whether it consumed them; otherwise returns false.
---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
function SliderElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

--- Draws the background, then the handle when visible and needed (as one image or as start/middle/end parts for three-part bitmaps, by direction), then runs the parent draw.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function SliderElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Returns true when the element handles focus and a slider is needed (content larger than the view).
function SliderElement:canReceiveFocus() end

--- Raises the onClick callback with the current value when the focused slider is activated.
function SliderElement:onFocusActivate() end

--- Increases the value by one step. Wired to the up or down button depending on direction.
function SliderElement:onScrollUp() end

--- Decreases the value by one step. Wired to the up or down button depending on direction.
function SliderElement:onScrollDown() end

--- Synchronizes the slider with a bound ScrollingLayoutElement or SmoothListElement: sets min/max from the content and view sizes, sizes the handle, sets whether a slider is needed, and sets the value from the view offset. Optionally hides the parent when nothing scrolls.
---@param element any
function SliderElement:onBindUpdate(element) end

--- Returns true when the given pointer position is outside the element along the slider axis (x for horizontal, y for vertical).
---@param posX any
---@param posY any
function SliderElement:isOutOfBound(posX, posY) end
