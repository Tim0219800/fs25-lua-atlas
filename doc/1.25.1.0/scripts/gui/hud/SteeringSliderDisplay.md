# gui/hud/SteeringSliderDisplay.lua

Source : `dataS/scripts/gui/hud/SteeringSliderDisplay.lua` — FS25 1.25.1.0

- **SteeringSliderDisplay** hérite de `HUDDisplayElement` (l.31)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SteeringSliderDisplay.new(hud: string, hudAtlasPath: string)` | 36 |  |
| `SteeringSliderDisplay:delete()` | 63 |  |
| `SteeringSliderDisplay:setVehicle(vehicle: table)` | 72 |  |
| `SteeringSliderDisplay:setPlayer(player: any)` | 83 |  |
| `SteeringSliderDisplay:createComponents()` | 91 |  |
| `SteeringSliderDisplay:setVisible(isVisible: boolean, animate: boolean)` | 140 |  |
| `SteeringSliderDisplay:onSliderPositionChanged(position: any)` | 148 |  |
| `SteeringSliderDisplay:getSteeringValue()` | 154 |  |
| `SteeringSliderDisplay:getIsSliderActive()` | 173 |  |
| `SteeringSliderDisplay:onInputHelpModeChange(inputHelpMode: any)` | 200 |  |
| `SteeringSliderDisplay:onAIVehicleStateChanged(state: any, vehicle: any)` | 208 |  |
| `SteeringSliderDisplay:onGyroscopeSteeringChanged(state: any)` | 214 |  |
| `SteeringSliderDisplay:updateVisibilityState()` | 222 |  |
| `SteeringSliderDisplay:onSteeringBackSpeedSettingChanged()` | 232 |  |
| `SteeringSliderDisplay:update(dt: any)` | 244 |  |
| `SteeringSliderDisplay:setScale(uiScale: any)` | 280 |  |
| `SteeringSliderDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 303 |  |
| `SteeringSliderDisplay.createBackground()` | 314 |  |

## Messages

- écoute `MessageType.SETTING_CHANGED` (l.56)
