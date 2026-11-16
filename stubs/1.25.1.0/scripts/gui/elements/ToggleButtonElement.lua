---@meta
-- FS25 1.25.1.0 : gui/elements/ToggleButtonElement.lua (generated stub, FS25 Lua Atlas)

--- Two-state toggle button derived from BitmapElement. Its first child element is shown when checked and its second when unchecked; children's clicks are routed to onButtonClicked, which flips the state and calls the onClick callback. XML keys: onClick, isChecked. Focus handling is forwarded to the children.
---@class ToggleButtonElement : BitmapElement
ToggleButtonElement = {}

--- Constructor. Creates the element on BitmapElement, initially unchecked.
---@param target any
---@param custom_mt any
function ToggleButtonElement.new(target, custom_mt) end

--- Loads the onClick callback and the isChecked flag from XML and applies the state.
---@param xmlFile any
---@param key any
function ToggleButtonElement:loadFromXML(xmlFile, key) end

--- Loads isChecked from a GUI profile and applies the state.
---@param profile any
---@param applyProfile any
function ToggleButtonElement:loadProfile(profile, applyProfile) end

--- Copies the checked state and click callback from a source element.
---@param src any
function ToggleButtonElement:copyAttributes(src) end

--- Stores the state and shows the first child when checked, the second when not. Does not call the click callback.
---@param isChecked any
function ToggleButtonElement:setIsChecked(isChecked) end

--- Adds a child; for the first two children it makes the toggle their target, redirects their click callback to onButtonClicked and re-applies checked and disabled state.
---@param element any
function ToggleButtonElement:addElement(element) end

--- When active, highlights the button on hover (or unhighlights) and passes the event to the parent. Returns false when inactive.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function ToggleButtonElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Flips the checked state, then calls onClickCallback as (target, self, isChecked) or (self, isChecked) when no target is set.
function ToggleButtonElement:onButtonClicked() end

--- True unless the button is disabled or not visible.
function ToggleButtonElement:canReceiveFocus() end

--- Always returns the toggle itself as the focus target, overriding parent behaviour.
function ToggleButtonElement:getFocusTarget() end

--- Forwards the focus-leave event to both child elements if present.
function ToggleButtonElement:onFocusLeave() end

--- Forwards the focus-enter event to both child elements if present.
function ToggleButtonElement:onFocusEnter() end

--- Activation via focus (e.g. confirm button) toggles the state like a click.
function ToggleButtonElement:onFocusActivate() end
