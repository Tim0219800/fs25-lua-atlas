# gui/elements/OptionSliderElement.lua

*[Version française](../../../fr/scripts/gui/elements/OptionSliderElement.md)*

Source: `dataS/scripts/gui/elements/OptionSliderElement.lua` — FS25 1.25.1.0

✍ Variant of MultiTextOptionElement that adds a draggable slider (and an optional filling bar) whose position follows the current state. Children named slider and fillingBar are bound by name and can be auto-created from default profiles. The slider spans the element width minus a side offset (the left button width by default), and the value text can follow the slider.

- **OptionSliderElement** inherits from `MultiTextOptionElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `OptionSliderElement.new(target: any, custom_mt: any)` | 19 | ✍ Constructor. Builds a MultiTextOptionElement and adds slider fields: slider and filling bar references, default profile names, filling bar off, and text-follows-slider on. |
| `OptionSliderElement:loadFromXML(xmlFile: any, key: any)` | 39 | ✍ Loads the base element, then reads sliderOffset, useFillingBar and updateTextPosition from XML. Note: because of the 'or' pattern, an explicit false for the two boolean keys cannot override a true default. |
| `OptionSliderElement:loadProfile(profile: any, applyProfile: any)` | 49 | ✍ Loads the base profile, then sliderOffset, useFillingBar, updateTextPosition and the default profile names for the slider, round slider, filling bar and three-part filling bar. |
| `OptionSliderElement:copyAttributes(src: any)` | 65 | ✍ Copies the slider-specific settings and default profile names from a source element after the base copy. |
| `OptionSliderElement:setElementsByName()` | 81 | ✍ Binds the slider and fillingBar children by name after the base binding. Disables the filling bar if absent, and logs a warning if no slider exists or if there is not enough room, in which case the offset is set to half the width. |
| `OptionSliderElement:addDefaultElements()` | 110 | ✍ When autoAddDefaultElements is set, also creates a missing filling bar (bitmap or three-part) and a missing slider (round-corner or bitmap), depending on which default profiles are defined. |
| `OptionSliderElement:onOpen()` | 146 | ✍ Runs the base open handling, then repositions the slider for the current state. |
| `OptionSliderElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 154 | ✍ Mouse handling that skips the MultiTextOptionElement version: detects presses on arrows, slider or the slider track, resets repeat state on release, and while dragging snaps the slider to a step, calls setState with forceEvent, and moves the text and filling bar. |
| `OptionSliderElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 259 | ✍ Touch version of the mouse handler: only a press on the slider itself starts a drag (the track area is not used), with the same snapping, state change and text/filling-bar updates. |
| `OptionSliderElement:updateSlider()` | 352 | ✍ Places the slider proportionally to (state-1)/(number of texts-1) between its min and max X, centers the text on it if enabled and sizes the filling bar. Sets the default offset to the left button width if none is defined. |
| `OptionSliderElement:updateAbsolutePosition()` | 388 | ✍ Updates the absolute position through the parent, then repositions the slider. |
| `OptionSliderElement:updateContentElement()` | 396 | ✍ Refreshes the displayed content through the parent, then repositions the slider. |
