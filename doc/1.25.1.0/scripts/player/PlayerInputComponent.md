# player/PlayerInputComponent.lua

Source : `dataS/scripts/player/PlayerInputComponent.lua` — FS25 1.25.1.0

- **PlayerInputComponent** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerInputComponent.new(player: Player) → PlayerInputComponent` | 24 |  |
| `PlayerInputComponent:addPauseListeners(isControlling: boolean)` | 129 |  |
| `PlayerInputComponent:registerActionEvents()` | 145 |  |
| `PlayerInputComponent:unregisterActionEvents()` | 362 |  |
| `PlayerInputComponent:resetState()` | 482 |  |
| `PlayerInputComponent:lock()` | 522 |  |
| `PlayerInputComponent:unlock()` | 529 |  |
| `PlayerInputComponent:calculateNormalisedMovementDirection() → number, number` | 551 |  |
| `PlayerInputComponent:calculateNormalisedWorldMovementDirection() → number, number` | 583 |  |
| `PlayerInputComponent:onInputMoveSide(_: nil, inputValue: number)` | 860 |  |
| `PlayerInputComponent:onInputMoveForward(_: nil, inputValue: number)` | 890 |  |
| `PlayerInputComponent:touchEventLookUpDown(value: any)` | 918 |  |
| `PlayerInputComponent:touchEventZoomInOut(value: any)` | 929 |  |
| `PlayerInputComponent:touchEventLookLeftRight(value: any)` | 939 |  |
| `PlayerInputComponent:onInputLookLeftRight(_: nil, inputValue: number, _: nil, _: nil, isMouse: boolean)` | 967 |  |
| `PlayerInputComponent:onInputLookUpDown(_: nil, inputValue: number, _: nil, _: nil, isMouse: boolean)` | 1000 |  |
| `PlayerInputComponent:onInputRun(_: nil, inputValue: number)` | 1052 |  |
| `PlayerInputComponent:onInputChangeAltitude(_: nil, inputValue: number)` | 1070 |  |
| `PlayerInputComponent:onInputJump(_: nil, inputValue: number)` | 1088 |  |
| `PlayerInputComponent:onInputCrouch(_: nil, inputValue: number)` | 1106 |  |
| `PlayerInputComponent:onInputSwitchCamera()` | 1121 |  |
| `PlayerInputComponent:onInputEnter()` | 1138 |  |
| `PlayerInputComponent:onGamePaused(isPaused: boolean)` | 1209 |  |
| `PlayerInputComponent:debugDraw(x: number, y: number, textSize: number) → number` | 1225 |  |
