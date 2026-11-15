# gui/hud/HUDPopupMessageMobile.lua

Source : `dataS/scripts/gui/hud/HUDPopupMessageMobile.lua` — FS25 1.25.1.0

- **HUDPopupMessageMobile** hérite de `HUDDisplayElement` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDPopupMessageMobile.new(hudAtlasPath: string, ingameMap: ingameMap) → table` | 39 |  |
| `HUDPopupMessageMobile:showMessage(title: table?, text: function?, duration: table?, controls: table?, callback: function?, target: table?)` | 83 |  |
| `HUDPopupMessageMobile:getVisible()` | 121 |  |
| `HUDPopupMessageMobile:getHidingTranslation() → number, number` | 130 |  |
| `HUDPopupMessageMobile:assignCurrentMessage(message: any)` | 137 |  |
| `HUDPopupMessageMobile:setCurrentMessageHeight()` | 155 |  |
| `HUDPopupMessageMobile:getTitleHeight()` | 168 |  |
| `HUDPopupMessageMobile:getTextHeight()` | 188 |  |
| `HUDPopupMessageMobile:getInputRowsHeight()` | 206 |  |
| `HUDPopupMessageMobile:animateHide()` | 218 |  |
| `HUDPopupMessageMobile:startMessage()` | 229 |  |
| `HUDPopupMessageMobile:finishMessage()` | 240 |  |
| `HUDPopupMessageMobile:update(dt: any)` | 260 |  |
| `HUDPopupMessageMobile:updateCurrentMessage()` | 285 |  |
| `HUDPopupMessageMobile:updateButtonGlyphs()` | 305 |  |
| `HUDPopupMessageMobile:setInputActive(isActive: any)` | 333 |  |
| `HUDPopupMessageMobile:onConfirmMessage(actionName: any, inputValue: any)` | 355 |  |
| `HUDPopupMessageMobile:draw()` | 376 |  |
| `HUDPopupMessageMobile.getBackgroundPosition(uiScale: number)` | 441 |  |
| `HUDPopupMessageMobile:setScale(uiScale: any)` | 448 |  |
| `HUDPopupMessageMobile:setDimension(width: any, height: any)` | 460 |  |
| `HUDPopupMessageMobile:storeScaledValues()` | 466 |  |
| `HUDPopupMessageMobile.createBackground(hudAtlasPath: any)` | 490 |  |
| `HUDPopupMessageMobile:createComponents(hudAtlasPath: any)` | 502 |  |
| `HUDPopupMessageMobile:createInputRow(hudAtlasPath: any, posX: any, posY: any)` | 531 |  |
