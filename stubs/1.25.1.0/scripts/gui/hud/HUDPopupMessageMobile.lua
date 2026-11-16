---@meta
-- FS25 1.25.1.0 : gui/hud/HUDPopupMessageMobile.lua (generated stub, FS25 Lua Atlas)

--- Mobile-UI popup message box (extends HUDDisplayElement) shown at the bottom center of the screen. Messages are queued, displayed one at a time with a title, a text and up to a fixed number of input rows, and closed after a timeout, on tap or via the confirm actions. While shown it hides the minimap toggle, pushes a depth-of-field blur area and uses a touch custom context named guidedTour. Client-side only.
---@class HUDPopupMessageMobile : HUDDisplayElement
HUDPopupMessageMobile = {}

--- Creates the popup with its background overlay, empty message queue, input rows and glyphs, and a continue-text from the l10n key introduction_continueTextTouch. Needs the ingame map so it can force it small while a message is shown.
---@param hudAtlasPath string
---@param ingameMap ingameMap
---@return table
function HUDPopupMessageMobile.new(hudAtlasPath, ingameMap) end

--- Queues a message with title, text, optional controls and an optional callback/target. Duration 0 is derived from text length, a negative duration means the maximum duration; the oldest pending messages are dropped when the queue is too long and extra controls are truncated.
---@param title table?
---@param text function?
---@param duration table?
---@param controls table?
---@param callback function?
---@param target table?
function HUDPopupMessageMobile:showMessage(title, text, duration, controls, callback, target) end

--- Returns true only when the base element is visible and a current message exists.
function HUDPopupMessageMobile:getVisible() end

--- Returns the (x, y) offset used by the hide animation: straight down by the box height plus safe-frame offset and a small margin.
---@return number
---@return number
function HUDPopupMessageMobile:getHidingTranslation() end

--- Makes the given message current and resets its timer. When a touch handler exists it enters the guidedTour custom context and registers a full-screen touch-up area that confirms the message. Hides the continue glyph in touch mode, then sizes the box and refreshes glyphs.
---@param message any
function HUDPopupMessageMobile:assignCurrentMessage(message) end

--- Computes the box height from title, text and input-row heights plus paddings and the continue button, and applies it with a minimum height.
function HUDPopupMessageMobile:setCurrentMessageHeight() end

--- Measures the wrapped, upper-cased title of the current message in screen units (0 when there is none), restoring text state afterwards.
function HUDPopupMessageMobile:getTitleHeight() end

--- Measures the wrapped body text of the current message with the popup line height scale, returning 0 when there is no message.
function HUDPopupMessageMobile:getTextHeight() end

--- Returns the height reserved for the control rows: one row per control plus one extra row, 0 without a current message.
function HUDPopupMessageMobile:getInputRowsHeight() end

--- Runs the parent hide animation, pops the depth-of-field area and registers finishMessage as the animation-end callback.
function HUDPopupMessageMobile:animateHide() end

--- Disables map toggling and forces the minimap small, then takes the first queued message and makes it current.
function HUDPopupMessageMobile:startMessage() end

--- Re-enables map toggling, calls the current message's callback (with its target, or with the popup itself when no target) and clears the current message.
function HUDPopupMessageMobile:finishMessage() end

--- Skipped while a menu is visible. Otherwise updates the animation, accumulates display time unless the game is paused or sleeping, handles expiry or next message, and refreshes glyphs when the input help mode changes.
---@param dt any
function HUDPopupMessageMobile:update(dt) end

--- Hides the current message with animation once its display time exceeds its duration; with no current message, starts the next queued one, animates in and pushes a blur area at the end of the animation.
function HUDPopupMessageMobile:updateCurrentMessage() end

--- Sets the continue glyph to the SKIP_MESSAGE_BOX action and, for each visible input row of the current message, assigns the control's action names to the row glyph.
function HUDPopupMessageMobile:updateButtonGlyphs() end

--- Switches the dedicated input context on or off. On: registers MENU_ACCEPT and SKIP_MESSAGE_BOX events (text hidden) calling onConfirmMessage. Off: removes this target's events and reverts the context.
---@param isActive any
function HUDPopupMessageMobile:setInputActive(isActive) end

--- Input or touch callback that dismisses the message by hiding with animation, but only when no animation is running; it also reverts the touch custom context.
---@param actionName any
---@param inputValue any
function HUDPopupMessageMobile:onConfirmMessage(actionName, inputValue) end

--- Draws the background then the title (upper-cased, centered), wrapped body text, one text per control and, in touch mode, the continue label. Not drawn while a menu is visible or without a current message.
function HUDPopupMessageMobile:draw() end

--- Returns the box's base position: horizontally centered, bottom at the safe-frame offset, plus the configured offset times uiScale.
---@param uiScale number
function HUDPopupMessageMobile.getBackgroundPosition(uiScale) end

--- Applies the UI scale, recomputes cached scaled values and re-centers the box horizontally at its background position.
---@param uiScale any
function HUDPopupMessageMobile:setScale(uiScale) end

--- Pass-through override that calls the parent setDimension without extra behavior.
---@param width any
---@param height any
function HUDPopupMessageMobile:setDimension(width, height) end

--- Caches all scaled sizes, offsets and text sizes (minimum size, paddings, row and button sizes, title/text/continue text sizes) converted from the pixel constants.
function HUDPopupMessageMobile:storeScaledValues() end

--- Creates the background overlay from the HUD atlas at the base position with the minimum size, background UVs and color.
---@param hudAtlasPath any
function HUDPopupMessageMobile.createBackground(hudAtlasPath) end

--- Creates the stack of input rows (stored in reverse order) and the continue InputGlyphElement, and adds them as children.
---@param hudAtlasPath any
function HUDPopupMessageMobile:createComponents(hudAtlasPath) end

--- Builds one input row: a colored background panel, an InputGlyphElement and a separator line. Returns the panel, the glyph and the Y position for the next row.
---@param hudAtlasPath any
---@param posX any
---@param posY any
function HUDPopupMessageMobile:createInputRow(hudAtlasPath, posX, posY) end
