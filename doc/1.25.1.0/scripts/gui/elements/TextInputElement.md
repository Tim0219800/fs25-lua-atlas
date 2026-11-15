# gui/elements/TextInputElement.lua

Source : `dataS/scripts/gui/elements/TextInputElement.lua` — FS25 1.25.1.0

- **TextInputElement** hérite de `ButtonElement` (l.26)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TextInputElement.new(target: any, custom_mt: any)` | 44 |  |
| `TextInputElement:delete()` | 95 |  |
| `TextInputElement:translate(str: any)` | 103 |  |
| `TextInputElement:loadFromXML(xmlFile: any, key: any)` | 112 |  |
| `TextInputElement:loadProfile(profile: any, applyProfile: any)` | 148 |  |
| `TextInputElement:copyAttributes(src: any)` | 171 |  |
| `TextInputElement:finalize()` | 201 |  |
| `TextInputElement:getIsActive()` | 218 |  |
| `TextInputElement:setCaptureInput(isCapturing: any)` | 225 |  |
| `TextInputElement:setAlpha(alpha: any)` | 277 |  |
| `TextInputElement:getDoRenderText()` | 286 |  |
| `TextInputElement:reset()` | 292 |  |
| `TextInputElement:setText(text: any)` | 302 |  |
| `TextInputElement:setForcePressed(force: any)` | 317 |  |
| `TextInputElement:getIsUnicodeAllowed(unicode: any)` | 349 |  |
| `TextInputElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 362 |  |
| `TextInputElement:moveCursorLeft(isLeftCtrlPressed: any)` | 417 |  |
| `TextInputElement:moveCursorRight(isLeftCtrlPressed: any)` | 437 |  |
| `TextInputElement:setCursorPosition(position: any)` | 453 |  |
| `TextInputElement:deleteText(deleteRightCharacterFromCursor: any)` | 459 |  |
| `TextInputElement:stopSpecialKeyRepeating()` | 492 |  |
| `TextInputElement:openIme()` | 507 |  |
| `TextInputElement:abortIme()` | 521 |  |
| `TextInputElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 533 |  |
| `TextInputElement:inputEvent(action: any, value: any, eventUsed: any)` | 658 |  |
| `TextInputElement:update(dt: any)` | 687 |  |
| `TextInputElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 742 |  |
| `TextInputElement:shouldFocusChange(direction: any)` | 802 |  |
| `TextInputElement:onFocusLeave()` | 808 |  |
| `TextInputElement:onFocusActivate()` | 816 |  |
| `TextInputElement:onClose()` | 835 |  |
| `TextInputElement:drawTextPart(text: any, textXPos: any, displacementX: any, textYPos: any)` | 844 |  |
| `TextInputElement:drawCursor(textXPos: any, displacementX: any, textYPos: any)` | 871 |  |
| `TextInputElement:updateVisibleTextElements()` | 883 |  |
| `TextInputElement.limitTextToAvailableWidth(text: any, textSize: any, availableWidth: any, trimFront: any)` | 1025 |  |
| `TextInputElement:getAvailableTextWidth()` | 1055 |  |
| `TextInputElement:getNeededTextWidth()` | 1079 |  |
| `TextInputElement:getText()` | 1106 |  |

## Messages

- écoute `MessageType.PAUSE` (l.511)
