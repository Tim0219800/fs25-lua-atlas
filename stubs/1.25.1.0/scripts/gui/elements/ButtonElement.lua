---@meta
-- FS25 1.25.1.0 : gui/elements/ButtonElement.lua (generated stub, FS25 Lua Atlas)

--- Clickable GUI button, derived from TextElement with the PlaySampleMixin for click sounds. It draws a background (layer "image") and an icon (layer "icon") or, when `inputAction` is set, a keyboard key glyph or gamepad glyph; it also supports touch-button rendering on mobile, fit-to-content sizing, focus/highlight/press states and callbacks (onClick, onFocus, onLeave, onHighlight, onHighlightRemove, onSizeChanged). Mouse, touch and key events are handled here; `sendAction`, `loadInputGlyph`, `setPressed` and similar are defined in other files (UNVERIFIED). Client-side GUI.
---@class ButtonElement : TextElement
ButtonElement = {}

--- Constructor: builds the text element, mixes in sample playing and sets defaults (empty overlays and icons, centered text, send action on release, default click sound, no fit-to-content, keyboard/touch flags off).
---@param target any
---@param custom_mt any
function ButtonElement.new(target, custom_mt) end

--- Deletes the touch icon, background and icon overlays, then runs the parent delete.
function ButtonElement:delete() end

--- Reads the callbacks, icon sizes, behavior flags (forceFocus, fitToContent, touch options, sendActionOnRelease, drawChildrenLast...), textSeparator, `inputAction` (a valid InputAction name) or the icon overlay, the touch icon on mobile and `clickSound`, then creates the overlay and updates size.
---@param xmlFile any
---@param key any
function ButtonElement:loadFromXML(xmlFile, key) end

--- Same settings as the XML loader but from a GUI profile (without callbacks); updates size only when the profile is applied.
---@param profile any
---@param applyProfile any
function ButtonElement:loadProfile(profile, applyProfile) end

--- Copies overlays, icon settings, behavior flags, input action, click sound, pressed state and the callbacks from a source button, and clones the sound mixin.
---@param src any
function ButtonElement:copyAttributes(src) end

--- Loads the glyph colors (icon and "iconBg") either from XML or from a profile, depending on which argument is given.
---@param profile profile
---@param xmlFile xmlFile
---@param key key
function ButtonElement:loadInputGlyphColors(profile, xmlFile, key) end

--- Records whether the keyboard, touch or gamepad glyph mode is active, loads the input glyph the first time, and recomputes the size when any mode changed.
---@param isKeyboardMode any
---@param isTouchMode any
---@param isGamepadMode any
function ButtonElement:setInputMode(isKeyboardMode, isTouchMode, isGamepadMode) end

--- Sets the element alpha and mirrors it onto the background and icon overlays.
---@param alpha any
function ButtonElement:setAlpha(alpha) end

--- Applies the disabled flag; when disabling, removes focus, clears input state and raises the onLeave callback.
---@param disabled any
function ButtonElement:setDisabled(disabled) end

--- Changes the input action shown as glyph by name (ignored if the name is not a valid InputAction) and forces the glyph to reload.
---@param inputActionName any
function ButtonElement:setInputAction(inputActionName) end

--- When an input action is set, reloads the glyph on open, deferred so a missing controller does not break loading.
function ButtonElement:onOpen() end

--- Runs the parent handler then resets the button state.
function ButtonElement:onClose() end

--- Clears the pressed, focused and highlighted states and the input-down flag.
function ButtonElement:reset() end

--- Recreates the background overlay and/or icon overlay from the given file names (each only if not nil).
---@param filename any
---@param iconFilename any
function ButtonElement:setImageFilename(filename, iconFilename) end

--- Replaces the UV table of the background and/or icon overlay when provided.
---@param backgroundUVs any
---@param iconUVs any
function ButtonElement:setImageUVs(backgroundUVs, iconUVs) end

