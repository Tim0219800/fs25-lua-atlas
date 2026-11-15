# gui/hud/ControlBarDisplay.lua

Source: `dataS/scripts/gui/hud/ControlBarDisplay.lua` — FS25 1.25.1.0

- **ControlBarDisplay** inherits from `HUDDisplayElement` (l.34)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ControlBarDisplay.new(hud: string, hudAtlasPath: string, controlHudAtlasPath: any)` | 39 |  |
| `ControlBarDisplay:createComponents()` | 226 |  |
| `ControlBarDisplay:setVehicle(vehicle: table)` | 320 |  |
| `ControlBarDisplay:setPlayer(player: any)` | 339 |  |
| `ControlBarDisplay:update(dt: any)` | 347 |  |
| `ControlBarDisplay:onInputHelpModeChange(inputHelpMode: any, force: any)` | 499 |  |
| `ControlBarDisplay:onAIVehicleStateChanged(state: any, vehicle: any, force: any)` | 506 |  |
| `ControlBarDisplay:onGyroscopeSteeringChanged(state: any)` | 513 |  |
| `ControlBarDisplay:updatePositionState(force: any)` | 531 |  |
| `ControlBarDisplay:setPositionState(state: any, force: any)` | 550 |  |
| `ControlBarDisplay:addFillLevelControl()` | 583 |  |
| `ControlBarDisplay:addFillLevel(fillType: any, fillLevel: any, capacity: any, precision: any, maxReached: any)` | 620 |  |
| `ControlBarDisplay:updateFillLevelBuffers(vehicle: any)` | 650 |  |
| `ControlBarDisplay.sortFillLevelBuffers(a: any, b: any)` | 691 |  |
| `ControlBarDisplay:updateFillLevelControl(fillLevelControl: any, fillLevelBuffer: any)` | 697 |  |
| `ControlBarDisplay:setScale(uiScale: any)` | 756 |  |
| `ControlBarDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 784 |  |
| `ControlBarDisplay.createBackground()` | 795 |  |
