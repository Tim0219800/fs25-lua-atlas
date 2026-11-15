# gui/hud/InputGlyphElement.lua

Source : `dataS/scripts/gui/hud/InputGlyphElement.lua` — FS25 1.25.1.0

- **InputGlyphElement** hérite de `HUDElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InputGlyphElement.new(inputDisplayManager: table, baseWidth: number, baseHeight: number, customMt: any)` | 28 |  |
| `InputGlyphElement:delete()` | 78 |  |
| `InputGlyphElement:setScale(widthScale: number, heightScale: number)` | 93 |  |
| `InputGlyphElement:setUpperCase(enableUpperCase: any)` | 107 |  |
| `InputGlyphElement:setLowerCase(enableLowerCase: any)` | 116 |  |
| `InputGlyphElement:setBold(isBold: any)` | 124 |  |
| `InputGlyphElement:setKeyboardGlyphColor(color: table, bgColor: any)` | 131 |  |
| `InputGlyphElement:setButtonGlyphColor(color: table)` | 148 |  |
| `InputGlyphElement:setAction(actionName: string, actionText: string?, actionTextSize: number?, noModifiers: boolean?)` | 171 |  |
| `InputGlyphElement:setActions(actionNames: table, actionText: string?, actionTextSize: number?, noModifiers: boolean?, customBinding: any)` | 186 |  |
| `InputGlyphElement:updateDisplayText()` | 270 |  |
| `InputGlyphElement:getGlyphWidth()` | 283 |  |
| `InputGlyphElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 332 |  |
| `InputGlyphElement:drawControllerButtons(buttonOverlays: table, posX: number, posY: number, clipX1: any, clipY1: any, clipX2: any, clipY2: any) → number` | 381 |  |
| `InputGlyphElement:drawActionText(posX: number, posY: number, clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 419 |  |

## Messages

- écoute `MessageType.INPUT_DEVICES_CHANGED` (l.71)
