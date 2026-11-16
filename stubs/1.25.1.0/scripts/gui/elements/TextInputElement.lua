---@meta
-- FS25 1.25.1.0 : gui/elements/TextInputElement.lua (generated stub, FS25 Lua Atlas)

--- Single-line editable text box for menus, derived from ButtonElement. It captures keyboard (or on-screen IME) input while pressed, manages a blinking cursor, horizontal scrolling with front/back ellipsis, password masking and an optional profanity filter. It switches the input binding context while capturing so game actions do not fire. Loads attributes such as maxCharacters, maxInputTextWidth, isPassword and several callbacks (onEnterPressed, onEscPressed, onTextChanged, onIsUnicodeAllowed) from XML or a GUI profile.
---@class TextInputElement : ButtonElement
TextInputElement = {}

--- Constructor. Builds the element on top of ButtonElement and initialises cursor, blink timing, text state, IME support flag (from imeIsSupported), forced focus and the text-box focus sound.
---@param target any
---@param custom_mt any
function TextInputElement.new(target, custom_mt) end

--- Aborts any running IME session, deletes the cursor overlay and then calls the parent delete.
function TextInputElement:delete() end

--- Converts a text through g_i18n:convertText so l10n tokens in IME strings are resolved; returns nil/false input unchanged.
---@param str any
function TextInputElement:translate(str) end

--- Reads the element from XML: the five callbacks, IME keyboard type/title/description/placeholder, maxCharacters, maxInputTextWidth, cursor offset/size/overlay, enterWhenClickOutside, applyProfanityFilter and isPassword. Ensures the cursor is at least one pixel wide.
---@param xmlFile any
---@param key any
function TextInputElement:loadFromXML(xmlFile, key) end

--- Applies GUI profile values (maxCharacters, maxInputTextWidth, cursor offset/size/image size, isPassword, applyProfanityFilter) and loads the cursor overlay from the profile.
---@param profile any
---@param applyProfile any
function TextInputElement:loadProfile(profile, applyProfile) end

--- Copies IME settings, limits, cursor overlay and geometry, password flag, callbacks and behaviour flags from another TextInputElement when cloning.
---@param src any
function TextInputElement:copyAttributes(src) end

--- Recomputes the space the cursor needs and logs an error if centre/right alignment is used without maxInputTextWidth, or a warning if that width is too small for the dots plus cursor.
function TextInputElement:finalize() end

--- Uses the base GuiElement active check, deliberately bypassing ButtonElement's version, which would behave incompatibly for a text box.
function TextInputElement:getIsActive() end

--- Starts or stops input capture. Starting switches g_inputBinding to the text-input context (reverting a previous one if needed) and, on non-console, registers MENU_BACK/MENU_ACCEPT; stopping reverts the context and, unless it is a password or filtering is disabled, runs filterText on the content.
---@param isCapturing any
function TextInputElement:setCaptureInput(isCapturing) end

--- Sets the element alpha through the parent and mirrors it onto the cursor overlay.
---@param alpha any
function TextInputElement:setAlpha(alpha) end

--- Always returns false so the parent does not draw the text itself; draw() renders the visible text parts manually.
function TextInputElement:getDoRenderText() end

--- Resets the parent state and stops any key auto-repeat in progress.
function TextInputElement:reset() end

--- Sets the text, truncating to maxCharacters (UTF-8 aware), moves the cursor to the end and refreshes the visible portions. Does not raise onTextChanged.
---@param text any
function TextInputElement:setText(text) end

--- Enters or leaves editing mode: toggles input capture, sets focus on the element, restores or clears the previous focus state on exit, stops key repeat and refreshes the visible text.
---@param force any
function TextInputElement:setForcePressed(force) end

--- Returns whether a typed character is accepted: rejects line breaks and characters the font cannot render, then defers to the onIsUnicodeAllowed callback (default true).
---@param unicode any
function TextInputElement:getIsUnicodeAllowed(unicode) end

--- Handles mouse interaction: highlights on hover, enters edit mode on left click (opening the IME on release when supported), and leaves edit mode on a click outside, optionally firing onEnterPressed. Returns whether the event was consumed.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function TextInputElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Moves the cursor one character left, or to the start of the previous word when the ctrl modifier flag is set.
---@param isLeftCtrlPressed any
function TextInputElement:moveCursorLeft(isLeftCtrlPressed) end

