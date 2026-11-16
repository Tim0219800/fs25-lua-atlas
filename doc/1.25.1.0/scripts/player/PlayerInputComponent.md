# player/PlayerInputComponent.lua

*[Version française](../../fr/scripts/player/PlayerInputComponent.md)*

Source: `dataS/scripts/player/PlayerInputComponent.lua` — FS25 1.25.1.0

✍ Collects raw input for one on-foot player (movement, look, run, jump, crouch, flight, camera switch, vehicle enter, hand tool and flashlight actions) and stores it as per-frame axis values that `PlayerMover`, `PlayerCamera` and the player states read. Only the owning player registers action events through `g_inputBinding` (and touch gestures when `g_touchHandler` exists). Several handlers it registers (zoom, flight toggle, hand tool, flashlight, pause actions) and helpers such as `setMovementDirection` are not in this dump (UNVERIFIED).

- **PlayerInputComponent** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerInputComponent.new(player: Player) → PlayerInputComponent` | 24 | ✍ Creates the input component for a player with all axes at zero, unlocked, and builds the flashlight on/off texts from the translation `storeItem_flashlight`. |
| `PlayerInputComponent:addPauseListeners(isControlling: boolean)` | 129 | ✍ If this player is controlled and a mission exists, subscribes `onGamePaused` to the mission's pause notifications; otherwise does nothing. |
| `PlayerInputComponent:registerActionEvents()` | 145 | ✍ Owner only: in the player input context, registers actions for move, look, zoom, run, flight, jump, crouch, camera switch, hand tool, enter and flashlight, plus touch gestures and pause actions. It also registers a target type (animals, vehicles, trees, dynamic objects, 0.5 to 3 m) on the player's targeter. |
| `PlayerInputComponent:unregisterActionEvents()` | 362 | ✍ Owner only: removes every action event registered by this component, the touch gesture listeners for pinch, Y and X, and the targeter type, then clears stored action ids. The double-tap listener is not removed here. |
| `PlayerInputComponent:resetState()` | 482 | ✍ Copies the current input values into the `last*` fields, then zeroes movement, run, flight, jump and camera inputs. Crouch is kept while the component is locked. |
| `PlayerInputComponent:lock()` | 522 | ✍ Remembers the current crouch value and ignores most input until unlocked. |
| `PlayerInputComponent:unlock()` | 529 | ✍ Unlocks input and, if the crouch input changed while locked, re-applies the crouch value stored during the lock. |
| `PlayerInputComponent:calculateNormalisedMovementDirection() → number, number` | 551 | ✍ Returns the move direction as a normalised 2D vector (right, forward) in the player's local space, or 0, 0 when there is no movement input. |
| `PlayerInputComponent:calculateNormalisedWorldMovementDirection() → number, number` | 583 | ✍ Converts the normalised local move direction into world x/z through the camera's yaw node. Returns 0, 0 without input or without a yaw node, so it only works for the controlled player. |
| `PlayerInputComponent:onInputMoveSide(_: nil, inputValue: number)` | 860 | ✍ Action callback for left/right movement: ignores locked input and values inside the joystick deadzone, clamps to -1..1, adds to `moveRight`, then updates the walk axis and world movement direction. |
| `PlayerInputComponent:onInputMoveForward(_: nil, inputValue: number)` | 890 | ✍ Action callback for forward/back movement: same filtering as the side movement, but the value is subtracted from `moveForward`. It then updates the walk axis and world direction. |
| `PlayerInputComponent:touchEventLookUpDown(value: any)` | 918 | ✍ Touch gesture handler for vertical look: ignored outside the player input context, otherwise scales the gesture by screen size and passes it to `onInputLookUpDown` as non-mouse input. |
| `PlayerInputComponent:touchEventZoomInOut(value: any)` | 929 | ✍ Touch pinch handler: ignored outside the player input context, otherwise forwards the scaled, inverted value to `onInputZoomInOut` (defined outside this dump). |
| `PlayerInputComponent:touchEventLookLeftRight(value: any)` | 939 | ✍ Touch gesture handler for horizontal look: ignored outside the player input context, otherwise scales by aspect ratio and passes it to `onInputLookLeftRight` as non-mouse input. |
| `PlayerInputComponent:onInputLookLeftRight(_: nil, inputValue: number, _: nil, _: nil, isMouse: boolean)` | 967 | ✍ Adds horizontal look input to `cameraRotationY`, skipping locked input and the deadzone. Mouse values use a fixed 16.666 ms step, other devices use the current frame time; also records whether the source was a mouse. |
| `PlayerInputComponent:onInputLookUpDown(_: nil, inputValue: number, _: nil, _: nil, isMouse: boolean)` | 1000 | ✍ Adds vertical look input to `cameraRotationX` with the same deadzone and timing rules as horizontal look, and flips the sign when the INVERT_Y_LOOK setting is on. |
| `PlayerInputComponent:onInputRun(_: nil, inputValue: number)` | 1052 | ✍ Sets the run axis from the input value clamped to 0..1, unless input is locked. |
| `PlayerInputComponent:onInputChangeAltitude(_: nil, inputValue: number)` | 1070 | ✍ Sets the flight axis (-1 down to 1 up) from the input value, unless input is locked. Used by the debug flight mode. |
| `PlayerInputComponent:onInputJump(_: nil, inputValue: number)` | 1088 | ✍ Sets the jump power from the input value clamped to 0..1, unless input is locked. |
| `PlayerInputComponent:onInputCrouch(_: nil, inputValue: number)` | 1106 | ✍ Stores the crouch value clamped to 0..1; while locked it is saved into the locked crouch value instead and applied on unlock. |
| `PlayerInputComponent:onInputSwitchCamera()` | 1121 | ✍ Toggles first/third person on the player's camera, unless input is locked or the player is in a vehicle. |
| `PlayerInputComponent:onInputEnter()` | 1138 | ✍ Handles the enter action: ignored within 200 ms of the last interaction. Interacts with the interactive vehicle in range, or else starts riding the targeted rideable animal (screen fade) or shows a critical notification if the ride limit is reached. `FSBaseMission` details are UNVERIFIED. |
| `PlayerInputComponent:onGamePaused(isPaused: boolean)` | 1209 | ✍ Pause listener: locks the input when the game pauses and unlocks it on resume. |
| `PlayerInputComponent:debugDraw(x: number, y: number, textSize: number) → number` | 1225 | ✍ Draws debug text for the previous frame's jump power, crouch and movement flag, then calls `debugDrawMovementGraphs` (not in this dump). Returns the next y position. |
