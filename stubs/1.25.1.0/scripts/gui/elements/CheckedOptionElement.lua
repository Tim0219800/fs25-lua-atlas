---@meta
-- FS25 1.25.1.0 : gui/elements/CheckedOptionElement.lua (generated stub, FS25 Lua Atlas)

--- Two-state off/on option element derived from MultiTextOptionElement; the states are the CheckedOptionElement.STATE_UNCHECKED and STATE_CHECKED constants (defined elsewhere). Client-side GUI.
---@class CheckedOptionElement : MultiTextOptionElement
CheckedOptionElement = {}

--- Constructor; builds the element through MultiTextOptionElement.
---@param target any
---@param custom_mt any
function CheckedOptionElement.new(target, custom_mt) end

--- Adds a child; once the element count reaches 3, sets the option texts to the localized off/on labels (`ui_off`, `ui_on`) and reapplies the checked state.
---@param element any
function CheckedOptionElement:addElement(element) end

--- Returns true when the current state equals STATE_CHECKED.
function CheckedOptionElement:getIsChecked() end

--- Sets the state to STATE_CHECKED or STATE_UNCHECKED according to the boolean.
---@param isChecked any
function CheckedOptionElement:setIsChecked(isChecked) end
