# gui/hud/SpeedSliderDisplay.lua

Source : `dataS/scripts/gui/hud/SpeedSliderDisplay.lua` — FS25 1.25.1.0

- **SpeedSliderDisplay** hérite de `HUDDisplayElement` (l.30)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SpeedSliderDisplay.new(hud: string, hudAtlasPath: string, controlHudAtlasPath: any)` | 47 |  |
| `SpeedSliderDisplay:delete()` | 79 |  |
| `SpeedSliderDisplay:createComponents()` | 88 |  |
| `SpeedSliderDisplay:setSliderState(state: any)` | 181 |  |
| `SpeedSliderDisplay:hideSlider()` | 193 |  |
| `SpeedSliderDisplay:showSlider()` | 210 |  |
| `SpeedSliderDisplay:updateElementsVisibility()` | 228 |  |
| `SpeedSliderDisplay:onSliderVisibilityChangeFinished(visibility: any)` | 236 |  |
| `SpeedSliderDisplay:setVehicle(vehicle: table)` | 245 |  |
| `SpeedSliderDisplay:setPlayer(player: any)` | 279 |  |
| `SpeedSliderDisplay:createBar(position: any, size: any, color: any)` | 319 |  |
| `SpeedSliderDisplay:onSliderPositionChanged(position: any)` | 331 |  |
| `SpeedSliderDisplay:getAccelerateAndBrakeValue()` | 362 |  |
| `SpeedSliderDisplay:onJumpEventCallback()` | 368 |  |
| `SpeedSliderDisplay:update(dt: any)` | 392 |  |
| `SpeedSliderDisplay:getIsSliderActive()` | 426 |  |
| `SpeedSliderDisplay:onInputHelpModeChange(inputHelpMode: any)` | 448 |  |
| `SpeedSliderDisplay:onAIVehicleStateChanged(state: any, vehicle: any)` | 461 |  |
| `SpeedSliderDisplay:updateVisibilityState()` | 469 |  |
| `SpeedSliderDisplay:draw()` | 478 |  |
| `SpeedSliderDisplay:onDialogOpened(guiName: any, overlappingDialog: any)` | 522 |  |
| `SpeedSliderDisplay:onGuiOpen()` | 531 |  |
| `SpeedSliderDisplay:setScale(uiScale: any)` | 545 |  |
| `SpeedSliderDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 580 |  |
| `SpeedSliderDisplay.createBackground()` | 599 |  |

## Messages

- écoute `MessageType.GUI_BEFORE_OPEN` (l.69)
- écoute `MessageType.GUI_DIALOG_OPENED` (l.70)
- écoute `MessageType.GUIDED_TOUR_DIALOG` (l.71)
- écoute `MessageType.INSETS_CHANGED` (l.72)
