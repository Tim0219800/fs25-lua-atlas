# gui/elements/TextInputElement.lua

*[Version française](../../../fr/scripts/gui/elements/TextInputElement.md)*

Source: `dataS/scripts/gui/elements/TextInputElement.lua` — FS25 1.25.1.0

✍ Single-line editable text box for menus, derived from ButtonElement. It captures keyboard (or on-screen IME) input while pressed, manages a blinking cursor, horizontal scrolling with front/back ellipsis, password masking and an optional profanity filter. It switches the input binding context while capturing so game actions do not fire. Loads attributes such as maxCharacters, maxInputTextWidth, isPassword and several callbacks (onEnterPressed, onEscPressed, onTextChanged, onIsUnicodeAllowed) from XML or a GUI profile.

- **TextInputElement** inherits from `ButtonElement` (l.26)

## Functions

| Function | Line | Description |
|---|---|---|
| `TextInputElement.new(target: any, custom_mt: any)` | 44 | ✍ Constructor. Builds the element on top of ButtonElement and initialises cursor, blink timing, text state, IME support flag (from imeIsSupported), forced focus and the text-box focus sound. |
| `TextInputElement:delete()` | 95 | ✍ Aborts any running IME session, deletes the cursor overlay and then calls the parent delete. |
| `TextInputElement:translate(str: any)` | 103 | ✍ Converts a text through g_i18n:convertText so l10n tokens in IME strings are resolved; returns nil/false input unchanged. |
| `TextInputElement:loadFromXML(xmlFile: any, key: any)` | 112 | ✍ Reads the element from XML: the five callbacks, IME keyboard type/title/description/placeholder, maxCharacters, maxInputTextWidth, cursor offset/size/overlay, enterWhenClickOutside, applyProfanityFilter and isPassword. Ensures the cursor is at least one pixel wide. |
| `TextInputElement:loadProfile(profile: any, applyProfile: any)` | 148 | ✍ Applies GUI profile values (maxCharacters, maxInputTextWidth, cursor offset/size/image size, isPassword, applyProfanityFilter) and loads the cursor overlay from the profile. |
| `TextInputElement:copyAttributes(src: any)` | 171 | ✍ Copies IME settings, limits, cursor overlay and geometry, password flag, callbacks and behaviour flags from another TextInputElement when cloning. |
| `TextInputElement:finalize()` | 201 | ✍ Recomputes the space the cursor needs and logs an error if centre/right alignment is used without maxInputTextWidth, or a warning if that width is too small for the dots plus cursor. |
| `TextInputElement:getIsActive()` | 218 | ✍ Uses the base GuiElement active check, deliberately bypassing ButtonElement's version, which would behave incompatibly for a text box. |
| `TextInputElement:setCaptureInput(isCapturing: any)` | 225 | ✍ Starts or stops input capture. Starting switches g_inputBinding to the text-input context (reverting a previous one if needed) and, on non-console, registers MENU_BACK/MENU_ACCEPT; stopping reverts the context and, unless it is a password or filtering is disabled, runs filterText on the content. |
| `TextInputElement:setAlpha(alpha: any)` | 277 | ✍ Sets the element alpha through the parent and mirrors it onto the cursor overlay. |
| `TextInputElement:getDoRenderText()` | 286 | ✍ Always returns false so the parent does not draw the text itself; draw() renders the visible text parts manually. |
| `TextInputElement:reset()` | 292 | ✍ Resets the parent state and stops any key auto-repeat in progress. |
| `TextInputElement:setText(text: any)` | 302 | ✍ Sets the text, truncating to maxCharacters (UTF-8 aware), moves the cursor to the end and refreshes the visible portions. Does not raise onTextChanged. |
| `TextInputElement:setForcePressed(force: any)` | 317 | ✍ Enters or leaves editing mode: toggles input capture, sets focus on the element, restores or clears the previous focus state on exit, stops key repeat and refreshes the visible text. |
| `TextInputElement:getIsUnicodeAllowed(unicode: any)` | 349 | ✍ Returns whether a typed character is accepted: rejects line breaks and characters the font cannot render, then defers to the onIsUnicodeAllowed callback (default true). |
| `TextInputElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 362 | ✍ Handles mouse interaction: highlights on hover, enters edit mode on left click (opening the IME on release when supported), and leaves edit mode on a click outside, optionally firing onEnterPressed. Returns whether the event was consumed. |
| `TextInputElement:moveCursorLeft(isLeftCtrlPressed: any)` | 417 | ✍ Moves the cursor one character left, or to the start of the previous word when the ctrl modifier flag is set. |
| `TextInputElement:moveCursorRight(isLeftCtrlPressed: any)` | 437 | ✍ Moves the cursor one character right, or jumps to the next word start when the ctrl modifier flag is set. |
| `TextInputElement:setCursorPosition(position: any)` | 453 | ✍ Sets the 1-based cursor position, clamped between 1 and text length plus one. |
| `TextInputElement:deleteText(deleteRightCharacterFromCursor: any)` | 459 | ✍ Deletes the character before the cursor, or the one after it when the argument is true, then raises onTextChanged. Does nothing at the text boundaries. |
| `TextInputElement:stopSpecialKeyRepeating()` | 492 | ✍ Clears the auto-repeat state (key, delay and remaining delay) for held navigation/delete keys. |
| `TextInputElement:openIme()` | 507 | ✍ Opens the platform on-screen input (imeOpen) with the current text, title, description, placeholder, keyboard type and max length (512 if unset). Returns true and subscribes to pause changes if it opened. |
| `TextInputElement:abortIme()` | 521 | ✍ Cancels an active IME session via imeAbort, clears the stored previous text and unsubscribes from pause messages. |
| `TextInputElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 533 | ✍ Processes keyboard input while in edit mode: enter/escape on key release, arrows, home/end, delete, backspace (ctrl removes a word), ctrl+V paste and normal characters inserted at the cursor, with auto-repeat. Raises onEnterPressed, onEscPressed and onTextChanged. |
| `TextInputElement:inputEvent(action: any, value: any, eventUsed: any)` | 658 | ✍ Handles gamepad/menu actions while editing (no IME active): MENU_ACCEPT confirms and MENU_BACK/MENU_CANCEL cancels, each leaving edit mode and raising the matching callback. |
| `TextInputElement:update(dt: any)` | 687 | ✍ Per-frame update: advances the cursor blink timer, drives accelerated key auto-repeat, polls the IME for completion or live text, and decrements the input block timer. dt is in milliseconds. |
| `TextInputElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 742 | ✍ Draws the parent background with empty text, then renders front dots, text before the cursor, the blinking cursor, text after it and back dots, honouring alignment and optional clip area. |
| `TextInputElement:shouldFocusChange(direction: any)` | 802 | ✍ Allows focus navigation to leave the element only when it is not in edit mode. |
| `TextInputElement:onFocusLeave()` | 808 | ✍ On focus loss, aborts the IME, leaves edit mode and calls the parent handler. |
| `TextInputElement:onFocusActivate()` | 816 | ✍ Activation by focus (e.g. gamepad confirm): raises onEnter, then either finishes editing and raises onEnterPressed, or opens the IME and enters edit mode. Ignored while the input block timer runs. |
| `TextInputElement:onClose()` | 835 | ✍ When the parent screen closes, aborts the IME and leaves edit mode so input mode is not left active. |
| `TextInputElement:drawTextPart(text: any, textXPos: any, displacementX: any, textYPos: any)` | 844 | ✍ Renders one text segment (with optional shadow text) at the given x offset and returns its width, used to chain dots, text parts and cursor. |
| `TextInputElement:drawCursor(textXPos: any, displacementX: any, textYPos: any)` | 871 | ✍ Draws the cursor overlay, pixel-snapped, during the visible half of the blink cycle and returns the horizontal space reserved for the cursor. |
| `TextInputElement:updateVisibleTextElements()` | 883 | ✍ Recomputes which parts of the text (before/after cursor, front/back dots) fit in maxInputTextWidth. Passwords are shown as asterisks; when not editing, the text is shown from its start and cut with back dots. |
| `TextInputElement.limitTextToAvailableWidth(text: any, textSize: any, availableWidth: any, trimFront: any)` | 1025 | ✍ Static helper that trims text from the back (or from the front if trimFront) until it fits the width. Returns the trimmed text and the first/last character indices. |
| `TextInputElement:getAvailableTextWidth()` | 1055 | ✍ Returns maxInputTextWidth minus the space taken by visible dots and cursor, or nil when no maximum width is set. |
| `TextInputElement:getNeededTextWidth()` | 1079 | ✍ Sums the widths of all currently visible parts (dots, text segments, cursor); used to align centred or right-aligned text. |
| `TextInputElement:getText()` | 1106 | ✍ Returns the current raw text of the input (not masked for passwords). |

## Messages

- subscribes `MessageType.PAUSE` (l.511)
