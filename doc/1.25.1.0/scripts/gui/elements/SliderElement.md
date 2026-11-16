# gui/elements/SliderElement.lua

*[Version française](../../../fr/scripts/gui/elements/SliderElement.md)*

Source: `dataS/scripts/gui/elements/SliderElement.lua` — FS25 1.25.1.0

✍ Draggable slider (scroll bar) GUI element extending GuiElement with PlaySampleMixin. It keeps a numeric value between a min and max, draws a background and a handle (optionally in three parts), and by default expects two ButtonElement children as step buttons. It can bind to a data element such as a ScrollingLayoutElement or SmoothListElement to mirror its scroll range, and notifies children and the data element through onSliderValueChanged. Horizontal and vertical directions are supported.

- **SliderElement** inherits from `GuiElement` (l.36)

## Functions

| Function | Line | Description |
|---|---|---|
| `SliderElement.new(target: any, custom_mt: any)` | 46 | ✍ Constructor. Creates the element with the sound mixin and defaults: range 0 to 100, step 1, vertical direction, buttons expected, empty overlay tables, slider visible and needed, no step rounding, no reset to default. |
| `SliderElement:delete()` | 96 | ✍ Deletes the end, start, slider and background overlays, then runs the parent delete. |
| `SliderElement:loadFromXML(xmlFile: any, key: any)` | 107 | ✍ Loads the four overlays (image, sliderImage, startImage, endImage) and the XML options: direction (x or y), callbacks onClick and onChanged, hasButtons, min/max (swapped with a warning if inverted), current value, step size, three-part bitmap, hideParentWhenEmpty, step rounding, margins, sizes, data/text element ids or names and resetToDefault. |
| `SliderElement:loadProfile(profile: any, applyProfile: any)` | 164 | ✍ Profile counterpart of the XML loader: loads overlays, direction, button flag, range (swapped with a warning), current/default value, step size, three-part flag, rounding, sizes, margin, offset and resetToDefault. |
| `SliderElement:copyAttributes(src: any)` | 210 | ✍ Copies overlays, direction, range, value, step, sizes, flags, element ids and callbacks from a source slider (cloning size tables), and clones the sound mixin. The default value is set to the copied current value. |
| `SliderElement:setSliderVisible(visible: any)` | 249 | ✍ Shows or hides the slider handle drawing; the slider still works. |
| `SliderElement:onGuiSetupFinished()` | 255 | ✍ After base setup, resolves the text element and the data element from the target by id (or by name among the parent's descendants), printing a warning if not found, and applies sliderBoxMargin by shrinking and shifting the element along its axis. |
| `SliderElement:addElement(element: any)` | 297 | ✍ Adds the child; if buttons are enabled, the first child becomes the up button and the second the down button, wired to onScrollDown/onScrollUp with the order swapped by direction. Other children are left unchanged. |
| `SliderElement:setDataElement(element: any)` | 331 | ✍ Binds the slider to a data element (a scrolling layout or list): unlinks the previous one, stores a back-reference on the new one in sliderElement and calls onBindUpdate without updating the element. |
| `SliderElement:setValue(newValue: any, doNotUpdateDataElement: any, immediateMode: any)` | 347 | ✍ Sets the slider value: moves the handle (clamped), optionally rounds to the step, rounds to 5 decimals and clamps. If the value changed, updates the text element, raises onChanged, calls onSliderValueChanged on children and (unless disabled by the flag) the data element, updates buttons and returns true. |
| `SliderElement:updateSliderButtons()` | 400 | ✍ Disables the up button at the maximum value and the down button at the minimum, and both if the slider is disabled. |
| `SliderElement:setMinValue(minValue: any)` | 412 | ✍ Sets the minimum, forced to at least 1 (a ToDo in the source), moves the value up if it is now below, and repositions the handle. |
| `SliderElement:setMaxValue(maxValue: any, newCurrentValue: any)` | 425 | ✍ Sets the maximum, forced to at least 1, lowers the value if the given (or current) value is above it, and repositions the handle. No check that max exceeds min. |
| `SliderElement:getMinValue()` | 442 | ✍ Returns the minimum value. |
| `SliderElement:getMaxValue()` | 448 | ✍ Returns the maximum value (the source comment says 'set' by mistake). |
| `SliderElement:getValue()` | 454 | ✍ Returns the current slider value. |
| `SliderElement:updateAbsolutePosition()` | 460 | ✍ Updates the absolute position through the parent, then recomputes the handle limits. |
| `SliderElement:setSize(x: any, y: any)` | 467 | ✍ Resizes through the parent, then recomputes the handle limits. |
| `SliderElement:setSliderSize(visibleItems: any, maxItems: any)` | 474 | ✍ If auto-sizing is on, sizes the handle along the slider axis as the visible-to-total ratio of the track, with minimum sizes (larger for three-part bitmaps), pixel-aligned. Without buttons, also resizes children to the handle size. |
| `SliderElement:updateSliderLimits()` | 501 | ✍ Recomputes the minimum and maximum absolute handle positions along the slider axis from position, size and handle size, then repositions the handle. |
| `SliderElement:setAlpha(alpha: any)` | 511 | ✍ Sets the element alpha through the parent and copies it to the background and handle overlays. |
| `SliderElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 523 | ✍ Mouse handling: left press starts a drag (on the handle or the track), release raises onClick, mouse wheel changes value by one step, right click resets to default if allowed, and dragging converts the pointer position into a value. Stops the drag when the pointer leaves the bounds on the slider axis. |
| `SliderElement:updateSliderPosition()` | 608 | ✍ Computes the handle position from the slider value (inverted on the vertical axis), updates the step buttons and, without buttons, moves the children to the handle position. |
| `SliderElement:callOnChanged()` | 630 | ✍ Raises the onChanged callback with the current value. |
| `SliderElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 636 | ✍ Forwards key events to the parent when the element is active and returns whether it consumed them; otherwise returns false. |
| `SliderElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 648 | ✍ Draws the background, then the handle when visible and needed (as one image or as start/middle/end parts for three-part bitmaps, by direction), then runs the parent draw. |
| `SliderElement:canReceiveFocus()` | 707 | ✍ Returns true when the element handles focus and a slider is needed (content larger than the view). |
| `SliderElement:onFocusActivate()` | 713 | ✍ Raises the onClick callback with the current value when the focused slider is activated. |
| `SliderElement:onScrollUp()` | 719 | ✍ Increases the value by one step. Wired to the up or down button depending on direction. |
| `SliderElement:onScrollDown()` | 725 | ✍ Decreases the value by one step. Wired to the up or down button depending on direction. |
| `SliderElement:onBindUpdate(element: any)` | 731 | ✍ Synchronizes the slider with a bound ScrollingLayoutElement or SmoothListElement: sets min/max from the content and view sizes, sizes the handle, sets whether a slider is needed, and sets the value from the view offset. Optionally hides the parent when nothing scrolls. |
| `SliderElement:isOutOfBound(posX: any, posY: any)` | 776 | ✍ Returns true when the given pointer position is outside the element along the slider axis (x for horizontal, y for vertical). |