--- Resolves a background slice id and an icon slice id through `g_overlayManager` and applies their UVs and image files.
---@param backgroundSliceId any
---@param iconSliceId any
function ButtonElement:setImageSlice(backgroundSliceId, iconSliceId) end

--- The button is active only when the parent condition holds and an onClick callback exists.
function ButtonElement:getIsActive() end

--- Handles mouse input when active: tracks hover (highlight) even if the event was consumed, focuses on left mouse down, sends the action on press or release depending on `sendActionOnRelease`, updates the pressed state, and returns whether the event was used.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function ButtonElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Touch equivalent of the mouse handler: highlight, focus on touch down, send action on touch or release, pressed state, and returns whether the event was consumed.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function ButtonElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

--- Forwards key events to the parent only when the button is active; otherwise returns false.
---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
function ButtonElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

--- Computes the icon position relative to the text, from icon size, text alignment, text size and `iconTextOffset`. Returns an x and y offset in screen units.
---@param textWidth any
---@param textHeight any
function ButtonElement:getIconOffset(textWidth, textHeight) end

--- Draws children first (unless drawChildrenLast), syncs the input mode from `g_inputBinding`, renders the background, then the keyboard key glyph, the touch button and touch/gamepad icon, or the normal icon, plus a debug outline when enabled. Children are drawn last when drawChildrenLast is true.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function ButtonElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Shifts the given text offset to make room for the icon, depending on left or center alignment. Returns the modified x and y offsets.
---@param textOffsetX number
---@param textOffsetY number
---@return number
---@return number
function ButtonElement:getIconModifiedTextOffset(textOffsetX, textOffsetY) end

--- Returns the parent text offset plus a fixed touch-area margin in touch mode, adjusted for the icon.
function ButtonElement:getTextOffset() end

--- Returns the shadow/second text offset adjusted for the icon.
function ButtonElement:getText2Offset() end

--- Returns the icon size: the key glyph size in keyboard mode, otherwise the configured icon size.
function ButtonElement:getIconSize() end

--- Sets the icon width and/or height (nil keeps the current value) and updates the element size.
---@param x any
---@param y any
function ButtonElement:setIconSize(x, y) end

--- True when the button is enabled, visible and handles focus.
function ButtonElement:canReceiveFocus() end

--- Runs the parent handler and raises the onLeave callback.
function ButtonElement:onFocusLeave() end

--- Runs the parent handler and raises the onFocus callback.
function ButtonElement:onFocusEnter() end

--- Runs the parent handler and raises the onHighlight callback.
function ButtonElement:onHighlight() end

--- Runs the parent handler and raises the onHighlightRemove callback.
function ButtonElement:onHighlightRemove() end

--- When active, sends the button action (activation from the focus system, for example gamepad accept).
function ButtonElement:onFocusActivate() end

--- Returns whether the button is currently pressed.
function ButtonElement:getIsPressed() end

--- Returns the overlay state by priority: disabled, pressed (unless ignored), selected, focused, highlighted, else normal.
function ButtonElement:getOverlayState() end

--- When fit-to-content or auto text width/height is on, resizes the button to its icon plus text (with extra width, touch padding on mobile). If the size changed it raises onSizeChanged for touch sizing and invalidates an auto-validating parent layout.
---@param forceTextSize any
function ButtonElement:updateSize(forceTextSize) end

--- Prefixes the text with `textSeparator` when set, applies it through the parent, then updates the size.
---@param text any
---@param forceTextSize any
---@param isInitializing any
---@param forceScrollingParameterUpdate any
function ButtonElement:setText(text, forceTextSize, isInitializing, forceScrollingParameterUpdate) end

--- Sets the text size through the parent and updates the button size.
---@param size any
function ButtonElement:setTextSize(size) end

--- Sets the sample name played on click.
---@param soundName any
function ButtonElement:setClickSound(soundName) end
