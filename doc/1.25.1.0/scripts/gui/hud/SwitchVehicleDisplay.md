# gui/hud/SwitchVehicleDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/SwitchVehicleDisplay.md)*

Source: `dataS/scripts/gui/hud/SwitchVehicleDisplay.lua` — FS25 1.25.1.0

✍ Touch/mobile HUD element (HUDDisplayElement subclass) with left/right arrows and input glyphs to cycle through the player vehicles via g_localPlayer. It slides between a controller position and a touch position depending on input mode, gyroscope steering and platform touch support. Client-side only. createBackgroundElements is called here but not defined in this file (UNVERIFIED).

- **SwitchVehicleDisplay** inherits from `HUDDisplayElement` (l.34)

## Functions

| Function | Line | Description |
|---|---|---|
| `SwitchVehicleDisplay.new(hud: string, hudAtlasPath: string, controlHudAtlasPath: any)` | 39 | ✍ Creates the display on an empty positioning overlay, initialises state (no vehicle/player, empty touch button and control lists) and builds the components. |
| `SwitchVehicleDisplay:setVehicle(vehicle: table)` | 75 | ✍ Stores the controlled vehicle and updates the position state. |
| `SwitchVehicleDisplay:setPlayer(player: any)` | 83 | ✍ Stores the on-foot player and updates the position state. |
| `SwitchVehicleDisplay:createComponents()` | 173 | ✍ Builds the background, icon, the two input glyphs (switch vehicle and switch back), the left and right arrow overlays and registers three touch handlers per arrow (release, press, cancel) with the HUD. Stores the touch and gamepad target positions. |
| `SwitchVehicleDisplay:onSwitchLeft(x: any, y: any, isCancel: any)` | 234 | ✍ Left arrow handler: unless sleeping, inactive or cancelled, makes the local player cycle to the previous vehicle (-1). |
| `SwitchVehicleDisplay:onSwitchRight(x: any, y: any, isCancel: any)` | 250 | ✍ Right arrow handler: unless sleeping, inactive or cancelled, makes the local player cycle to the next vehicle (+1). |
| `SwitchVehicleDisplay:updatePositionState(force: any)` | 301 | ✍ Chooses the controller state for gamepad input, no touch sliders, or gyroscope steering while in a vehicle; otherwise the touch state. Applies it through setPositionState. |
| `SwitchVehicleDisplay:onInputHelpModeChange(inputHelpMode: any, force: any)` | 315 | ✍ Stores the new input help mode and updates the position state, optionally forced. |
| `SwitchVehicleDisplay:onGyroscopeSteeringChanged(state: any)` | 322 | ✍ Stores the gyroscope steering state and updates the position state. |
| `SwitchVehicleDisplay:setPositionState(state: any, force: any)` | 329 | ✍ Tweens the display to the gamepad or touch position when the state changes (faster towards touch, near-instant when forced). Does nothing on platforms without touch sliders. |
| `SwitchVehicleDisplay:setScale(uiScale: any)` | 366 | ✍ Applies a new UI scale: resizes the element, recomputes touch and gamepad positions and the stored original position, and keeps the touch position when that state is active. |
| `SwitchVehicleDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 394 | ✍ Returns the screen position of the display for the given scale (the width argument is unused). |
| `SwitchVehicleDisplay.createBackground()` | 405 | ✍ Creates the empty overlay used only as the positioning frame of the display. |
