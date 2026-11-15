# gui/elements/ButtonElement.lua

Source: `dataS/scripts/gui/elements/ButtonElement.lua` — FS25 1.25.1.0

- **ButtonElement** inherits from `TextElement` (l.32)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ButtonElement.new(target: any, custom_mt: any)` | 39 |  |
| `ButtonElement:delete()` | 86 |  |
| `ButtonElement:loadFromXML(xmlFile: any, key: any)` | 96 |  |
| `ButtonElement:loadProfile(profile: any, applyProfile: any)` | 156 |  |
| `ButtonElement:copyAttributes(src: any)` | 215 |  |
| `ButtonElement:loadInputGlyphColors(profile: profile, xmlFile: xmlFile, key: key)` | 263 |  |
| `ButtonElement:setInputMode(isKeyboardMode: any, isTouchMode: any, isGamepadMode: any)` | 306 |  |
| `ButtonElement:setAlpha(alpha: any)` | 337 |  |
| `ButtonElement:setDisabled(disabled: any)` | 349 |  |
| `ButtonElement:setInputAction(inputActionName: any)` | 362 |  |
| `ButtonElement:onOpen()` | 371 |  |
| `ButtonElement:onClose()` | 383 |  |
| `ButtonElement:reset()` | 390 |  |
| `ButtonElement:setImageFilename(filename: any, iconFilename: any)` | 401 |  |
| `ButtonElement:setImageUVs(backgroundUVs: any, iconUVs: any)` | 412 |  |
| `ButtonElement:setImageSlice(backgroundSliceId: any, iconSliceId: any)` | 424 |  |
| `ButtonElement:getIsActive()` | 439 |  |
| `ButtonElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 446 |  |
| `ButtonElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 511 |  |
| `ButtonElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 575 |  |
| `ButtonElement:getIconOffset(textWidth: any, textHeight: any)` | 584 |  |
| `ButtonElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 607 |  |
| `ButtonElement:getIconModifiedTextOffset(textOffsetX: number, textOffsetY: number) → number, number` | 689 |  |
| `ButtonElement:getTextOffset()` | 704 |  |
| `ButtonElement:getText2Offset()` | 716 |  |
| `ButtonElement:getIconSize()` | 723 |  |
| `ButtonElement:setIconSize(x: any, y: any)` | 733 |  |
| `ButtonElement:canReceiveFocus()` | 743 |  |
| `ButtonElement:onFocusLeave()` | 749 |  |
| `ButtonElement:onFocusEnter()` | 757 |  |
| `ButtonElement:onHighlight()` | 765 |  |
| `ButtonElement:onHighlightRemove()` | 773 |  |
| `ButtonElement:onFocusActivate()` | 781 |  |
| `ButtonElement:getIsPressed()` | 804 |  |
| `ButtonElement:getOverlayState()` | 810 |  |
| `ButtonElement:updateSize(forceTextSize: any)` | 828 |  |
| `ButtonElement:setText(text: any, forceTextSize: any, isInitializing: any, forceScrollingParameterUpdate: any)` | 876 |  |
| `ButtonElement:setTextSize(size: any)` | 888 |  |
| `ButtonElement:setClickSound(soundName: any)` | 896 |  |
