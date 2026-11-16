---@meta
-- FS25 1.25.1.0 : gui/elements/ScrollingLayoutElement.lua (generated stub, FS25 Lua Atlas)

--- Box layout (extends BoxLayoutElement) with smooth scrolling, clipping and optional touch scrolling. With a single flow it scrolls along the flow axis; with several flows (or 0 for as many as needed) the scroll axis is perpendicular. A SliderElement can bind to it through sliderElement. Much of the scrolling logic (update, input handling, clipper updates, updateContentSize) is absent from this dump (UNVERIFIED).
---@class ScrollingLayoutElement : BoxLayoutElement
ScrollingLayoutElement = {}

--- Constructor. Builds a BoxLayoutElement with clipping and focus wrap-around enabled, zero content offsets and targets, content size 1, no slider, and touch scrolling support taken from Platform.hasTouchInput.
---@param target any
---@param custom_mt any
function ScrollingLayoutElement.new(target, custom_mt) end

--- Loads the base layout, then reads topClipperElementName, bottomClipperElementName and supportsTouchScrolling from the XML.
---@param xmlFile any
---@param key any
function ScrollingLayoutElement:loadFromXML(xmlFile, key) end

--- Copies the clipper element names and touch scrolling flag from a source element.
---@param src any
function ScrollingLayoutElement:copyAttributes(src) end

--- After base setup, looks up the top and bottom clipper elements among the parent's descendants, registers focus listeners on children, derives the scroll direction from flow direction and number of flows, and sets the scroll speed interval from the pixel size on that axis.
function ScrollingLayoutElement:onGuiSetupFinished() end

--- Rebuilds the layout: unless blocked it recomputes cells, then applies cell positions with the current content offsets, relinks focus, updates the content size and the scroll clippers. Returns the max flow size.
---@param ignoreVisibility any
---@param blockLayoutUpdate any
function ScrollingLayoutElement:invalidateLayout(ignoreVisibility, blockLayoutUpdate) end

--- Called by the bound slider: converts its value into a content offset (inverted sign on the horizontal axis) and scrolls there without updating the slider back.
---@param slider any
---@param newValue any
function ScrollingLayoutElement:onSliderValueChanged(slider, newValue) end

--- Scrolls to an offset along the scroll axis, optionally keeping the target unchanged, re-applies positions, updates the bound slider unless disabled, and raises onScrollCallback.
---@param startPos any
---@param updateSlider any
---@param noUpdateTarget any
function ScrollingLayoutElement:scrollTo(startPos, updateSlider, noUpdateTarget) end

--- If a slider is bound, asks it to refresh itself from this layout through its onBindUpdate.
function ScrollingLayoutElement:raiseSliderUpdateEvent() end

--- Removes the child through the parent. Note: the condition 'scrollingFocusEnter_orig == nil' looks inverted, so it assigns nil to onFocusEnter instead of restoring the saved original.
---@param element any
function ScrollingLayoutElement:removeElement(element) end

--- Removes the non-GUI input action events registered by this element in g_inputBinding.
function ScrollingLayoutElement:removeActionEvents() end

--- Input callback for a secondary vertical axis: when not driven by the mouse, moves the bound slider by its step size times the input value. Resets the useMouse flag. Errors if no slider is bound.
---@param _ any
---@param inputValue any
function ScrollingLayoutElement:onVerticalCursorInput(_, inputValue) end