--- Moves the cursor one character right, or jumps to the next word start when the ctrl modifier flag is set.
---@param isLeftCtrlPressed any
function TextInputElement:moveCursorRight(isLeftCtrlPressed) end

--- Sets the 1-based cursor position, clamped between 1 and text length plus one.
---@param position any
function TextInputElement:setCursorPosition(position) end

--- Deletes the character before the cursor, or the one after it when the argument is true, then raises onTextChanged. Does nothing at the text boundaries.
---@param deleteRightCharacterFromCursor any
function TextInputElement:deleteText(deleteRightCharacterFromCursor) end

--- Clears the auto-repeat state (key, delay and remaining delay) for held navigation/delete keys.
function TextInputElement:stopSpecialKeyRepeating() end

--- Opens the platform on-screen input (imeOpen) with the current text, title, description, placeholder, keyboard type and max length (512 if unset). Returns true and subscribes to pause changes if it opened.
function TextInputElement:openIme() end

--- Cancels an active IME session via imeAbort, clears the stored previous text and unsubscribes from pause messages.
function TextInputElement:abortIme() end

--- Processes keyboard input while in edit mode: enter/escape on key release, arrows, home/end, delete, backspace (ctrl removes a word), ctrl+V paste and normal characters inserted at the cursor, with auto-repeat. Raises onEnterPressed, onEscPressed and onTextChanged.
---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
function TextInputElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

--- Handles gamepad/menu actions while editing (no IME active): MENU_ACCEPT confirms and MENU_BACK/MENU_CANCEL cancels, each leaving edit mode and raising the matching callback.
---@param action any
---@param value any
---@param eventUsed any
function TextInputElement:inputEvent(action, value, eventUsed) end

--- Per-frame update: advances the cursor blink timer, drives accelerated key auto-repeat, polls the IME for completion or live text, and decrements the input block timer. dt is in milliseconds.
---@param dt any
function TextInputElement:update(dt) end

--- Draws the parent background with empty text, then renders front dots, text before the cursor, the blinking cursor, text after it and back dots, honouring alignment and optional clip area.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function TextInputElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Allows focus navigation to leave the element only when it is not in edit mode.
---@param direction any
function TextInputElement:shouldFocusChange(direction) end

--- On focus loss, aborts the IME, leaves edit mode and calls the parent handler.
function TextInputElement:onFocusLeave() end

--- Activation by focus (e.g. gamepad confirm): raises onEnter, then either finishes editing and raises onEnterPressed, or opens the IME and enters edit mode. Ignored while the input block timer runs.
function TextInputElement:onFocusActivate() end

--- When the parent screen closes, aborts the IME and leaves edit mode so input mode is not left active.
function TextInputElement:onClose() end

--- Renders one text segment (with optional shadow text) at the given x offset and returns its width, used to chain dots, text parts and cursor.
---@param text any
---@param textXPos any
---@param displacementX any
---@param textYPos any
function TextInputElement:drawTextPart(text, textXPos, displacementX, textYPos) end

--- Draws the cursor overlay, pixel-snapped, during the visible half of the blink cycle and returns the horizontal space reserved for the cursor.
---@param textXPos any
---@param displacementX any
---@param textYPos any
function TextInputElement:drawCursor(textXPos, displacementX, textYPos) end

--- Recomputes which parts of the text (before/after cursor, front/back dots) fit in maxInputTextWidth. Passwords are shown as asterisks; when not editing, the text is shown from its start and cut with back dots.
function TextInputElement:updateVisibleTextElements() end

--- Static helper that trims text from the back (or from the front if trimFront) until it fits the width. Returns the trimmed text and the first/last character indices.
---@param text any
---@param textSize any
---@param availableWidth any
---@param trimFront any
function TextInputElement.limitTextToAvailableWidth(text, textSize, availableWidth, trimFront) end

--- Returns maxInputTextWidth minus the space taken by visible dots and cursor, or nil when no maximum width is set.
function TextInputElement:getAvailableTextWidth() end

--- Sums the widths of all currently visible parts (dots, text segments, cursor); used to align centred or right-aligned text.
function TextInputElement:getNeededTextWidth() end

--- Returns the current raw text of the input (not masked for passwords).
function TextInputElement:getText() end
