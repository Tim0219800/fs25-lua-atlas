# gui/hud/InputGlyphElement.lua

*[Version française](../../../fr/scripts/gui/hud/InputGlyphElement.md)*

Source: `dataS/scripts/gui/hud/InputGlyphElement.lua` — FS25 1.25.1.0

✍ HUD element (extends HUDElement) that shows the key caps or gamepad glyphs bound to one or two input actions, optionally followed by an action text. It asks g_inputDisplayManager for the symbol overlays, lays out combos with plus or or separators, and refreshes itself on the INPUT_DEVICES_CHANGED message. Client-side only. onInputDevicesChanged and getPositionOffset/getDrawSeparator are used but not defined in this file (UNVERIFIED where they live).

- **InputGlyphElement** inherits from `HUDElement` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `InputGlyphElement.new(inputDisplayManager: table, baseWidth: number, baseHeight: number, customMt: any)` | 28 | ✍ Creates the glyph with a base size, empty action list, plus/or overlays from the input display manager and a keyboard ButtonOverlay, then subscribes to INPUT_DEVICES_CHANGED. Call delete to unsubscribe. |
| `InputGlyphElement:delete()` | 78 | ✍ Deletes the keyboard overlay, unsubscribes from all message center events and runs the parent delete. |
| `InputGlyphElement:setScale(widthScale: number, heightScale: number)` | 93 | ✍ Applies width/height scale through the parent, then recomputes glyph and text offsets and the icon, plus and or sizes from the base size. |
| `InputGlyphElement:setUpperCase(enableUpperCase: any)` | 107 | ✍ Enables or disables upper-casing of the action text (this cancels lower-casing) and refreshes the display text. |
| `InputGlyphElement:setLowerCase(enableLowerCase: any)` | 116 | ✍ Enables or disables lower-casing of the action text (this cancels upper-casing) and refreshes the display text. |
| `InputGlyphElement:setBold(isBold: any)` | 124 | ✍ Sets whether the action text is rendered in bold. |
| `InputGlyphElement:setKeyboardGlyphColor(color: table, bgColor: any)` | 131 | ✍ Stores the main color (also used for the action text) and applies it with an optional background color to the keyboard key overlay. |
| `InputGlyphElement:setButtonGlyphColor(color: table)` | 148 | ✍ Stores the color used for gamepad glyphs and applies it to the already resolved button overlays of the current actions. |
| `InputGlyphElement:setAction(actionName: string, actionText: string?, actionTextSize: number?, noModifiers: boolean?)` | 171 | ✍ Shortcut for a single action: replaces the action list with it and calls setActions with the same text options. |
| `InputGlyphElement:setActions(actionNames: table, actionText: string?, actionTextSize: number?, noModifiers: boolean?, customBinding: any)` | 186 | ✍ Resolves symbol overlays and key names for the given action names (at most a pair is combined) through the input display manager, then sets the element width from the glyphs and its height unchanged. Stores optional action text and size. |
| `InputGlyphElement:updateDisplayText()` | 270 | ✍ Derives the displayed text from the action text, upper-cased or lower-cased according to the flags, when an action text exists. |
| `InputGlyphElement:getGlyphWidth()` | 283 | ✍ Computes the total width of the currently resolved glyphs (gamepad icons with separators, or key caps), excluding the action text. |
| `InputGlyphElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 332 | ✍ Draws the glyphs (gamepad buttons or keyboard keys) right-aligned to the element unless left alignment is set, then the action text if any. Does nothing without actions or when the overlay is hidden. |
| `InputGlyphElement:drawControllerButtons(buttonOverlays: table, posX: number, posY: number, clipX1: any, clipY1: any, clipX2: any, clipY2: any) → number` | 381 | ✍ Renders each gamepad button overlay in order, inserting plus or or separator icons between them, and returns the X position after the last one. |
| `InputGlyphElement:drawActionText(posX: number, posY: number, clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 419 | ✍ Renders the action text after the glyphs using the stored size, bold flag and color, with an optional text clip area that is reset afterwards. |

## Messages

- subscribes `MessageType.INPUT_DEVICES_CHANGED` (l.71)
