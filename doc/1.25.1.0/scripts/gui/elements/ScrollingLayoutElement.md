# gui/elements/ScrollingLayoutElement.lua

*[Version française](../../../fr/scripts/gui/elements/ScrollingLayoutElement.md)*

Source: `dataS/scripts/gui/elements/ScrollingLayoutElement.lua` — FS25 1.25.1.0

✍ Box layout (extends BoxLayoutElement) with smooth scrolling, clipping and optional touch scrolling. With a single flow it scrolls along the flow axis; with several flows (or 0 for as many as needed) the scroll axis is perpendicular. A SliderElement can bind to it through sliderElement. Much of the scrolling logic (update, input handling, clipper updates, updateContentSize) is absent from this dump (UNVERIFIED).

- **ScrollingLayoutElement** inherits from `BoxLayoutElement` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `ScrollingLayoutElement.new(target: any, custom_mt: any)` | 20 | ✍ Constructor. Builds a BoxLayoutElement with clipping and focus wrap-around enabled, zero content offsets and targets, content size 1, no slider, and touch scrolling support taken from Platform.hasTouchInput. |
| `ScrollingLayoutElement:loadFromXML(xmlFile: any, key: any)` | 51 | ✍ Loads the base layout, then reads topClipperElementName, bottomClipperElementName and supportsTouchScrolling from the XML. |
| `ScrollingLayoutElement:copyAttributes(src: any)` | 68 | ✍ Copies the clipper element names and touch scrolling flag from a source element. |
| `ScrollingLayoutElement:onGuiSetupFinished()` | 78 | ✍ After base setup, looks up the top and bottom clipper elements among the parent's descendants, registers focus listeners on children, derives the scroll direction from flow direction and number of flows, and sets the scroll speed interval from the pixel size on that axis. |
| `ScrollingLayoutElement:invalidateLayout(ignoreVisibility: any, blockLayoutUpdate: any)` | 115 | ✍ Rebuilds the layout: unless blocked it recomputes cells, then applies cell positions with the current content offsets, relinks focus, updates the content size and the scroll clippers. Returns the max flow size. |
| `ScrollingLayoutElement:onSliderValueChanged(slider: any, newValue: any)` | 161 | ✍ Called by the bound slider: converts its value into a content offset (inverted sign on the horizontal axis) and scrolls there without updating the slider back. |
| `ScrollingLayoutElement:scrollTo(startPos: any, updateSlider: any, noUpdateTarget: any)` | 181 | ✍ Scrolls to an offset along the scroll axis, optionally keeping the target unchanged, re-applies positions, updates the bound slider unless disabled, and raises onScrollCallback. |
| `ScrollingLayoutElement:raiseSliderUpdateEvent()` | 276 | ✍ If a slider is bound, asks it to refresh itself from this layout through its onBindUpdate. |
| `ScrollingLayoutElement:removeElement(element: any)` | 317 | ✍ Removes the child through the parent. Note: the condition 'scrollingFocusEnter_orig == nil' looks inverted, so it assigns nil to onFocusEnter instead of restoring the saved original. |
| `ScrollingLayoutElement:removeActionEvents()` | 481 | ✍ Removes the non-GUI input action events registered by this element in g_inputBinding. |
| `ScrollingLayoutElement:onVerticalCursorInput(_: any, inputValue: any)` | 487 | ✍ Input callback for a secondary vertical axis: when not driven by the mouse, moves the bound slider by its step size times the input value. Resets the useMouse flag. Errors if no slider is bound. |
