---@meta
-- FS25 1.25.1.0 : gui/elements/BinaryOptionElement.lua (generated stub, FS25 Lua Atlas)

--- Two-choice option element (left/right, default texts off/on or no/yes) with two buttons and a slider that glides between them. Derived from MultiTextOptionElement; similar to CheckedOptionElement but driven by left/right input and an animated slider. Texts come from `g_i18n` strings; STATE_LEFT, STATE_RIGHT, NUM_SLIDER_STATES and STRING_* constants are defined elsewhere. Client-side GUI.
---@class BinaryOptionElement : MultiTextOptionElement
BinaryOptionElement = {}

--- Constructor; initializes slider state (no slider element, not moving, direction 0) and the yes/no text flag to false.
---@param target any
---@param custom_mt any
function BinaryOptionElement.new(target, custom_mt) end

--- Reads the optional `useYesNoTexts` boolean from the XML node after the parent attributes.
---@param xmlFile any
---@param key any
function BinaryOptionElement:loadFromXML(xmlFile, key) end

--- Reads useYesNoTexts, sliderOffset and the default slider profiles (plain, round, three-part) from a GUI profile.
---@param profile any
---@param applyProfile any
function BinaryOptionElement:loadProfile(profile, applyProfile) end

--- Copies useYesNoTexts and the three default slider profile names from a source element.
---@param src any
function BinaryOptionElement:copyAttributes(src) end

--- Re-scans the children after naming: finds the child named "slider" (warns if missing), binds the two buttons' selected state and scroll permission to this element's state/focus, and computes the slider travel per animation step.
function BinaryOptionElement:setElementsByName() end

--- When automatic default elements are enabled and no "slider" child exists, creates one (RoundCornerElement, ThreePartBitmapElement or BitmapElement depending on which default slider profile is set) and applies that profile.
function BinaryOptionElement:addDefaultElements() end

--- Sets the two button texts to localized no/yes or off/on depending on `useYesNoTexts` and hides the inherited text element.
function BinaryOptionElement:onGuiSetupFinished() end

--- Returns true when the right-hand state is selected (the right choice counts as checked).
function BinaryOptionElement:getIsChecked() end

--- Sets the state to right (checked) or left (unchecked), optionally forcing the click callback, then stores `skipAnimation` so the slider can jump instead of gliding on the next update.
---@param isChecked any
---@param skipAnimation any
---@param forceEvent any
function BinaryOptionElement:setIsChecked(isChecked, skipAnimation, forceEvent) end

--- Reports the element as active whenever it is visible, even if disabled, so `update` keeps running and the slider movement can finish.
function BinaryOptionElement:getIsActiveNonRec() end

--- Sets the texts of the left and right buttons. Logs a warning with call stack when the table does not contain exactly two entries.
---@param texts any
function BinaryOptionElement:setTexts(texts) end

--- Per-frame update that advances the slider one step toward its target, or jumps to the end when skipping animation, stops at either end, and repositions the slider element. Resets `skipAnimation` afterwards.
---@param dt any
function BinaryOptionElement:update(dt) end

--- Handles a left input: if the slider is idle and the element is focused or its left button is pressed, triggers the left click and returns true; otherwise returns false.
function BinaryOptionElement:inputLeft() end

--- Handles a right input: if the slider is idle and the element is focused or its right button is pressed, triggers the right click and returns true; otherwise returns false.
function BinaryOptionElement:inputRight() end

--- Validates that the state is left or right (warns otherwise). If unchanged, optionally raises the click callback when forced; if changed, applies it via the parent, refreshes selection and slider direction, and stores `skipAnimation`.
---@param state any
---@param forceEvent any
---@param skipAnimation any
function BinaryOptionElement:setState(state, forceEvent, skipAnimation) end

--- Gives focus to the element silently, then if changes are allowed and the state is not already right, plays the click sound, switches to right, updates content, raises the click callback (false) and notifies the index change.
function BinaryOptionElement:onRightButtonClicked() end

--- Gives focus silently, then if allowed and not already left, plays the click sound, switches to left, updates content, raises the click callback (true) and notifies the index change.
function BinaryOptionElement:onLeftButtonClicked() end

--- Marks the matching button as selected and sets the slider direction (+1 toward right, -1 toward left) so `update` animates it.
function BinaryOptionElement:updateSelection() end
