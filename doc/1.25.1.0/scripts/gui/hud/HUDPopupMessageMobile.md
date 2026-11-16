# gui/hud/HUDPopupMessageMobile.lua

*[Version française](../../../fr/scripts/gui/hud/HUDPopupMessageMobile.md)*

Source: `dataS/scripts/gui/hud/HUDPopupMessageMobile.lua` — FS25 1.25.1.0

✍ Mobile-UI popup message box (extends HUDDisplayElement) shown at the bottom center of the screen. Messages are queued, displayed one at a time with a title, a text and up to a fixed number of input rows, and closed after a timeout, on tap or via the confirm actions. While shown it hides the minimap toggle, pushes a depth-of-field blur area and uses a touch custom context named guidedTour. Client-side only.

- **HUDPopupMessageMobile** inherits from `HUDDisplayElement` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `HUDPopupMessageMobile.new(hudAtlasPath: string, ingameMap: ingameMap) → table` | 39 | ✍ Creates the popup with its background overlay, empty message queue, input rows and glyphs, and a continue-text from the l10n key introduction_continueTextTouch. Needs the ingame map so it can force it small while a message is shown. |
| `HUDPopupMessageMobile:showMessage(title: table?, text: function?, duration: table?, controls: table?, callback: function?, target: table?)` | 83 | ✍ Queues a message with title, text, optional controls and an optional callback/target. Duration 0 is derived from text length, a negative duration means the maximum duration; the oldest pending messages are dropped when the queue is too long and extra controls are truncated. |
| `HUDPopupMessageMobile:getVisible()` | 121 | ✍ Returns true only when the base element is visible and a current message exists. |
| `HUDPopupMessageMobile:getHidingTranslation() → number, number` | 130 | ✍ Returns the (x, y) offset used by the hide animation: straight down by the box height plus safe-frame offset and a small margin. |
| `HUDPopupMessageMobile:assignCurrentMessage(message: any)` | 137 | ✍ Makes the given message current and resets its timer. When a touch handler exists it enters the guidedTour custom context and registers a full-screen touch-up area that confirms the message. Hides the continue glyph in touch mode, then sizes the box and refreshes glyphs. |
| `HUDPopupMessageMobile:setCurrentMessageHeight()` | 155 | ✍ Computes the box height from title, text and input-row heights plus paddings and the continue button, and applies it with a minimum height. |
| `HUDPopupMessageMobile:getTitleHeight()` | 168 | ✍ Measures the wrapped, upper-cased title of the current message in screen units (0 when there is none), restoring text state afterwards. |
| `HUDPopupMessageMobile:getTextHeight()` | 188 | ✍ Measures the wrapped body text of the current message with the popup line height scale, returning 0 when there is no message. |
| `HUDPopupMessageMobile:getInputRowsHeight()` | 206 | ✍ Returns the height reserved for the control rows: one row per control plus one extra row, 0 without a current message. |
| `HUDPopupMessageMobile:animateHide()` | 218 | ✍ Runs the parent hide animation, pops the depth-of-field area and registers finishMessage as the animation-end callback. |
| `HUDPopupMessageMobile:startMessage()` | 229 | ✍ Disables map toggling and forces the minimap small, then takes the first queued message and makes it current. |
| `HUDPopupMessageMobile:finishMessage()` | 240 | ✍ Re-enables map toggling, calls the current message's callback (with its target, or with the popup itself when no target) and clears the current message. |
| `HUDPopupMessageMobile:update(dt: any)` | 260 | ✍ Skipped while a menu is visible. Otherwise updates the animation, accumulates display time unless the game is paused or sleeping, handles expiry or next message, and refreshes glyphs when the input help mode changes. |
| `HUDPopupMessageMobile:updateCurrentMessage()` | 285 | ✍ Hides the current message with animation once its display time exceeds its duration; with no current message, starts the next queued one, animates in and pushes a blur area at the end of the animation. |
| `HUDPopupMessageMobile:updateButtonGlyphs()` | 305 | ✍ Sets the continue glyph to the SKIP_MESSAGE_BOX action and, for each visible input row of the current message, assigns the control's action names to the row glyph. |
| `HUDPopupMessageMobile:setInputActive(isActive: any)` | 333 | ✍ Switches the dedicated input context on or off. On: registers MENU_ACCEPT and SKIP_MESSAGE_BOX events (text hidden) calling onConfirmMessage. Off: removes this target's events and reverts the context. |
| `HUDPopupMessageMobile:onConfirmMessage(actionName: any, inputValue: any)` | 355 | ✍ Input or touch callback that dismisses the message by hiding with animation, but only when no animation is running; it also reverts the touch custom context. |
| `HUDPopupMessageMobile:draw()` | 376 | ✍ Draws the background then the title (upper-cased, centered), wrapped body text, one text per control and, in touch mode, the continue label. Not drawn while a menu is visible or without a current message. |
| `HUDPopupMessageMobile.getBackgroundPosition(uiScale: number)` | 441 | ✍ Returns the box's base position: horizontally centered, bottom at the safe-frame offset, plus the configured offset times uiScale. |
| `HUDPopupMessageMobile:setScale(uiScale: any)` | 448 | ✍ Applies the UI scale, recomputes cached scaled values and re-centers the box horizontally at its background position. |
| `HUDPopupMessageMobile:setDimension(width: any, height: any)` | 460 | ✍ Pass-through override that calls the parent setDimension without extra behavior. |
| `HUDPopupMessageMobile:storeScaledValues()` | 466 | ✍ Caches all scaled sizes, offsets and text sizes (minimum size, paddings, row and button sizes, title/text/continue text sizes) converted from the pixel constants. |
| `HUDPopupMessageMobile.createBackground(hudAtlasPath: any)` | 490 | ✍ Creates the background overlay from the HUD atlas at the base position with the minimum size, background UVs and color. |
| `HUDPopupMessageMobile:createComponents(hudAtlasPath: any)` | 502 | ✍ Creates the stack of input rows (stored in reverse order) and the continue InputGlyphElement, and adds them as children. |
| `HUDPopupMessageMobile:createInputRow(hudAtlasPath: any, posX: any, posY: any)` | 531 | ✍ Builds one input row: a colored background panel, an InputGlyphElement and a separator line. Returns the panel, the glyph and the Y position for the next row. |
