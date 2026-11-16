---@meta
-- FS25 1.25.1.0 : gui/elements/OptionSliderElement.lua (generated stub, FS25 Lua Atlas)

--- Variant of MultiTextOptionElement that adds a draggable slider (and an optional filling bar) whose position follows the current state. Children named slider and fillingBar are bound by name and can be auto-created from default profiles. The slider spans the element width minus a side offset (the left button width by default), and the value text can follow the slider.
---@class OptionSliderElement : MultiTextOptionElement
OptionSliderElement = {}

--- Constructor. Builds a MultiTextOptionElement and adds slider fields: slider and filling bar references, default profile names, filling bar off, and text-follows-slider on.
---@param target any
---@param custom_mt any
function OptionSliderElement.new(target, custom_mt) end

--- Loads the base element, then reads sliderOffset, useFillingBar and updateTextPosition from XML. Note: because of the 'or' pattern, an explicit false for the two boolean keys cannot override a true default.
---@param xmlFile any
---@param key any
function OptionSliderElement:loadFromXML(xmlFile, key) end

--- Loads the base profile, then sliderOffset, useFillingBar, updateTextPosition and the default profile names for the slider, round slider, filling bar and three-part filling bar.
---@param profile any
---@param applyProfile any
function OptionSliderElement:loadProfile(profile, applyProfile) end

--- Copies the slider-specific settings and default profile names from a source element after the base copy.
---@param src any
function OptionSliderElement:copyAttributes(src) end

--- Binds the slider and fillingBar children by name after the base binding. Disables the filling bar if absent, and logs a warning if no slider exists or if there is not enough room, in which case the offset is set to half the width.
function OptionSliderElement:setElementsByName() end

--- When autoAddDefaultElements is set, also creates a missing filling bar (bitmap or three-part) and a missing slider (round-corner or bitmap), depending on which default profiles are defined.
function OptionSliderElement:addDefaultElements() end

--- Runs the base open handling, then repositions the slider for the current state.
function OptionSliderElement:onOpen() end

--- Mouse handling that skips the MultiTextOptionElement version: detects presses on arrows, slider or the slider track, resets repeat state on release, and while dragging snaps the slider to a step, calls setState with forceEvent, and moves the text and filling bar.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function OptionSliderElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Touch version of the mouse handler: only a press on the slider itself starts a drag (the track area is not used), with the same snapping, state change and text/filling-bar updates.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function OptionSliderElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

--- Places the slider proportionally to (state-1)/(number of texts-1) between its min and max X, centers the text on it if enabled and sizes the filling bar. Sets the default offset to the left button width if none is defined.
function OptionSliderElement:updateSlider() end

--- Updates the absolute position through the parent, then repositions the slider.
function OptionSliderElement:updateAbsolutePosition() end

--- Refreshes the displayed content through the parent, then repositions the slider.
function OptionSliderElement:updateContentElement() end
