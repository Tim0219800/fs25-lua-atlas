---@meta
-- FS25 1.25.1.0 : gui/elements/MultiTextOptionElement.lua (generated stub, FS25 Lua Atlas)

--- GUI element for a multiple-choice option: a left button, a right button and a text (or icon) showing the current entry of a list of texts. It extends GuiElement and includes IndexChangeSubjectMixin and PlaySampleMixin. Child elements are found by their name (left, right, label, text, icon, gradient, background), and missing ones can be created from default profiles. Supports wrapping, held-button repeat with faster steps, gamepad and mouse/touch input.
---@class MultiTextOptionElement : GuiElement
MultiTextOptionElement = {}

--- Constructor. Creates the element, mixes in the index-change and sound mixins and sets defaults: state 1, wrapping on, no texts, and no child element references yet.
---@param target any
---@param custom_mt any
function MultiTextOptionElement.new(target, custom_mt) end

--- Loads the element from XML after the parent loader, setting the mod environment first for l10n. Reads callbacks (onClick, onFocus, onLeave), wrap and button-visibility flags, scroll timing, and a '|'-separated texts string whose $l10n_ parts are translated.
---@param xmlFile any
---@param key any
function MultiTextOptionElement:loadFromXML(xmlFile, key) end

--- Applies a GUI profile after the parent: same options as the XML loader plus the default profiles for buttons, text and backgrounds, autoAddDefaultElements, and a texts list. Note: $l10n_ texts here are translated without the mod custom environment.
---@param profile any
---@param applyProfile any
function MultiTextOptionElement:loadProfile(profile, applyProfile) end

--- Clones the element through the parent clone, then adds missing default child elements and re-links the clone's children by name.
---@param parent any
---@param includeId any
---@param suppressOnCreate any
---@param blockFocusHandlingReload any
function MultiTextOptionElement:clone(parent, includeId, suppressOnCreate, blockFocusHandlingReload) end

--- Copies state, flags, timing, default profiles, callbacks and all texts from a source element, and clones the two mixins from it.
---@param src any
function MultiTextOptionElement:copyAttributes(src) end

--- Called once the GUI is built: adds default children if enabled, binds children by name, refreshes absolute position and silences the click sound of the left and right buttons.
function MultiTextOptionElement:onGuiSetupFinished() end

--- Scans the children and binds them by name: left/right buttons (rewired to this element's click handlers, replacing duplicates), label, text, icon, gradients and background (resized to the element width). Logs a warning and stops at the first unnamed child.
function MultiTextOptionElement:setElementsByName() end

--- If autoAddDefaultElements is set, creates any missing background (round, three-part or bitmap by profile), left button, right button and text child, and applies the matching default profile.
function MultiTextOptionElement:addDefaultElements() end

--- Sets the current index, clamped between 1 and the number of texts, refreshes the display and notifies index observers. With forceEvent it also raises the click callback.
---@param state any
---@param forceEvent any
function MultiTextOptionElement:setState(state, forceEvent) end

--- Returns the current 1-based index.
function MultiTextOptionElement:getState() end

--- Disables automatic sample playback on the left and right child buttons.
function MultiTextOptionElement:disableButtonSounds() end

--- Appends a text, or inserts it at index i, refreshes the display, recomputes the dynamic fast-scroll step (texts/5, max 10) unless disabled, and notifies index observers.
---@param text any
---@param i any
function MultiTextOptionElement:addText(text, i) end

--- Replaces the whole text list (nil empties it), leaves image mode, clamps the state to the new size, refreshes the display, updates the dynamic scroll step and notifies observers.
---@param texts any
function MultiTextOptionElement:setTexts(texts) end

--- Uses the list as icon entries (image filenames) instead of texts and enables image mode, so the icon child shows the entry when the file exists. Clamps the state and notifies observers.
---@param icons any
function MultiTextOptionElement:setIcons(icons) end

--- Sets the header label text if a label child exists; otherwise does nothing.
---@param labelString any
function MultiTextOptionElement:setLabel(labelString) end

--- Handles mouse input: tracks which arrow button is held (starting the repeat timer), releases input when no button is pressed, and manages hover highlight through FocusManager. Returns whether the event was used.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function MultiTextOptionElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Touch counterpart of mouseEvent with the same held-button and highlight logic, using the element hotspot for hit testing.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function MultiTextOptionElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

--- Handles gamepad/keyboard actions: left/right axis beyond the analog tolerance and page prev/next trigger inputLeft/inputRight and press the matching button visually. Returns true when consumed.
---@param action any
---@param value any
---@param eventUsed any
function MultiTextOptionElement:inputEvent(action, value, eventUsed) end

--- Per-frame update: while an arrow is held and the delay has elapsed it repeats the step, accumulates continuous-trigger time, and releases the buttons when no input event arrived for a frame. inputLeft, inputRight and releaseInput are not in the dump (UNVERIFIED).
---@param dt any
function MultiTextOptionElement:update(dt) end

--- Moves the state forward by steps (default 1, or the fast step after a long hold), wrapping or clamping, plays a click sound if it changed, optionally focuses the element, then refreshes, raises the click callback with false and notifies observers.
---@param steps any
---@param noFocus any
function MultiTextOptionElement:onRightButtonClicked(steps, noFocus) end

--- Moves the state backward, same logic as the right-button handler, but raises the click callback with true. Note: the boolean passed to the callback differs between the two directions.
---@param steps any
---@param noFocus any
function MultiTextOptionElement:onLeftButtonClicked(steps, noFocus) end

--- Returns whether the user is currently allowed to change the state with the buttons.
function MultiTextOptionElement:getCanChangeState() end

--- Enables or blocks state changes made through the left and right buttons.
---@param canChangeState any
function MultiTextOptionElement:setCanChangeState(canChangeState) end

--- Returns true when the element is enabled, visible, handles focus and, if disableButtonsOnSingleText is set, has more than one text.
---@param element any
---@param direction any
function MultiTextOptionElement:canReceiveFocus(element, direction) end

--- Runs the parent focus-leave handling and raises the onLeaveCallback with this element.
function MultiTextOptionElement:onFocusLeave() end

--- Runs the parent focus-enter handling and raises the onFocusCallback with this element.
function MultiTextOptionElement:onFocusEnter() end

--- Refreshes the visuals for the current state: shows the icon (when in image mode and the texture file exists) or the text, toggles gradients, disables the element when it has at most one text if configured, and hides arrows at the limits when not wrapping.
function MultiTextOptionElement:updateContentElement() end
