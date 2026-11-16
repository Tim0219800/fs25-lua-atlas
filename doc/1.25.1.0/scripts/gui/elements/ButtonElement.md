# gui/elements/ButtonElement.lua

*[Version française](../../../fr/scripts/gui/elements/ButtonElement.md)*

Source: `dataS/scripts/gui/elements/ButtonElement.lua` — FS25 1.25.1.0

✍ Clickable GUI button, derived from TextElement with the PlaySampleMixin for click sounds. It draws a background (layer "image") and an icon (layer "icon") or, when `inputAction` is set, a keyboard key glyph or gamepad glyph; it also supports touch-button rendering on mobile, fit-to-content sizing, focus/highlight/press states and callbacks (onClick, onFocus, onLeave, onHighlight, onHighlightRemove, onSizeChanged). Mouse, touch and key events are handled here; `sendAction`, `loadInputGlyph`, `setPressed` and similar are defined in other files (UNVERIFIED). Client-side GUI.

- **ButtonElement** inherits from `TextElement` (l.32)

## Functions

| Function | Line | Description |
|---|---|---|
| `ButtonElement.new(target: any, custom_mt: any)` | 39 | ✍ Constructor: builds the text element, mixes in sample playing and sets defaults (empty overlays and icons, centered text, send action on release, default click sound, no fit-to-content, keyboard/touch flags off). |
| `ButtonElement:delete()` | 86 | ✍ Deletes the touch icon, background and icon overlays, then runs the parent delete. |
| `ButtonElement:loadFromXML(xmlFile: any, key: any)` | 96 | ✍ Reads the callbacks, icon sizes, behavior flags (forceFocus, fitToContent, touch options, sendActionOnRelease, drawChildrenLast...), textSeparator, `inputAction` (a valid InputAction name) or the icon overlay, the touch icon on mobile and `clickSound`, then creates the overlay and updates size. |
| `ButtonElement:loadProfile(profile: any, applyProfile: any)` | 156 | ✍ Same settings as the XML loader but from a GUI profile (without callbacks); updates size only when the profile is applied. |
| `ButtonElement:copyAttributes(src: any)` | 215 | ✍ Copies overlays, icon settings, behavior flags, input action, click sound, pressed state and the callbacks from a source button, and clones the sound mixin. |
| `ButtonElement:loadInputGlyphColors(profile: profile, xmlFile: xmlFile, key: key)` | 263 | ✍ Loads the glyph colors (icon and "iconBg") either from XML or from a profile, depending on which argument is given. |
| `ButtonElement:setInputMode(isKeyboardMode: any, isTouchMode: any, isGamepadMode: any)` | 306 | ✍ Records whether the keyboard, touch or gamepad glyph mode is active, loads the input glyph the first time, and recomputes the size when any mode changed. |
| `ButtonElement:setAlpha(alpha: any)` | 337 | ✍ Sets the element alpha and mirrors it onto the background and icon overlays. |
| `ButtonElement:setDisabled(disabled: any)` | 349 | ✍ Applies the disabled flag; when disabling, removes focus, clears input state and raises the onLeave callback. |
| `ButtonElement:setInputAction(inputActionName: any)` | 362 | ✍ Changes the input action shown as glyph by name (ignored if the name is not a valid InputAction) and forces the glyph to reload. |
| `ButtonElement:onOpen()` | 371 | ✍ When an input action is set, reloads the glyph on open, deferred so a missing controller does not break loading. |
| `ButtonElement:onClose()` | 383 | ✍ Runs the parent handler then resets the button state. |
| `ButtonElement:reset()` | 390 | ✍ Clears the pressed, focused and highlighted states and the input-down flag. |
| `ButtonElement:setImageFilename(filename: any, iconFilename: any)` | 401 | ✍ Recreates the background overlay and/or icon overlay from the given file names (each only if not nil). |
| `ButtonElement:setImageUVs(backgroundUVs: any, iconUVs: any)` | 412 | ✍ Replaces the UV table of the background and/or icon overlay when provided. |
| `ButtonElement:setImageSlice(backgroundSliceId: any, iconSliceId: any)` | 424 | ✍ Resolves a background slice id and an icon slice id through `g_overlayManager` and applies their UVs and image files. |
| `ButtonElement:getIsActive()` | 439 | ✍ The button is active only when the parent condition holds and an onClick callback exists. |
| `ButtonElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 446 | ✍ Handles mouse input when active: tracks hover (highlight) even if the event was consumed, focuses on left mouse down, sends the action on press or release depending on `sendActionOnRelease`, updates the pressed state, and returns whether the event was used. |
| `ButtonElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 511 | ✍ Touch equivalent of the mouse handler: highlight, focus on touch down, send action on touch or release, pressed state, and returns whether the event was consumed. |
| `ButtonElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 575 | ✍ Forwards key events to the parent only when the button is active; otherwise returns false. |
| `ButtonElement:getIconOffset(textWidth: any, textHeight: any)` | 584 | ✍ Computes the icon position relative to the text, from icon size, text alignment, text size and `iconTextOffset`. Returns an x and y offset in screen units. |
| `ButtonElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 607 | ✍ Draws children first (unless drawChildrenLast), syncs the input mode from `g_inputBinding`, renders the background, then the keyboard key glyph, the touch button and touch/gamepad icon, or the normal icon, plus a debug outline when enabled. Children are drawn last when drawChildrenLast is true. |
| `ButtonElement:getIconModifiedTextOffset(textOffsetX: number, textOffsetY: number) → number, number` | 689 | ✍ Shifts the given text offset to make room for the icon, depending on left or center alignment. Returns the modified x and y offsets. |
| `ButtonElement:getTextOffset()` | 704 | ✍ Returns the parent text offset plus a fixed touch-area margin in touch mode, adjusted for the icon. |
| `ButtonElement:getText2Offset()` | 716 | ✍ Returns the shadow/second text offset adjusted for the icon. |
| `ButtonElement:getIconSize()` | 723 | ✍ Returns the icon size: the key glyph size in keyboard mode, otherwise the configured icon size. |
| `ButtonElement:setIconSize(x: any, y: any)` | 733 | ✍ Sets the icon width and/or height (nil keeps the current value) and updates the element size. |
| `ButtonElement:canReceiveFocus()` | 743 | ✍ True when the button is enabled, visible and handles focus. |
| `ButtonElement:onFocusLeave()` | 749 | ✍ Runs the parent handler and raises the onLeave callback. |
| `ButtonElement:onFocusEnter()` | 757 | ✍ Runs the parent handler and raises the onFocus callback. |
| `ButtonElement:onHighlight()` | 765 | ✍ Runs the parent handler and raises the onHighlight callback. |
| `ButtonElement:onHighlightRemove()` | 773 | ✍ Runs the parent handler and raises the onHighlightRemove callback. |
| `ButtonElement:onFocusActivate()` | 781 | ✍ When active, sends the button action (activation from the focus system, for example gamepad accept). |
| `ButtonElement:getIsPressed()` | 804 | ✍ Returns whether the button is currently pressed. |
| `ButtonElement:getOverlayState()` | 810 | ✍ Returns the overlay state by priority: disabled, pressed (unless ignored), selected, focused, highlighted, else normal. |
| `ButtonElement:updateSize(forceTextSize: any)` | 828 | ✍ When fit-to-content or auto text width/height is on, resizes the button to its icon plus text (with extra width, touch padding on mobile). If the size changed it raises onSizeChanged for touch sizing and invalidates an auto-validating parent layout. |
| `ButtonElement:setText(text: any, forceTextSize: any, isInitializing: any, forceScrollingParameterUpdate: any)` | 876 | ✍ Prefixes the text with `textSeparator` when set, applies it through the parent, then updates the size. |
| `ButtonElement:setTextSize(size: any)` | 888 | ✍ Sets the text size through the parent and updates the button size. |
| `ButtonElement:setClickSound(soundName: any)` | 896 | ✍ Sets the sample name played on click. |
