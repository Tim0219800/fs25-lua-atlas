# gui/elements/MultiTextOptionElement.lua

*[Version française](../../../fr/scripts/gui/elements/MultiTextOptionElement.md)*

Source: `dataS/scripts/gui/elements/MultiTextOptionElement.lua` — FS25 1.25.1.0

✍ GUI element for a multiple-choice option: a left button, a right button and a text (or icon) showing the current entry of a list of texts. It extends GuiElement and includes IndexChangeSubjectMixin and PlaySampleMixin. Child elements are found by their name (left, right, label, text, icon, gradient, background), and missing ones can be created from default profiles. Supports wrapping, held-button repeat with faster steps, gamepad and mouse/touch input.

- **MultiTextOptionElement** inherits from `GuiElement` (l.37)

## Functions

| Function | Line | Description |
|---|---|---|
| `MultiTextOptionElement.new(target: any, custom_mt: any)` | 44 | ✍ Constructor. Creates the element, mixes in the index-change and sound mixins and sets defaults: state 1, wrapping on, no texts, and no child element references yet. |
| `MultiTextOptionElement:loadFromXML(xmlFile: any, key: any)` | 97 | ✍ Loads the element from XML after the parent loader, setting the mod environment first for l10n. Reads callbacks (onClick, onFocus, onLeave), wrap and button-visibility flags, scroll timing, and a '\|'-separated texts string whose $l10n_ parts are translated. |
| `MultiTextOptionElement:loadProfile(profile: any, applyProfile: any)` | 138 | ✍ Applies a GUI profile after the parent: same options as the XML loader plus the default profiles for buttons, text and backgrounds, autoAddDefaultElements, and a texts list. Note: $l10n_ texts here are translated without the mod custom environment. |
| `MultiTextOptionElement:clone(parent: any, includeId: any, suppressOnCreate: any, blockFocusHandlingReload: any)` | 173 | ✍ Clones the element through the parent clone, then adds missing default child elements and re-links the clone's children by name. |
| `MultiTextOptionElement:copyAttributes(src: any)` | 184 | ✍ Copies state, flags, timing, default profiles, callbacks and all texts from a source element, and clones the two mixins from it. |
| `MultiTextOptionElement:onGuiSetupFinished()` | 222 | ✍ Called once the GUI is built: adds default children if enabled, binds children by name, refreshes absolute position and silences the click sound of the left and right buttons. |
| `MultiTextOptionElement:setElementsByName()` | 237 | ✍ Scans the children and binds them by name: left/right buttons (rewired to this element's click handlers, replacing duplicates), label, text, icon, gradients and background (resized to the element width). Logs a warning and stops at the first unnamed child. |
| `MultiTextOptionElement:addDefaultElements()` | 296 | ✍ If autoAddDefaultElements is set, creates any missing background (round, three-part or bitmap by profile), left button, right button and text child, and applies the matching default profile. |
| `MultiTextOptionElement:setState(state: any, forceEvent: any)` | 342 | ✍ Sets the current index, clamped between 1 and the number of texts, refreshes the display and notifies index observers. With forceEvent it also raises the click callback. |
| `MultiTextOptionElement:getState()` | 356 | ✍ Returns the current 1-based index. |
| `MultiTextOptionElement:disableButtonSounds()` | 362 | ✍ Disables automatic sample playback on the left and right child buttons. |
| `MultiTextOptionElement:addText(text: any, i: any)` | 374 | ✍ Appends a text, or inserts it at index i, refreshes the display, recomputes the dynamic fast-scroll step (texts/5, max 10) unless disabled, and notifies index observers. |
| `MultiTextOptionElement:setTexts(texts: any)` | 391 | ✍ Replaces the whole text list (nil empties it), leaves image mode, clamps the state to the new size, refreshes the display, updates the dynamic scroll step and notifies observers. |
| `MultiTextOptionElement:setIcons(icons: any)` | 412 | ✍ Uses the list as icon entries (image filenames) instead of texts and enables image mode, so the icon child shows the entry when the file exists. Clamps the state and notifies observers. |
| `MultiTextOptionElement:setLabel(labelString: any)` | 430 | ✍ Sets the header label text if a label child exists; otherwise does nothing. |
| `MultiTextOptionElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 438 | ✍ Handles mouse input: tracks which arrow button is held (starting the repeat timer), releases input when no button is pressed, and manages hover highlight through FocusManager. Returns whether the event was used. |
| `MultiTextOptionElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 482 | ✍ Touch counterpart of mouseEvent with the same held-button and highlight logic, using the element hotspot for hit testing. |
| `MultiTextOptionElement:inputEvent(action: any, value: any, eventUsed: any)` | 524 | ✍ Handles gamepad/keyboard actions: left/right axis beyond the analog tolerance and page prev/next trigger inputLeft/inputRight and press the matching button visually. Returns true when consumed. |
| `MultiTextOptionElement:update(dt: any)` | 556 | ✍ Per-frame update: while an arrow is held and the delay has elapsed it repeats the step, accumulates continuous-trigger time, and releases the buttons when no input event arrived for a frame. inputLeft, inputRight and releaseInput are not in the dump (UNVERIFIED). |
| `MultiTextOptionElement:onRightButtonClicked(steps: any, noFocus: any)` | 663 | ✍ Moves the state forward by steps (default 1, or the fast step after a long hold), wrapping or clamping, plays a click sound if it changed, optionally focuses the element, then refreshes, raises the click callback with false and notifies observers. |
| `MultiTextOptionElement:onLeftButtonClicked(steps: any, noFocus: any)` | 714 | ✍ Moves the state backward, same logic as the right-button handler, but raises the click callback with true. Note: the boolean passed to the callback differs between the two directions. |
| `MultiTextOptionElement:getCanChangeState()` | 765 | ✍ Returns whether the user is currently allowed to change the state with the buttons. |
| `MultiTextOptionElement:setCanChangeState(canChangeState: any)` | 771 | ✍ Enables or blocks state changes made through the left and right buttons. |
| `MultiTextOptionElement:canReceiveFocus(element: any, direction: any)` | 777 | ✍ Returns true when the element is enabled, visible, handles focus and, if disableButtonsOnSingleText is set, has more than one text. |
| `MultiTextOptionElement:onFocusLeave()` | 783 | ✍ Runs the parent focus-leave handling and raises the onLeaveCallback with this element. |
| `MultiTextOptionElement:onFocusEnter()` | 791 | ✍ Runs the parent focus-enter handling and raises the onFocusCallback with this element. |
| `MultiTextOptionElement:updateContentElement()` | 799 | ✍ Refreshes the visuals for the current state: shows the icon (when in image mode and the texture file exists) or the text, toggles gradients, disables the element when it has at most one text if configured, and hides arrows at the limits when not wrapping. |
