---@meta
-- FS25 1.25.1.0 : gui/hud/InputGlyphElement.lua (generated stub, FS25 Lua Atlas)

--- HUD element (extends HUDElement) that shows the key caps or gamepad glyphs bound to one or two input actions, optionally followed by an action text. It asks g_inputDisplayManager for the symbol overlays, lays out combos with plus or or separators, and refreshes itself on the INPUT_DEVICES_CHANGED message. Client-side only. onInputDevicesChanged and getPositionOffset/getDrawSeparator are used but not defined in this file (UNVERIFIED where they live).
---@class InputGlyphElement : HUDElement
InputGlyphElement = {}

--- Creates the glyph with a base size, empty action list, plus/or overlays from the input display manager and a keyboard ButtonOverlay, then subscribes to INPUT_DEVICES_CHANGED. Call delete to unsubscribe.
---@param inputDisplayManager table
---@param baseWidth number
---@param baseHeight number
---@param customMt any
function InputGlyphElement.new(inputDisplayManager, baseWidth, baseHeight, customMt) end

--- Deletes the keyboard overlay, unsubscribes from all message center events and runs the parent delete.
function InputGlyphElement:delete() end

--- Applies width/height scale through the parent, then recomputes glyph and text offsets and the icon, plus and or sizes from the base size.
---@param widthScale number
---@param heightScale number
function InputGlyphElement:setScale(widthScale, heightScale) end

--- Enables or disables upper-casing of the action text (this cancels lower-casing) and refreshes the display text.
---@param enableUpperCase any
function InputGlyphElement:setUpperCase(enableUpperCase) end

--- Enables or disables lower-casing of the action text (this cancels upper-casing) and refreshes the display text.
---@param enableLowerCase any
function InputGlyphElement:setLowerCase(enableLowerCase) end

--- Sets whether the action text is rendered in bold.
---@param isBold any
function InputGlyphElement:setBold(isBold) end

--- Stores the main color (also used for the action text) and applies it with an optional background color to the keyboard key overlay.
---@param color table
---@param bgColor any
function InputGlyphElement:setKeyboardGlyphColor(color, bgColor) end

--- Stores the color used for gamepad glyphs and applies it to the already resolved button overlays of the current actions.
---@param color table
function InputGlyphElement:setButtonGlyphColor(color) end

--- Shortcut for a single action: replaces the action list with it and calls setActions with the same text options.
---@param actionName string
---@param actionText string?
---@param actionTextSize number?
---@param noModifiers boolean?
function InputGlyphElement:setAction(actionName, actionText, actionTextSize, noModifiers) end

--- Resolves symbol overlays and key names for the given action names (at most a pair is combined) through the input display manager, then sets the element width from the glyphs and its height unchanged. Stores optional action text and size.
---@param actionNames table
---@param actionText string?
---@param actionTextSize number?
---@param noModifiers boolean?
---@param customBinding any
function InputGlyphElement:setActions(actionNames, actionText, actionTextSize, noModifiers, customBinding) end

--- Derives the displayed text from the action text, upper-cased or lower-cased according to the flags, when an action text exists.
function InputGlyphElement:updateDisplayText() end

--- Computes the total width of the currently resolved glyphs (gamepad icons with separators, or key caps), excluding the action text.
function InputGlyphElement:getGlyphWidth() end

--- Draws the glyphs (gamepad buttons or keyboard keys) right-aligned to the element unless left alignment is set, then the action text if any. Does nothing without actions or when the overlay is hidden.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function InputGlyphElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Renders each gamepad button overlay in order, inserting plus or or separator icons between them, and returns the X position after the last one.
---@param buttonOverlays table
---@param posX number
---@param posY number
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
---@return number
function InputGlyphElement:drawControllerButtons(buttonOverlays, posX, posY, clipX1, clipY1, clipX2, clipY2) end

--- Renders the action text after the glyphs using the stored size, bold flag and color, with an optional text clip area that is reset afterwards.
---@param posX number
---@param posY number
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function InputGlyphElement:drawActionText(posX, posY, clipX1, clipY1, clipX2, clipY2) end
